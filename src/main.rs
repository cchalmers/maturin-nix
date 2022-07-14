use maturin::*;
use std::path::PathBuf;
use std::process;
// use structopt::clap::AppSettings;
// use structopt::StructOpt;
use clap::Parser;

/// Build python wheels
#[derive(Debug, Parser)]
struct Info {
    /// The name of the python module to create. This module name must match that of the library in
    /// the wheel or the wheel will fail when trying to import.
    #[clap(long)]
    module_name: String,

    /// Path to the Cargo.toml file. This file is used to provide the metadata for the python
    /// wheel. Be aware that if this points to readme file, that readme file should also be in the
    /// same folder.
    #[clap(long)]
    manifest_path: PathBuf,
}

impl Info {
    fn meta21(&self) -> Metadata21 {
        let cargo_toml = CargoToml::from_path(&self.manifest_path).expect("manifest_file");

        // The manifest directory is only used when the target toml file points to a readme.
        let manifest_dir = self.manifest_path.parent().unwrap();

        Metadata21::from_cargo_toml(&cargo_toml, &manifest_dir).expect("metadata21")
    }
}

/// Build python wheels
#[derive(Debug, Parser)]
#[clap(
    name = "maturin-nix",
    about = "Tool for building pyo3 wheels inside nix",
    // global_settings(&[AppSettings::ColoredHelp, AppSettings::VersionlessSubcommands])
)]

enum Opt {
    #[structopt(name = "wheel-names")]
    /// Prints out the names of wheels that will be generated. The name of wheel is determined by
    /// the package name, package version, python version and platform compiled for.
    WheelNames {
        #[structopt(flatten)]
        info: Info,

        /// Expect a single python version to be available and will error if not.
        #[structopt(long)]
        expect_one: bool,
    },

    #[structopt(name = "build")]
    /// Build the crate into wheels
    Build {
        #[structopt(flatten)]
        info: Info,

        /// The path to the rustc artifact for a library. This library must have a crate-type of
        /// "cdylib". On macOS the library should also be compiled with
        ///  "-C link-arg=-undefined -C link-arg=dynamic_lookup";
        #[structopt(long)]
        artifact_path: PathBuf,

        /// The directory to store the output wheel.
        #[structopt(long)]
        output_dir: PathBuf,
    },
}

fn main() -> anyhow::Result<()> {
    let opt = Opt::from_args();

    let target = Target::from_target_triple(None)?;
    let bridge = BridgeModel::Cffi;
    let python_interpreters =
        PythonInterpreter::find_all(&target, &bridge, None)?;

    match opt {
        Opt::WheelNames { info, expect_one } => {
            let metadata21 = info.meta21();

            if expect_one && python_interpreters.len() != 1 {
                let err = ansi_term::Color::Red.bold().paint("error:");
                if python_interpreters.len() == 0 {
                    eprintln!("{} no python versions found", err);
                    process::exit(1);
                }
                eprintln!("{} multiple python versions found:", err);

                for py in &python_interpreters {
                    eprintln!("  {}", py);
                }
                process::exit(1);
            }

            for py in python_interpreters {
                let tag = py.get_tag(&target, &[maturin::PlatformTag::Linux], false)?;
                let wheel_path = format!(
                    "{}-{}-{}.whl",
                    metadata21.get_distribution_escaped(),
                    metadata21.get_version_escaped(),
                    tag
                );
                println!("{}", wheel_path);
            }
        }
        Opt::Build {
            info,
            artifact_path,
            output_dir,
        } => {
            for py in python_interpreters {
                let tag = py.get_tag(&target, &[maturin::PlatformTag::Linux], false)?;

                let mut writer = WheelWriter::new(
                    &tag,
                    &output_dir,
                    &info.meta21(),
                    &[tag.clone()],
                )?;

                let so_filename = py.get_library_name(&info.module_name);

                writer
                    .add_file(so_filename, &artifact_path)?;

                let wheel_path = writer.finish()?;

                eprintln!("📦 successfuly created wheel {}", wheel_path.display());
            }
        }
    }
    Ok(())
}
