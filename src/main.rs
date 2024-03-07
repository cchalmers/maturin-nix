use ignore::overrides::Override;
use maturin::*;
use std::path::PathBuf;
use std::process;
use structopt::clap::AppSettings;
use structopt::StructOpt;

/// Build python wheels
#[derive(Debug, StructOpt)]
struct Info {
    /// The name of the python module to create. This module name must match that of the library in
    /// the wheel or the wheel will fail when trying to import.
    #[structopt(long = "module-name")]
    module_name: String,

    /// Don't tag the .so module with ABI and platform information. These tags will be in the wheel
    /// anyway, and maturin's tags are more restrictive than they need to be (e.g. does not tag
    /// with abi3).
    #[structopt(long)]
    no_module_tag: bool,

    /// Path to the Cargo.toml file. This file is used to provide the metadata for the python
    /// wheel. Be aware that if this points to readme file, that readme file should also be in the
    /// same folder.
    #[structopt(long = "manifest-path")]
    manifest_path: PathBuf,
}

impl Info {
    fn meta21(&self) -> Metadata23 {
        let metadata = self.cargo_metadata();

        Metadata23::from_cargo_toml(&self.manifest_path, &metadata).expect("metadata21")
    }

    fn cargo_metadata(&self) -> cargo_metadata::Metadata {
        cargo_metadata::MetadataCommand::new()
            .manifest_path(&self.manifest_path)
            .exec()
            .unwrap()
    }
}

/// Build python wheels
#[derive(Debug, StructOpt)]
#[structopt(
    name = "maturin-nix",
    about = "Tool for building pyo3 wheels inside nix",
    global_settings(&[AppSettings::ColoredHelp, AppSettings::VersionlessSubcommands])
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

fn main() {
    let opt = Opt::from_args();

    let target = Target::from_target_triple(None).expect("target triple");
    let bridge = BridgeModel::Cffi;
    let python_interpreters =
        PythonInterpreter::find_all(&target, &bridge, None).expect("python_interpreter");

    let get_wheel_tag = |python_interpreter: &PythonInterpreter| {
        format!(
            "cp{major}{minor}-cp{major}{minor}-{os}_{arch}",
            major = python_interpreter.major,
            minor = python_interpreter.minor,
            os = target.get_python_os(),
            arch = target.get_python_arch(),
        )
    };

    match opt {
        Opt::WheelNames { info, expect_one } => {
            let metadata21 = info.meta21();

            if expect_one && python_interpreters.len() != 1 {
                let err = ansi_term::Color::Red.bold().paint("error:");
                if python_interpreters.is_empty() {
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
                let tag = get_wheel_tag(&py);
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
            for python_interpreter in python_interpreters {
                let tag = get_wheel_tag(&python_interpreter);

                let mut writer = WheelWriter::new(
                    &tag,
                    &output_dir,
                    &info.meta21(),
                    &[tag.clone()],
                    Override::empty(),
                )
                .expect("writer");

                let so_filename = if info.no_module_tag {
                    // Assumes Unix
                    format!("{}.so", info.module_name)
                } else {
                    python_interpreter.get_library_name(&info.module_name)
                };

                writer
                    .add_file(so_filename, &artifact_path)
                    .expect("add files");

                let wheel_path = writer.finish().expect("writer finish");

                eprintln!("📦 successfuly created wheel {}", wheel_path.display());
            }
        }
    }
}
