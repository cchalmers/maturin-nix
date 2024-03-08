use maturin::*;
use std::path::PathBuf;
use structopt::clap::AppSettings;
use structopt::StructOpt;

/// Build python wheels
#[derive(Debug, StructOpt)]
struct Info {
    /// The name of the python module to create. This module name must match that of the library in
    /// the wheel or the wheel will fail when trying to import.
    #[structopt(long = "module-name")]
    module_name: String,

    /// Assume the module is abi3 compatible. This tags the wheel with an abi3 tag, and also
    /// doesn't bother to tag the .so inside the wheel with any tag.
    #[structopt(long)]
    abi3: bool,

    /// Path to the Cargo.toml file. This file is used to provide the metadata for the python
    /// wheel. Be aware that if this points to readme file, that readme file should also be in the
    /// same folder.
    #[structopt(long = "manifest-path")]
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
#[derive(Debug, StructOpt)]
#[structopt(
    name = "maturin-nix",
    about = "Tool for building pyo3 wheels inside nix",
    global_settings(&[AppSettings::ColoredHelp, AppSettings::VersionlessSubcommands])
)]

enum Opt {
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

    match opt {
        Opt::Build {
            info,
            artifact_path,
            output_dir,
        } => {
            let build_wheel = |py: &Option<PythonInterpreter>| {
                let tag = if let Some(py) = py {
                    // manylinux basically says that there should be a bunch of standard libraries in standard
                    // places. This doesn't play nicely with nix so we don't use it.
                    py.get_tag(&Manylinux::Off)
                } else {
                    // Oldest supported (listed in docs) by pyo3
                    let python_tag = "cp37";
                    let abi_tag = "abi3";
                    let platform_tag = "linux_x86_64";
                    format!("{}-{}-{}", python_tag, abi_tag, platform_tag)
                };

                let mut writer = WheelWriter::new(
                    &tag,
                    &output_dir,
                    &info.meta21(),
                    &std::collections::HashMap::default(),
                    &[tag.clone()],
                )
                .expect("writer");

                let so_filename = if let Some(py) = py {
                    py.get_library_name(&info.module_name)
                } else {
                    // Assumes Unix
                    format!("{}.so", info.module_name)
                };

                writer
                    .add_file(so_filename, &artifact_path)
                    .expect("add files");

                let wheel_path = writer.finish().expect("writer finish");

                eprintln!("📦 successfuly created wheel {}", wheel_path.display());
            };

            if info.abi3 {
                build_wheel(&None);
            } else {
                let target = Target::current();
                let bridge = BridgeModel::Cffi;
                println!("Looking for interpreters...");
                let python_interpreters =
                    PythonInterpreter::find_all(&target, &bridge).expect("python_interpreter");

                if python_interpreters.is_empty() {
                    panic!("Couldn't find any recognised Python interpreters")
                }

                for py in python_interpreters {
                    println!("Found {:?}", py);
                    build_wheel(&Some(py));
                }
            }
        }
    }
}
