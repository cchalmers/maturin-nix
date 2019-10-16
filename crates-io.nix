{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# adler32-1.0.3

  crates.adler32."1.0.3" = deps: { features?(features_.adler32."1.0.3" deps {}) }: buildRustCrate {
    crateName = "adler32";
    version = "1.0.3";
    authors = [ "Remi Rampin <remirampin@gmail.com>" ];
    sha256 = "1z3mvjgw02mbqk98kizzibrca01d5wfkpazsrp3vkkv3i56pn6fb";
  };
  features_.adler32."1.0.3" = deps: f: updateFeatures f (rec {
    adler32."1.0.3".default = (f.adler32."1.0.3".default or true);
  }) [];


# end
# aho-corasick-0.7.4

  crates.aho_corasick."0.7.4" = deps: { features?(features_.aho_corasick."0.7.4" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.7.4";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1njpvqirz7rpbc7w07a5w5fk294w23zks28d89g46mr57j6pffy5";
    libName = "aho_corasick";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.7.4"."memchr"}" deps)
    ]);
    features = mkFeatures (features."aho_corasick"."0.7.4" or {});
  };
  features_.aho_corasick."0.7.4" = deps: f: updateFeatures f (rec {
    aho_corasick = fold recursiveUpdate {} [
      { "0.7.4".default = (f.aho_corasick."0.7.4".default or true); }
      { "0.7.4".std =
        (f.aho_corasick."0.7.4".std or false) ||
        (f.aho_corasick."0.7.4".default or false) ||
        (aho_corasick."0.7.4"."default" or false); }
    ];
    memchr = fold recursiveUpdate {} [
      { "${deps.aho_corasick."0.7.4".memchr}"."use_std" =
        (f.memchr."${deps.aho_corasick."0.7.4".memchr}"."use_std" or false) ||
        (aho_corasick."0.7.4"."std" or false) ||
        (f."aho_corasick"."0.7.4"."std" or false); }
      { "${deps.aho_corasick."0.7.4".memchr}".default = (f.memchr."${deps.aho_corasick."0.7.4".memchr}".default or false); }
    ];
  }) [
    (features_.memchr."${deps."aho_corasick"."0.7.4"."memchr"}" deps)
  ];


# end
# ansi_term-0.11.0

  crates.ansi_term."0.11.0" = deps: { features?(features_.ansi_term."0.11.0" deps {}) }: buildRustCrate {
    crateName = "ansi_term";
    version = "0.11.0";
    authors = [ "ogham@bsago.me" "Ryan Scheel (Havvy) <ryan.havvy@gmail.com>" "Josh Triplett <josh@joshtriplett.org>" ];
    sha256 = "08fk0p2xvkqpmz3zlrwnf6l8sj2vngw464rvzspzp31sbgxbwm4v";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."ansi_term"."0.11.0"."winapi"}" deps)
    ]) else []);
  };
  features_.ansi_term."0.11.0" = deps: f: updateFeatures f (rec {
    ansi_term."0.11.0".default = (f.ansi_term."0.11.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.ansi_term."0.11.0".winapi}"."consoleapi" = true; }
      { "${deps.ansi_term."0.11.0".winapi}"."errhandlingapi" = true; }
      { "${deps.ansi_term."0.11.0".winapi}"."processenv" = true; }
      { "${deps.ansi_term."0.11.0".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."ansi_term"."0.11.0"."winapi"}" deps)
  ];


# end
# arrayvec-0.4.10

  crates.arrayvec."0.4.10" = deps: { features?(features_.arrayvec."0.4.10" deps {}) }: buildRustCrate {
    crateName = "arrayvec";
    version = "0.4.10";
    authors = [ "bluss" ];
    sha256 = "0qbh825i59w5wfdysqdkiwbwkrsy7lgbd4pwbyb8pxx8wc36iny8";
    dependencies = mapFeatures features ([
      (crates."nodrop"."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
    ]);
    features = mkFeatures (features."arrayvec"."0.4.10" or {});
  };
  features_.arrayvec."0.4.10" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "0.4.10".default = (f.arrayvec."0.4.10".default or true); }
      { "0.4.10".serde =
        (f.arrayvec."0.4.10".serde or false) ||
        (f.arrayvec."0.4.10".serde-1 or false) ||
        (arrayvec."0.4.10"."serde-1" or false); }
      { "0.4.10".std =
        (f.arrayvec."0.4.10".std or false) ||
        (f.arrayvec."0.4.10".default or false) ||
        (arrayvec."0.4.10"."default" or false); }
    ];
    nodrop."${deps.arrayvec."0.4.10".nodrop}".default = (f.nodrop."${deps.arrayvec."0.4.10".nodrop}".default or false);
  }) [
    (features_.nodrop."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
  ];


# end
# atty-0.2.11

  crates.atty."0.2.11" = deps: { features?(features_.atty."0.2.11" deps {}) }: buildRustCrate {
    crateName = "atty";
    version = "0.2.11";
    authors = [ "softprops <d.tangren@gmail.com>" ];
    sha256 = "0by1bj2km9jxi4i4g76zzi76fc2rcm9934jpnyrqd95zw344pb20";
    dependencies = (if kernel == "redox" then mapFeatures features ([
      (crates."termion"."${deps."atty"."0.2.11"."termion"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."atty"."0.2.11"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."atty"."0.2.11"."winapi"}" deps)
    ]) else []);
  };
  features_.atty."0.2.11" = deps: f: updateFeatures f (rec {
    atty."0.2.11".default = (f.atty."0.2.11".default or true);
    libc."${deps.atty."0.2.11".libc}".default = (f.libc."${deps.atty."0.2.11".libc}".default or false);
    termion."${deps.atty."0.2.11".termion}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.atty."0.2.11".winapi}"."consoleapi" = true; }
      { "${deps.atty."0.2.11".winapi}"."minwinbase" = true; }
      { "${deps.atty."0.2.11".winapi}"."minwindef" = true; }
      { "${deps.atty."0.2.11".winapi}"."processenv" = true; }
      { "${deps.atty."0.2.11".winapi}"."winbase" = true; }
      { "${deps.atty."0.2.11".winapi}".default = true; }
    ];
  }) [
    (features_.termion."${deps."atty"."0.2.11"."termion"}" deps)
    (features_.libc."${deps."atty"."0.2.11"."libc"}" deps)
    (features_.winapi."${deps."atty"."0.2.11"."winapi"}" deps)
  ];


# end
# autocfg-0.1.4

  crates.autocfg."0.1.4" = deps: { features?(features_.autocfg."0.1.4" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.4";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "1xhpq1h2rqhqx95rc20x3wxi5yhv4a62jr269b8dqyhp8r84ss9i";
  };
  features_.autocfg."0.1.4" = deps: f: updateFeatures f (rec {
    autocfg."0.1.4".default = (f.autocfg."0.1.4".default or true);
  }) [];


# end
# backtrace-0.3.32

  crates.backtrace."0.3.32" = deps: { features?(features_.backtrace."0.3.32" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.32";
    authors = [ "The Rust Project Developers" ];
    edition = "2018";
    sha256 = "0f20pb4jm5lgv27mv3skbvlq7c2mysk7k4lvgwsgbjmdmclc14bd";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.32"."cfg_if"}" deps)
      (crates."libc"."${deps."backtrace"."0.3.32"."libc"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.32"."rustc_demangle"}" deps)
    ]
      ++ (if features.backtrace."0.3.32".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.32".backtrace_sys}" deps) ] else []))
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."backtrace"."0.3.32" or {});
  };
  features_.backtrace."0.3.32" = deps: f: updateFeatures f (rec {
    backtrace = fold recursiveUpdate {} [
      { "0.3.32".addr2line =
        (f.backtrace."0.3.32".addr2line or false) ||
        (f.backtrace."0.3.32".gimli-symbolize or false) ||
        (backtrace."0.3.32"."gimli-symbolize" or false); }
      { "0.3.32".backtrace-sys =
        (f.backtrace."0.3.32".backtrace-sys or false) ||
        (f.backtrace."0.3.32".libbacktrace or false) ||
        (backtrace."0.3.32"."libbacktrace" or false); }
      { "0.3.32".compiler_builtins =
        (f.backtrace."0.3.32".compiler_builtins or false) ||
        (f.backtrace."0.3.32".rustc-dep-of-std or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false); }
      { "0.3.32".core =
        (f.backtrace."0.3.32".core or false) ||
        (f.backtrace."0.3.32".rustc-dep-of-std or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false); }
      { "0.3.32".dbghelp =
        (f.backtrace."0.3.32".dbghelp or false) ||
        (f.backtrace."0.3.32".default or false) ||
        (backtrace."0.3.32"."default" or false); }
      { "0.3.32".default = (f.backtrace."0.3.32".default or true); }
      { "0.3.32".dladdr =
        (f.backtrace."0.3.32".dladdr or false) ||
        (f.backtrace."0.3.32".default or false) ||
        (backtrace."0.3.32"."default" or false); }
      { "0.3.32".findshlibs =
        (f.backtrace."0.3.32".findshlibs or false) ||
        (f.backtrace."0.3.32".gimli-symbolize or false) ||
        (backtrace."0.3.32"."gimli-symbolize" or false); }
      { "0.3.32".goblin =
        (f.backtrace."0.3.32".goblin or false) ||
        (f.backtrace."0.3.32".gimli-symbolize or false) ||
        (backtrace."0.3.32"."gimli-symbolize" or false); }
      { "0.3.32".libbacktrace =
        (f.backtrace."0.3.32".libbacktrace or false) ||
        (f.backtrace."0.3.32".default or false) ||
        (backtrace."0.3.32"."default" or false); }
      { "0.3.32".libunwind =
        (f.backtrace."0.3.32".libunwind or false) ||
        (f.backtrace."0.3.32".default or false) ||
        (backtrace."0.3.32"."default" or false); }
      { "0.3.32".memmap =
        (f.backtrace."0.3.32".memmap or false) ||
        (f.backtrace."0.3.32".gimli-symbolize or false) ||
        (backtrace."0.3.32"."gimli-symbolize" or false); }
      { "0.3.32".rustc-serialize =
        (f.backtrace."0.3.32".rustc-serialize or false) ||
        (f.backtrace."0.3.32".serialize-rustc or false) ||
        (backtrace."0.3.32"."serialize-rustc" or false); }
      { "0.3.32".serde =
        (f.backtrace."0.3.32".serde or false) ||
        (f.backtrace."0.3.32".serialize-serde or false) ||
        (backtrace."0.3.32"."serialize-serde" or false); }
      { "0.3.32".std =
        (f.backtrace."0.3.32".std or false) ||
        (f.backtrace."0.3.32".default or false) ||
        (backtrace."0.3.32"."default" or false); }
    ];
    backtrace_sys = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.32".backtrace_sys}"."rustc-dep-of-std" =
        (f.backtrace_sys."${deps.backtrace."0.3.32".backtrace_sys}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.32"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.32".backtrace_sys}".default = true; }
    ];
    cfg_if = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.32".cfg_if}"."rustc-dep-of-std" =
        (f.cfg_if."${deps.backtrace."0.3.32".cfg_if}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.32"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.32".cfg_if}".default = true; }
    ];
    libc = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.32".libc}"."rustc-dep-of-std" =
        (f.libc."${deps.backtrace."0.3.32".libc}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.32"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.32".libc}".default = (f.libc."${deps.backtrace."0.3.32".libc}".default or false); }
    ];
    rustc_demangle = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.32".rustc_demangle}"."rustc-dep-of-std" =
        (f.rustc_demangle."${deps.backtrace."0.3.32".rustc_demangle}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.32"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.32"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.32".rustc_demangle}".default = true; }
    ];
  }) [
    (features_.backtrace_sys."${deps."backtrace"."0.3.32"."backtrace_sys"}" deps)
    (features_.cfg_if."${deps."backtrace"."0.3.32"."cfg_if"}" deps)
    (features_.libc."${deps."backtrace"."0.3.32"."libc"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.32"."rustc_demangle"}" deps)
  ];


# end
# backtrace-sys-0.1.30

  crates.backtrace_sys."0.1.30" = deps: { features?(features_.backtrace_sys."0.1.30" deps {}) }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.30";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "023k63xhlkm15hj2j75sqlsa28qc3f3szs1rdlnz09xzs04f42qn";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."backtrace_sys"."0.1.30"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."backtrace_sys"."0.1.30"."cc"}" deps)
    ]);
    features = mkFeatures (features."backtrace_sys"."0.1.30" or {});
  };
  features_.backtrace_sys."0.1.30" = deps: f: updateFeatures f (rec {
    backtrace_sys = fold recursiveUpdate {} [
      { "0.1.30".compiler_builtins =
        (f.backtrace_sys."0.1.30".compiler_builtins or false) ||
        (f.backtrace_sys."0.1.30".rustc-dep-of-std or false) ||
        (backtrace_sys."0.1.30"."rustc-dep-of-std" or false); }
      { "0.1.30".core =
        (f.backtrace_sys."0.1.30".core or false) ||
        (f.backtrace_sys."0.1.30".rustc-dep-of-std or false) ||
        (backtrace_sys."0.1.30"."rustc-dep-of-std" or false); }
      { "0.1.30".default = (f.backtrace_sys."0.1.30".default or true); }
    ];
    cc."${deps.backtrace_sys."0.1.30".cc}".default = true;
    libc."${deps.backtrace_sys."0.1.30".libc}".default = (f.libc."${deps.backtrace_sys."0.1.30".libc}".default or false);
  }) [
    (features_.libc."${deps."backtrace_sys"."0.1.30"."libc"}" deps)
    (features_.cc."${deps."backtrace_sys"."0.1.30"."cc"}" deps)
  ];


# end
# base64-0.10.1

  crates.base64."0.10.1" = deps: { features?(features_.base64."0.10.1" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.10.1";
    authors = [ "Alice Maz <alice@alicemaz.com>" "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "1zz3jq619hahla1f70ra38818b5n8cp4iilij81i90jq6z7hlfhg";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."base64"."0.10.1"."byteorder"}" deps)
    ]);
  };
  features_.base64."0.10.1" = deps: f: updateFeatures f (rec {
    base64."0.10.1".default = (f.base64."0.10.1".default or true);
    byteorder."${deps.base64."0.10.1".byteorder}".default = true;
  }) [
    (features_.byteorder."${deps."base64"."0.10.1"."byteorder"}" deps)
  ];


# end
# bitflags-1.1.0

  crates.bitflags."1.1.0" = deps: { features?(features_.bitflags."1.1.0" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.1.0";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1iwa4jrqcf4lnbwl562a3lx3r0jkh1j88b219bsqvbm4sni67dyv";
    build = "build.rs";
    features = mkFeatures (features."bitflags"."1.1.0" or {});
  };
  features_.bitflags."1.1.0" = deps: f: updateFeatures f (rec {
    bitflags."1.1.0".default = (f.bitflags."1.1.0".default or true);
  }) [];


# end
# block-buffer-0.7.3

  crates.block_buffer."0.7.3" = deps: { features?(features_.block_buffer."0.7.3" deps {}) }: buildRustCrate {
    crateName = "block-buffer";
    version = "0.7.3";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0kryp6l1ia1f5vxmmzggx0pnc5zqxm6m9m9wvh5y0b3wdcj5xm1v";
    dependencies = mapFeatures features ([
      (crates."block_padding"."${deps."block_buffer"."0.7.3"."block_padding"}" deps)
      (crates."byte_tools"."${deps."block_buffer"."0.7.3"."byte_tools"}" deps)
      (crates."byteorder"."${deps."block_buffer"."0.7.3"."byteorder"}" deps)
      (crates."generic_array"."${deps."block_buffer"."0.7.3"."generic_array"}" deps)
    ]);
  };
  features_.block_buffer."0.7.3" = deps: f: updateFeatures f (rec {
    block_buffer."0.7.3".default = (f.block_buffer."0.7.3".default or true);
    block_padding."${deps.block_buffer."0.7.3".block_padding}".default = true;
    byte_tools."${deps.block_buffer."0.7.3".byte_tools}".default = true;
    byteorder."${deps.block_buffer."0.7.3".byteorder}".default = (f.byteorder."${deps.block_buffer."0.7.3".byteorder}".default or false);
    generic_array."${deps.block_buffer."0.7.3".generic_array}".default = true;
  }) [
    (features_.block_padding."${deps."block_buffer"."0.7.3"."block_padding"}" deps)
    (features_.byte_tools."${deps."block_buffer"."0.7.3"."byte_tools"}" deps)
    (features_.byteorder."${deps."block_buffer"."0.7.3"."byteorder"}" deps)
    (features_.generic_array."${deps."block_buffer"."0.7.3"."generic_array"}" deps)
  ];


# end
# block-padding-0.1.4

  crates.block_padding."0.1.4" = deps: { features?(features_.block_padding."0.1.4" deps {}) }: buildRustCrate {
    crateName = "block-padding";
    version = "0.1.4";
    authors = [ "RustCrypto Developers" ];
    sha256 = "08xvr2spxn614x5scn1wsv8a8daslmj1b3n94n644ygb13gsq8zq";
    dependencies = mapFeatures features ([
      (crates."byte_tools"."${deps."block_padding"."0.1.4"."byte_tools"}" deps)
    ]);
  };
  features_.block_padding."0.1.4" = deps: f: updateFeatures f (rec {
    block_padding."0.1.4".default = (f.block_padding."0.1.4".default or true);
    byte_tools."${deps.block_padding."0.1.4".byte_tools}".default = true;
  }) [
    (features_.byte_tools."${deps."block_padding"."0.1.4"."byte_tools"}" deps)
  ];


# end
# byte-tools-0.3.1

  crates.byte_tools."0.3.1" = deps: { features?(features_.byte_tools."0.3.1" deps {}) }: buildRustCrate {
    crateName = "byte-tools";
    version = "0.3.1";
    authors = [ "RustCrypto Developers" ];
    sha256 = "01hfp59bxq74glhfmhvm9wma2migq2kfmvcvqq5pssk5k52g8ja0";
  };
  features_.byte_tools."0.3.1" = deps: f: updateFeatures f (rec {
    byte_tools."0.3.1".default = (f.byte_tools."0.3.1".default or true);
  }) [];


# end
# byteorder-1.3.2

  crates.byteorder."1.3.2" = deps: { features?(features_.byteorder."1.3.2" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "099fxwc79ncpcl8dgg9hql8gznz11a3sjs7pai0mg6w8r05khvdx";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.2" or {});
  };
  features_.byteorder."1.3.2" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.2".default = (f.byteorder."1.3.2".default or true); }
      { "1.3.2".std =
        (f.byteorder."1.3.2".std or false) ||
        (f.byteorder."1.3.2".default or false) ||
        (byteorder."1.3.2"."default" or false); }
    ];
  }) [];


# end
# bytes-0.4.12

  crates.bytes."0.4.12" = deps: { features?(features_.bytes."0.4.12" deps {}) }: buildRustCrate {
    crateName = "bytes";
    version = "0.4.12";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0cw577vll9qp0h3l1sy24anr5mcnd5j26q9q7nw4f0mddssvfphf";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."bytes"."0.4.12"."byteorder"}" deps)
      (crates."iovec"."${deps."bytes"."0.4.12"."iovec"}" deps)
    ]
      ++ (if features.bytes."0.4.12".either or false then [ (crates.either."${deps."bytes"."0.4.12".either}" deps) ] else []));
    features = mkFeatures (features."bytes"."0.4.12" or {});
  };
  features_.bytes."0.4.12" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "${deps.bytes."0.4.12".byteorder}"."i128" =
        (f.byteorder."${deps.bytes."0.4.12".byteorder}"."i128" or false) ||
        (bytes."0.4.12"."i128" or false) ||
        (f."bytes"."0.4.12"."i128" or false); }
      { "${deps.bytes."0.4.12".byteorder}".default = true; }
    ];
    bytes."0.4.12".default = (f.bytes."0.4.12".default or true);
    either."${deps.bytes."0.4.12".either}".default = (f.either."${deps.bytes."0.4.12".either}".default or false);
    iovec."${deps.bytes."0.4.12".iovec}".default = true;
  }) [
    (features_.byteorder."${deps."bytes"."0.4.12"."byteorder"}" deps)
    (features_.either."${deps."bytes"."0.4.12"."either"}" deps)
    (features_.iovec."${deps."bytes"."0.4.12"."iovec"}" deps)
  ];


# end
# bzip2-0.3.3

  crates.bzip2."0.3.3" = deps: { features?(features_.bzip2."0.3.3" deps {}) }: buildRustCrate {
    crateName = "bzip2";
    version = "0.3.3";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1jfrxq7ddqy89cdlgl0m00ljvifp8j9njhqjim1xpq3xy8gichh5";
    dependencies = mapFeatures features ([
      (crates."bzip2_sys"."${deps."bzip2"."0.3.3"."bzip2_sys"}" deps)
      (crates."libc"."${deps."bzip2"."0.3.3"."libc"}" deps)
    ]);
    features = mkFeatures (features."bzip2"."0.3.3" or {});
  };
  features_.bzip2."0.3.3" = deps: f: updateFeatures f (rec {
    bzip2 = fold recursiveUpdate {} [
      { "0.3.3".default = (f.bzip2."0.3.3".default or true); }
      { "0.3.3".futures =
        (f.bzip2."0.3.3".futures or false) ||
        (f.bzip2."0.3.3".tokio or false) ||
        (bzip2."0.3.3"."tokio" or false); }
      { "0.3.3".tokio-io =
        (f.bzip2."0.3.3".tokio-io or false) ||
        (f.bzip2."0.3.3".tokio or false) ||
        (bzip2."0.3.3"."tokio" or false); }
    ];
    bzip2_sys."${deps.bzip2."0.3.3".bzip2_sys}".default = true;
    libc."${deps.bzip2."0.3.3".libc}".default = true;
  }) [
    (features_.bzip2_sys."${deps."bzip2"."0.3.3"."bzip2_sys"}" deps)
    (features_.libc."${deps."bzip2"."0.3.3"."libc"}" deps)
  ];


# end
# bzip2-sys-0.1.7

  crates.bzip2_sys."0.1.7" = deps: { features?(features_.bzip2_sys."0.1.7" deps {}) }: buildRustCrate {
    crateName = "bzip2-sys";
    version = "0.1.7";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1wflg3zpnldpnxhfv57sbfl6h67wqq4r3f7idgcs4f6d4h09dfdb";
    libPath = "lib.rs";
    libName = "bzip2_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."bzip2_sys"."0.1.7"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."bzip2_sys"."0.1.7"."cc"}" deps)
    ]);
  };
  features_.bzip2_sys."0.1.7" = deps: f: updateFeatures f (rec {
    bzip2_sys."0.1.7".default = (f.bzip2_sys."0.1.7".default or true);
    cc."${deps.bzip2_sys."0.1.7".cc}".default = true;
    libc."${deps.bzip2_sys."0.1.7".libc}".default = true;
  }) [
    (features_.libc."${deps."bzip2_sys"."0.1.7"."libc"}" deps)
    (features_.cc."${deps."bzip2_sys"."0.1.7"."cc"}" deps)
  ];


# end
# c2-chacha-0.2.2

  crates.c2_chacha."0.2.2" = deps: { features?(features_.c2_chacha."0.2.2" deps {}) }: buildRustCrate {
    crateName = "c2-chacha";
    version = "0.2.2";
    authors = [ "The CryptoCorrosion Contributors" ];
    edition = "2018";
    sha256 = "1lcfazshbiw8kdpcgphlmls0mz5j4wnvsq1diaz4b2bcvgm3r2cn";
    dependencies = mapFeatures features ([
      (crates."ppv_lite86"."${deps."c2_chacha"."0.2.2"."ppv_lite86"}" deps)
    ]
      ++ (if features.c2_chacha."0.2.2".lazy_static or false then [ (crates.lazy_static."${deps."c2_chacha"."0.2.2".lazy_static}" deps) ] else []));
    features = mkFeatures (features."c2_chacha"."0.2.2" or {});
  };
  features_.c2_chacha."0.2.2" = deps: f: updateFeatures f (rec {
    c2_chacha = fold recursiveUpdate {} [
      { "0.2.2".byteorder =
        (f.c2_chacha."0.2.2".byteorder or false) ||
        (f.c2_chacha."0.2.2".rustcrypto_api or false) ||
        (c2_chacha."0.2.2"."rustcrypto_api" or false); }
      { "0.2.2".default = (f.c2_chacha."0.2.2".default or true); }
      { "0.2.2".lazy_static =
        (f.c2_chacha."0.2.2".lazy_static or false) ||
        (f.c2_chacha."0.2.2".std or false) ||
        (c2_chacha."0.2.2"."std" or false); }
      { "0.2.2".rustcrypto_api =
        (f.c2_chacha."0.2.2".rustcrypto_api or false) ||
        (f.c2_chacha."0.2.2".default or false) ||
        (c2_chacha."0.2.2"."default" or false); }
      { "0.2.2".simd =
        (f.c2_chacha."0.2.2".simd or false) ||
        (f.c2_chacha."0.2.2".default or false) ||
        (c2_chacha."0.2.2"."default" or false); }
      { "0.2.2".std =
        (f.c2_chacha."0.2.2".std or false) ||
        (f.c2_chacha."0.2.2".default or false) ||
        (c2_chacha."0.2.2"."default" or false); }
      { "0.2.2".stream-cipher =
        (f.c2_chacha."0.2.2".stream-cipher or false) ||
        (f.c2_chacha."0.2.2".rustcrypto_api or false) ||
        (c2_chacha."0.2.2"."rustcrypto_api" or false); }
    ];
    lazy_static."${deps.c2_chacha."0.2.2".lazy_static}".default = true;
    ppv_lite86 = fold recursiveUpdate {} [
      { "${deps.c2_chacha."0.2.2".ppv_lite86}"."simd" =
        (f.ppv_lite86."${deps.c2_chacha."0.2.2".ppv_lite86}"."simd" or false) ||
        (c2_chacha."0.2.2"."simd" or false) ||
        (f."c2_chacha"."0.2.2"."simd" or false); }
      { "${deps.c2_chacha."0.2.2".ppv_lite86}".default = true; }
    ];
  }) [
    (features_.lazy_static."${deps."c2_chacha"."0.2.2"."lazy_static"}" deps)
    (features_.ppv_lite86."${deps."c2_chacha"."0.2.2"."ppv_lite86"}" deps)
  ];


# end
# cargo_metadata-0.8.0

  crates.cargo_metadata."0.8.0" = deps: { features?(features_.cargo_metadata."0.8.0" deps {}) }: buildRustCrate {
    crateName = "cargo_metadata";
    version = "0.8.0";
    authors = [ "Oliver Schneider <git-spam-no-reply9815368754983@oli-obk.de>" ];
    sha256 = "1bb354vqx0b3bllh5dknknwh8f3kma6r49bzfvag35yk14ig7ha2";
    dependencies = mapFeatures features ([
      (crates."failure"."${deps."cargo_metadata"."0.8.0"."failure"}" deps)
      (crates."semver"."${deps."cargo_metadata"."0.8.0"."semver"}" deps)
      (crates."serde"."${deps."cargo_metadata"."0.8.0"."serde"}" deps)
      (crates."serde_derive"."${deps."cargo_metadata"."0.8.0"."serde_derive"}" deps)
      (crates."serde_json"."${deps."cargo_metadata"."0.8.0"."serde_json"}" deps)
    ]);
  };
  features_.cargo_metadata."0.8.0" = deps: f: updateFeatures f (rec {
    cargo_metadata."0.8.0".default = (f.cargo_metadata."0.8.0".default or true);
    failure."${deps.cargo_metadata."0.8.0".failure}".default = true;
    semver = fold recursiveUpdate {} [
      { "${deps.cargo_metadata."0.8.0".semver}"."serde" = true; }
      { "${deps.cargo_metadata."0.8.0".semver}".default = true; }
    ];
    serde."${deps.cargo_metadata."0.8.0".serde}".default = true;
    serde_derive."${deps.cargo_metadata."0.8.0".serde_derive}".default = true;
    serde_json."${deps.cargo_metadata."0.8.0".serde_json}".default = true;
  }) [
    (features_.failure."${deps."cargo_metadata"."0.8.0"."failure"}" deps)
    (features_.semver."${deps."cargo_metadata"."0.8.0"."semver"}" deps)
    (features_.serde."${deps."cargo_metadata"."0.8.0"."serde"}" deps)
    (features_.serde_derive."${deps."cargo_metadata"."0.8.0"."serde_derive"}" deps)
    (features_.serde_json."${deps."cargo_metadata"."0.8.0"."serde_json"}" deps)
  ];


# end
# cbindgen-0.8.7

  crates.cbindgen."0.8.7" = deps: { features?(features_.cbindgen."0.8.7" deps {}) }: buildRustCrate {
    crateName = "cbindgen";
    version = "0.8.7";
    authors = [ "Jeff Muizelaar <jmuizelaar@mozilla.com>" "Kartikaya Gupta <kats@mozilla.com>" "Ryan Hunt <rhunt@eqrion.net>" ];
    sha256 = "09zz0pm3z12mmki950jjdxwlix8ihv0zdzliklhmjn0k719235hz";
    libPath = "src/lib.rs";
    crateBin =
      [{  name = "cbindgen";  path = "src/main.rs"; }];
    dependencies = mapFeatures features ([
      (crates."clap"."${deps."cbindgen"."0.8.7"."clap"}" deps)
      (crates."log"."${deps."cbindgen"."0.8.7"."log"}" deps)
      (crates."proc_macro2"."${deps."cbindgen"."0.8.7"."proc_macro2"}" deps)
      (crates."quote"."${deps."cbindgen"."0.8.7"."quote"}" deps)
      (crates."serde"."${deps."cbindgen"."0.8.7"."serde"}" deps)
      (crates."serde_derive"."${deps."cbindgen"."0.8.7"."serde_derive"}" deps)
      (crates."serde_json"."${deps."cbindgen"."0.8.7"."serde_json"}" deps)
      (crates."syn"."${deps."cbindgen"."0.8.7"."syn"}" deps)
      (crates."tempfile"."${deps."cbindgen"."0.8.7"."tempfile"}" deps)
      (crates."toml"."${deps."cbindgen"."0.8.7"."toml"}" deps)
    ]);
  };
  features_.cbindgen."0.8.7" = deps: f: updateFeatures f (rec {
    cbindgen."0.8.7".default = (f.cbindgen."0.8.7".default or true);
    clap."${deps.cbindgen."0.8.7".clap}".default = true;
    log."${deps.cbindgen."0.8.7".log}".default = true;
    proc_macro2."${deps.cbindgen."0.8.7".proc_macro2}".default = true;
    quote."${deps.cbindgen."0.8.7".quote}".default = true;
    serde = fold recursiveUpdate {} [
      { "${deps.cbindgen."0.8.7".serde}"."derive" = true; }
      { "${deps.cbindgen."0.8.7".serde}".default = true; }
    ];
    serde_derive."${deps.cbindgen."0.8.7".serde_derive}".default = true;
    serde_json."${deps.cbindgen."0.8.7".serde_json}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.cbindgen."0.8.7".syn}"."clone-impls" = true; }
      { "${deps.cbindgen."0.8.7".syn}"."extra-traits" = true; }
      { "${deps.cbindgen."0.8.7".syn}"."full" = true; }
      { "${deps.cbindgen."0.8.7".syn}"."parsing" = true; }
      { "${deps.cbindgen."0.8.7".syn}"."printing" = true; }
      { "${deps.cbindgen."0.8.7".syn}".default = (f.syn."${deps.cbindgen."0.8.7".syn}".default or false); }
    ];
    tempfile."${deps.cbindgen."0.8.7".tempfile}".default = true;
    toml."${deps.cbindgen."0.8.7".toml}".default = true;
  }) [
    (features_.clap."${deps."cbindgen"."0.8.7"."clap"}" deps)
    (features_.log."${deps."cbindgen"."0.8.7"."log"}" deps)
    (features_.proc_macro2."${deps."cbindgen"."0.8.7"."proc_macro2"}" deps)
    (features_.quote."${deps."cbindgen"."0.8.7"."quote"}" deps)
    (features_.serde."${deps."cbindgen"."0.8.7"."serde"}" deps)
    (features_.serde_derive."${deps."cbindgen"."0.8.7"."serde_derive"}" deps)
    (features_.serde_json."${deps."cbindgen"."0.8.7"."serde_json"}" deps)
    (features_.syn."${deps."cbindgen"."0.8.7"."syn"}" deps)
    (features_.tempfile."${deps."cbindgen"."0.8.7"."tempfile"}" deps)
    (features_.toml."${deps."cbindgen"."0.8.7"."toml"}" deps)
  ];


# end
# cc-1.0.37

  crates.cc."1.0.37" = deps: { features?(features_.cc."1.0.37" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.37";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1m5s357yi2amgd0kd8chxdcbnscyxwxifmf5hgv92x5xj56b3shj";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.37" or {});
  };
  features_.cc."1.0.37" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.37".default = (f.cc."1.0.37".default or true); }
      { "1.0.37".rayon =
        (f.cc."1.0.37".rayon or false) ||
        (f.cc."1.0.37".parallel or false) ||
        (cc."1.0.37"."parallel" or false); }
    ];
  }) [];


# end
# cfg-if-0.1.9

  crates.cfg_if."0.1.9" = deps: { features?(features_.cfg_if."0.1.9" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.9";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13g9p2mc5b2b5wn716fwvilzib376ycpkgk868yxfp16jzix57p7";
  };
  features_.cfg_if."0.1.9" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.9".default = (f.cfg_if."0.1.9".default or true);
  }) [];


# end
# chrono-0.4.7

  crates.chrono."0.4.7" = deps: { features?(features_.chrono."0.4.7" deps {}) }: buildRustCrate {
    crateName = "chrono";
    version = "0.4.7";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" "Brandon W Maister <quodlibetor@gmail.com>" ];
    sha256 = "1f5r3h2vyr8g42fncp0g55qzaq2cxkchd59sjdlda1bl7m4wxnb5";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."chrono"."0.4.7"."libc"}" deps)
      (crates."num_integer"."${deps."chrono"."0.4.7"."num_integer"}" deps)
      (crates."num_traits"."${deps."chrono"."0.4.7"."num_traits"}" deps)
    ]
      ++ (if features.chrono."0.4.7".time or false then [ (crates.time."${deps."chrono"."0.4.7".time}" deps) ] else []));
    features = mkFeatures (features."chrono"."0.4.7" or {});
  };
  features_.chrono."0.4.7" = deps: f: updateFeatures f (rec {
    chrono = fold recursiveUpdate {} [
      { "0.4.7".clock =
        (f.chrono."0.4.7".clock or false) ||
        (f.chrono."0.4.7".default or false) ||
        (chrono."0.4.7"."default" or false); }
      { "0.4.7".default = (f.chrono."0.4.7".default or true); }
      { "0.4.7".time =
        (f.chrono."0.4.7".time or false) ||
        (f.chrono."0.4.7".clock or false) ||
        (chrono."0.4.7"."clock" or false); }
    ];
    libc."${deps.chrono."0.4.7".libc}".default = (f.libc."${deps.chrono."0.4.7".libc}".default or false);
    num_integer."${deps.chrono."0.4.7".num_integer}".default = (f.num_integer."${deps.chrono."0.4.7".num_integer}".default or false);
    num_traits."${deps.chrono."0.4.7".num_traits}".default = (f.num_traits."${deps.chrono."0.4.7".num_traits}".default or false);
    time."${deps.chrono."0.4.7".time}".default = true;
  }) [
    (features_.libc."${deps."chrono"."0.4.7"."libc"}" deps)
    (features_.num_integer."${deps."chrono"."0.4.7"."num_integer"}" deps)
    (features_.num_traits."${deps."chrono"."0.4.7"."num_traits"}" deps)
    (features_.time."${deps."chrono"."0.4.7"."time"}" deps)
  ];


# end
# clap-2.33.0

  crates.clap."2.33.0" = deps: { features?(features_.clap."2.33.0" deps {}) }: buildRustCrate {
    crateName = "clap";
    version = "2.33.0";
    authors = [ "Kevin K. <kbknapp@gmail.com>" ];
    sha256 = "054n9ngh6pkknpmd4acgdsp40iw6f5jzq8a4h2b76gnbvk6p5xjh";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."clap"."2.33.0"."bitflags"}" deps)
      (crates."textwrap"."${deps."clap"."2.33.0"."textwrap"}" deps)
      (crates."unicode_width"."${deps."clap"."2.33.0"."unicode_width"}" deps)
    ]
      ++ (if features.clap."2.33.0".atty or false then [ (crates.atty."${deps."clap"."2.33.0".atty}" deps) ] else [])
      ++ (if features.clap."2.33.0".strsim or false then [ (crates.strsim."${deps."clap"."2.33.0".strsim}" deps) ] else [])
      ++ (if features.clap."2.33.0".vec_map or false then [ (crates.vec_map."${deps."clap"."2.33.0".vec_map}" deps) ] else []))
      ++ (if !(kernel == "windows") then mapFeatures features ([
    ]
      ++ (if features.clap."2.33.0".ansi_term or false then [ (crates.ansi_term."${deps."clap"."2.33.0".ansi_term}" deps) ] else [])) else []);
    features = mkFeatures (features."clap"."2.33.0" or {});
  };
  features_.clap."2.33.0" = deps: f: updateFeatures f (rec {
    ansi_term."${deps.clap."2.33.0".ansi_term}".default = true;
    atty."${deps.clap."2.33.0".atty}".default = true;
    bitflags."${deps.clap."2.33.0".bitflags}".default = true;
    clap = fold recursiveUpdate {} [
      { "2.33.0".ansi_term =
        (f.clap."2.33.0".ansi_term or false) ||
        (f.clap."2.33.0".color or false) ||
        (clap."2.33.0"."color" or false); }
      { "2.33.0".atty =
        (f.clap."2.33.0".atty or false) ||
        (f.clap."2.33.0".color or false) ||
        (clap."2.33.0"."color" or false); }
      { "2.33.0".clippy =
        (f.clap."2.33.0".clippy or false) ||
        (f.clap."2.33.0".lints or false) ||
        (clap."2.33.0"."lints" or false); }
      { "2.33.0".color =
        (f.clap."2.33.0".color or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0".default = (f.clap."2.33.0".default or true); }
      { "2.33.0".strsim =
        (f.clap."2.33.0".strsim or false) ||
        (f.clap."2.33.0".suggestions or false) ||
        (clap."2.33.0"."suggestions" or false); }
      { "2.33.0".suggestions =
        (f.clap."2.33.0".suggestions or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0".term_size =
        (f.clap."2.33.0".term_size or false) ||
        (f.clap."2.33.0".wrap_help or false) ||
        (clap."2.33.0"."wrap_help" or false); }
      { "2.33.0".vec_map =
        (f.clap."2.33.0".vec_map or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0".yaml =
        (f.clap."2.33.0".yaml or false) ||
        (f.clap."2.33.0".doc or false) ||
        (clap."2.33.0"."doc" or false); }
      { "2.33.0".yaml-rust =
        (f.clap."2.33.0".yaml-rust or false) ||
        (f.clap."2.33.0".yaml or false) ||
        (clap."2.33.0"."yaml" or false); }
    ];
    strsim."${deps.clap."2.33.0".strsim}".default = true;
    textwrap = fold recursiveUpdate {} [
      { "${deps.clap."2.33.0".textwrap}"."term_size" =
        (f.textwrap."${deps.clap."2.33.0".textwrap}"."term_size" or false) ||
        (clap."2.33.0"."wrap_help" or false) ||
        (f."clap"."2.33.0"."wrap_help" or false); }
      { "${deps.clap."2.33.0".textwrap}".default = true; }
    ];
    unicode_width."${deps.clap."2.33.0".unicode_width}".default = true;
    vec_map."${deps.clap."2.33.0".vec_map}".default = true;
  }) [
    (features_.atty."${deps."clap"."2.33.0"."atty"}" deps)
    (features_.bitflags."${deps."clap"."2.33.0"."bitflags"}" deps)
    (features_.strsim."${deps."clap"."2.33.0"."strsim"}" deps)
    (features_.textwrap."${deps."clap"."2.33.0"."textwrap"}" deps)
    (features_.unicode_width."${deps."clap"."2.33.0"."unicode_width"}" deps)
    (features_.vec_map."${deps."clap"."2.33.0"."vec_map"}" deps)
    (features_.ansi_term."${deps."clap"."2.33.0"."ansi_term"}" deps)
  ];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3".bitflags =
        (f.cloudabi."0.0.3".bitflags or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# cookie-0.12.0

  crates.cookie."0.12.0" = deps: { features?(features_.cookie."0.12.0" deps {}) }: buildRustCrate {
    crateName = "cookie";
    version = "0.12.0";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "0gqz78qlza819xakvakjzlk95bizj48x0aba6819z92777vb5y7g";
    dependencies = mapFeatures features ([
      (crates."time"."${deps."cookie"."0.12.0"."time"}" deps)
    ]
      ++ (if features.cookie."0.12.0".url or false then [ (crates.url."${deps."cookie"."0.12.0".url}" deps) ] else []));
    features = mkFeatures (features."cookie"."0.12.0" or {});
  };
  features_.cookie."0.12.0" = deps: f: updateFeatures f (rec {
    cookie = fold recursiveUpdate {} [
      { "0.12.0".base64 =
        (f.cookie."0.12.0".base64 or false) ||
        (f.cookie."0.12.0".secure or false) ||
        (cookie."0.12.0"."secure" or false); }
      { "0.12.0".default = (f.cookie."0.12.0".default or true); }
      { "0.12.0".ring =
        (f.cookie."0.12.0".ring or false) ||
        (f.cookie."0.12.0".secure or false) ||
        (cookie."0.12.0"."secure" or false); }
      { "0.12.0".url =
        (f.cookie."0.12.0".url or false) ||
        (f.cookie."0.12.0".percent-encode or false) ||
        (cookie."0.12.0"."percent-encode" or false); }
    ];
    time."${deps.cookie."0.12.0".time}".default = true;
    url."${deps.cookie."0.12.0".url}".default = true;
  }) [
    (features_.time."${deps."cookie"."0.12.0"."time"}" deps)
    (features_.url."${deps."cookie"."0.12.0"."url"}" deps)
  ];


# end
# cookie_store-0.7.0

  crates.cookie_store."0.7.0" = deps: { features?(features_.cookie_store."0.7.0" deps {}) }: buildRustCrate {
    crateName = "cookie_store";
    version = "0.7.0";
    authors = [ "patrick.fernie@gmail.com" ];
    edition = "2018";
    sha256 = "07wycaaplf613hcz4p54xn1s4l2fwhm0yy5xfr6fsfm17p3pkxln";
    dependencies = mapFeatures features ([
      (crates."cookie"."${deps."cookie_store"."0.7.0"."cookie"}" deps)
      (crates."failure"."${deps."cookie_store"."0.7.0"."failure"}" deps)
      (crates."idna"."${deps."cookie_store"."0.7.0"."idna"}" deps)
      (crates."log"."${deps."cookie_store"."0.7.0"."log"}" deps)
      (crates."publicsuffix"."${deps."cookie_store"."0.7.0"."publicsuffix"}" deps)
      (crates."serde"."${deps."cookie_store"."0.7.0"."serde"}" deps)
      (crates."serde_json"."${deps."cookie_store"."0.7.0"."serde_json"}" deps)
      (crates."time"."${deps."cookie_store"."0.7.0"."time"}" deps)
      (crates."try_from"."${deps."cookie_store"."0.7.0"."try_from"}" deps)
      (crates."url"."${deps."cookie_store"."0.7.0"."url"}" deps)
    ]);
  };
  features_.cookie_store."0.7.0" = deps: f: updateFeatures f (rec {
    cookie = fold recursiveUpdate {} [
      { "${deps.cookie_store."0.7.0".cookie}"."percent-encode" = true; }
      { "${deps.cookie_store."0.7.0".cookie}".default = true; }
    ];
    cookie_store."0.7.0".default = (f.cookie_store."0.7.0".default or true);
    failure."${deps.cookie_store."0.7.0".failure}".default = true;
    idna."${deps.cookie_store."0.7.0".idna}".default = true;
    log."${deps.cookie_store."0.7.0".log}".default = true;
    publicsuffix."${deps.cookie_store."0.7.0".publicsuffix}".default = (f.publicsuffix."${deps.cookie_store."0.7.0".publicsuffix}".default or false);
    serde = fold recursiveUpdate {} [
      { "${deps.cookie_store."0.7.0".serde}"."derive" = true; }
      { "${deps.cookie_store."0.7.0".serde}".default = true; }
    ];
    serde_json."${deps.cookie_store."0.7.0".serde_json}".default = true;
    time."${deps.cookie_store."0.7.0".time}".default = true;
    try_from."${deps.cookie_store."0.7.0".try_from}".default = true;
    url."${deps.cookie_store."0.7.0".url}".default = true;
  }) [
    (features_.cookie."${deps."cookie_store"."0.7.0"."cookie"}" deps)
    (features_.failure."${deps."cookie_store"."0.7.0"."failure"}" deps)
    (features_.idna."${deps."cookie_store"."0.7.0"."idna"}" deps)
    (features_.log."${deps."cookie_store"."0.7.0"."log"}" deps)
    (features_.publicsuffix."${deps."cookie_store"."0.7.0"."publicsuffix"}" deps)
    (features_.serde."${deps."cookie_store"."0.7.0"."serde"}" deps)
    (features_.serde_json."${deps."cookie_store"."0.7.0"."serde_json"}" deps)
    (features_.time."${deps."cookie_store"."0.7.0"."time"}" deps)
    (features_.try_from."${deps."cookie_store"."0.7.0"."try_from"}" deps)
    (features_.url."${deps."cookie_store"."0.7.0"."url"}" deps)
  ];


# end
# crc32fast-1.2.0

  crates.crc32fast."1.2.0" = deps: { features?(features_.crc32fast."1.2.0" deps {}) }: buildRustCrate {
    crateName = "crc32fast";
    version = "1.2.0";
    authors = [ "Sam Rijs <srijs@airpost.net>" "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1mx88ndqln6vzg7hjhjp8b7g0qggpqggsjrlsdqrfsrbpdzffcn8";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crc32fast"."1.2.0"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."crc32fast"."1.2.0" or {});
  };
  features_.crc32fast."1.2.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crc32fast."1.2.0".cfg_if}".default = true;
    crc32fast = fold recursiveUpdate {} [
      { "1.2.0".default = (f.crc32fast."1.2.0".default or true); }
      { "1.2.0".std =
        (f.crc32fast."1.2.0".std or false) ||
        (f.crc32fast."1.2.0".default or false) ||
        (crc32fast."1.2.0"."default" or false); }
    ];
  }) [
    (features_.cfg_if."${deps."crc32fast"."1.2.0"."cfg_if"}" deps)
  ];


# end
# crossbeam-deque-0.7.1

  crates.crossbeam_deque."0.7.1" = deps: { features?(features_.crossbeam_deque."0.7.1" deps {}) }: buildRustCrate {
    crateName = "crossbeam-deque";
    version = "0.7.1";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "11l7idrx3diksrxbaa13f9h9i6f3456qq3647f3kglxfjmz9bm8s";
    dependencies = mapFeatures features ([
      (crates."crossbeam_epoch"."${deps."crossbeam_deque"."0.7.1"."crossbeam_epoch"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_deque"."0.7.1"."crossbeam_utils"}" deps)
    ]);
  };
  features_.crossbeam_deque."0.7.1" = deps: f: updateFeatures f (rec {
    crossbeam_deque."0.7.1".default = (f.crossbeam_deque."0.7.1".default or true);
    crossbeam_epoch."${deps.crossbeam_deque."0.7.1".crossbeam_epoch}".default = true;
    crossbeam_utils."${deps.crossbeam_deque."0.7.1".crossbeam_utils}".default = true;
  }) [
    (features_.crossbeam_epoch."${deps."crossbeam_deque"."0.7.1"."crossbeam_epoch"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_deque"."0.7.1"."crossbeam_utils"}" deps)
  ];


# end
# crossbeam-epoch-0.7.1

  crates.crossbeam_epoch."0.7.1" = deps: { features?(features_.crossbeam_epoch."0.7.1" deps {}) }: buildRustCrate {
    crateName = "crossbeam-epoch";
    version = "0.7.1";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1n2p8rqsg0g8dws6kvjgi5jsbnd42l45dklnzc8vihjcxa6712bg";
    dependencies = mapFeatures features ([
      (crates."arrayvec"."${deps."crossbeam_epoch"."0.7.1"."arrayvec"}" deps)
      (crates."cfg_if"."${deps."crossbeam_epoch"."0.7.1"."cfg_if"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_epoch"."0.7.1"."crossbeam_utils"}" deps)
      (crates."memoffset"."${deps."crossbeam_epoch"."0.7.1"."memoffset"}" deps)
      (crates."scopeguard"."${deps."crossbeam_epoch"."0.7.1"."scopeguard"}" deps)
    ]
      ++ (if features.crossbeam_epoch."0.7.1".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_epoch"."0.7.1".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_epoch"."0.7.1" or {});
  };
  features_.crossbeam_epoch."0.7.1" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.7.1".arrayvec}"."use_union" =
        (f.arrayvec."${deps.crossbeam_epoch."0.7.1".arrayvec}"."use_union" or false) ||
        (crossbeam_epoch."0.7.1"."nightly" or false) ||
        (f."crossbeam_epoch"."0.7.1"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.7.1".arrayvec}".default = (f.arrayvec."${deps.crossbeam_epoch."0.7.1".arrayvec}".default or false); }
    ];
    cfg_if."${deps.crossbeam_epoch."0.7.1".cfg_if}".default = true;
    crossbeam_epoch = fold recursiveUpdate {} [
      { "0.7.1".default = (f.crossbeam_epoch."0.7.1".default or true); }
      { "0.7.1".lazy_static =
        (f.crossbeam_epoch."0.7.1".lazy_static or false) ||
        (f.crossbeam_epoch."0.7.1".std or false) ||
        (crossbeam_epoch."0.7.1"."std" or false); }
      { "0.7.1".std =
        (f.crossbeam_epoch."0.7.1".std or false) ||
        (f.crossbeam_epoch."0.7.1".default or false) ||
        (crossbeam_epoch."0.7.1"."default" or false); }
    ];
    crossbeam_utils = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."nightly" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."nightly" or false) ||
        (crossbeam_epoch."0.7.1"."nightly" or false) ||
        (f."crossbeam_epoch"."0.7.1"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."std" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}"."std" or false) ||
        (crossbeam_epoch."0.7.1"."std" or false) ||
        (f."crossbeam_epoch"."0.7.1"."std" or false); }
      { "${deps.crossbeam_epoch."0.7.1".crossbeam_utils}".default = (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.1".crossbeam_utils}".default or false); }
    ];
    lazy_static."${deps.crossbeam_epoch."0.7.1".lazy_static}".default = true;
    memoffset."${deps.crossbeam_epoch."0.7.1".memoffset}".default = true;
    scopeguard."${deps.crossbeam_epoch."0.7.1".scopeguard}".default = (f.scopeguard."${deps.crossbeam_epoch."0.7.1".scopeguard}".default or false);
  }) [
    (features_.arrayvec."${deps."crossbeam_epoch"."0.7.1"."arrayvec"}" deps)
    (features_.cfg_if."${deps."crossbeam_epoch"."0.7.1"."cfg_if"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_epoch"."0.7.1"."crossbeam_utils"}" deps)
    (features_.lazy_static."${deps."crossbeam_epoch"."0.7.1"."lazy_static"}" deps)
    (features_.memoffset."${deps."crossbeam_epoch"."0.7.1"."memoffset"}" deps)
    (features_.scopeguard."${deps."crossbeam_epoch"."0.7.1"."scopeguard"}" deps)
  ];


# end
# crossbeam-queue-0.1.2

  crates.crossbeam_queue."0.1.2" = deps: { features?(features_.crossbeam_queue."0.1.2" deps {}) }: buildRustCrate {
    crateName = "crossbeam-queue";
    version = "0.1.2";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1hannzr5w6j5061kg5iba4fzi6f2xpqv7bkcspfq17y1i8g0mzjj";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."crossbeam_queue"."0.1.2"."crossbeam_utils"}" deps)
    ]);
  };
  features_.crossbeam_queue."0.1.2" = deps: f: updateFeatures f (rec {
    crossbeam_queue."0.1.2".default = (f.crossbeam_queue."0.1.2".default or true);
    crossbeam_utils."${deps.crossbeam_queue."0.1.2".crossbeam_utils}".default = true;
  }) [
    (features_.crossbeam_utils."${deps."crossbeam_queue"."0.1.2"."crossbeam_utils"}" deps)
  ];


# end
# crossbeam-utils-0.6.5

  crates.crossbeam_utils."0.6.5" = deps: { features?(features_.crossbeam_utils."0.6.5" deps {}) }: buildRustCrate {
    crateName = "crossbeam-utils";
    version = "0.6.5";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1z7wgcl9d22r2x6769r5945rnwf3jqfrrmb16q7kzk292r1d4rdg";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crossbeam_utils"."0.6.5"."cfg_if"}" deps)
    ]
      ++ (if features.crossbeam_utils."0.6.5".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_utils"."0.6.5".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_utils"."0.6.5" or {});
  };
  features_.crossbeam_utils."0.6.5" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crossbeam_utils."0.6.5".cfg_if}".default = true;
    crossbeam_utils = fold recursiveUpdate {} [
      { "0.6.5".default = (f.crossbeam_utils."0.6.5".default or true); }
      { "0.6.5".lazy_static =
        (f.crossbeam_utils."0.6.5".lazy_static or false) ||
        (f.crossbeam_utils."0.6.5".std or false) ||
        (crossbeam_utils."0.6.5"."std" or false); }
      { "0.6.5".std =
        (f.crossbeam_utils."0.6.5".std or false) ||
        (f.crossbeam_utils."0.6.5".default or false) ||
        (crossbeam_utils."0.6.5"."default" or false); }
    ];
    lazy_static."${deps.crossbeam_utils."0.6.5".lazy_static}".default = true;
  }) [
    (features_.cfg_if."${deps."crossbeam_utils"."0.6.5"."cfg_if"}" deps)
    (features_.lazy_static."${deps."crossbeam_utils"."0.6.5"."lazy_static"}" deps)
  ];


# end
# ct-logs-0.5.1

  crates.ct_logs."0.5.1" = deps: { features?(features_.ct_logs."0.5.1" deps {}) }: buildRustCrate {
    crateName = "ct-logs";
    version = "0.5.1";
    authors = [ "Joseph Birr-Pixton <jpixton@gmail.com>" ];
    edition = "2018";
    sha256 = "0fyg6yy1a9gx9p7vvr0a0yy2rsrph1cnmgn48qn8vydg59yc27qa";
    dependencies = mapFeatures features ([
      (crates."sct"."${deps."ct_logs"."0.5.1"."sct"}" deps)
    ]);
  };
  features_.ct_logs."0.5.1" = deps: f: updateFeatures f (rec {
    ct_logs."0.5.1".default = (f.ct_logs."0.5.1".default or true);
    sct."${deps.ct_logs."0.5.1".sct}".default = true;
  }) [
    (features_.sct."${deps."ct_logs"."0.5.1"."sct"}" deps)
  ];


# end
# digest-0.8.1

  crates.digest."0.8.1" = deps: { features?(features_.digest."0.8.1" deps {}) }: buildRustCrate {
    crateName = "digest";
    version = "0.8.1";
    authors = [ "RustCrypto Developers" ];
    sha256 = "18jzwdsfl90bzhbk5ny4rgakhwn3l7pqk2mmqvl4ccb0qy4lhbyr";
    dependencies = mapFeatures features ([
      (crates."generic_array"."${deps."digest"."0.8.1"."generic_array"}" deps)
    ]);
    features = mkFeatures (features."digest"."0.8.1" or {});
  };
  features_.digest."0.8.1" = deps: f: updateFeatures f (rec {
    digest = fold recursiveUpdate {} [
      { "0.8.1".blobby =
        (f.digest."0.8.1".blobby or false) ||
        (f.digest."0.8.1".dev or false) ||
        (digest."0.8.1"."dev" or false); }
      { "0.8.1".default = (f.digest."0.8.1".default or true); }
    ];
    generic_array."${deps.digest."0.8.1".generic_array}".default = true;
  }) [
    (features_.generic_array."${deps."digest"."0.8.1"."generic_array"}" deps)
  ];


# end
# dtoa-0.4.4

  crates.dtoa."0.4.4" = deps: { features?(features_.dtoa."0.4.4" deps {}) }: buildRustCrate {
    crateName = "dtoa";
    version = "0.4.4";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1nbq72nc2kp8lbx6i1ml5ird5c0cy4i6dvm7wfydybmanw4m07xz";
  };
  features_.dtoa."0.4.4" = deps: f: updateFeatures f (rec {
    dtoa."0.4.4".default = (f.dtoa."0.4.4".default or true);
  }) [];


# end
# either-1.5.2

  crates.either."1.5.2" = deps: { features?(features_.either."1.5.2" deps {}) }: buildRustCrate {
    crateName = "either";
    version = "1.5.2";
    authors = [ "bluss" ];
    sha256 = "1zqq1057c51f53ga4p9l4dd8ax6md27h1xjrjp2plkvml5iymks5";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."either"."1.5.2" or {});
  };
  features_.either."1.5.2" = deps: f: updateFeatures f (rec {
    either = fold recursiveUpdate {} [
      { "1.5.2".default = (f.either."1.5.2".default or true); }
      { "1.5.2".use_std =
        (f.either."1.5.2".use_std or false) ||
        (f.either."1.5.2".default or false) ||
        (either."1.5.2"."default" or false); }
    ];
  }) [];


# end
# encoding_rs-0.8.17

  crates.encoding_rs."0.8.17" = deps: { features?(features_.encoding_rs."0.8.17" deps {}) }: buildRustCrate {
    crateName = "encoding_rs";
    version = "0.8.17";
    authors = [ "Henri Sivonen <hsivonen@hsivonen.fi>" ];
    sha256 = "0p8afcx1flzr1sz2ja2gvn9c000mb8k7ysy5vv0ia3khac3i30li";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."encoding_rs"."0.8.17"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."encoding_rs"."0.8.17" or {});
  };
  features_.encoding_rs."0.8.17" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.encoding_rs."0.8.17".cfg_if}".default = true;
    encoding_rs = fold recursiveUpdate {} [
      { "0.8.17".default = (f.encoding_rs."0.8.17".default or true); }
      { "0.8.17".fast-big5-hanzi-encode =
        (f.encoding_rs."0.8.17".fast-big5-hanzi-encode or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17".fast-gb-hanzi-encode =
        (f.encoding_rs."0.8.17".fast-gb-hanzi-encode or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17".fast-hangul-encode =
        (f.encoding_rs."0.8.17".fast-hangul-encode or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17".fast-hanja-encode =
        (f.encoding_rs."0.8.17".fast-hanja-encode or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17".fast-kanji-encode =
        (f.encoding_rs."0.8.17".fast-kanji-encode or false) ||
        (f.encoding_rs."0.8.17".fast-legacy-encode or false) ||
        (encoding_rs."0.8.17"."fast-legacy-encode" or false); }
      { "0.8.17".packed_simd =
        (f.encoding_rs."0.8.17".packed_simd or false) ||
        (f.encoding_rs."0.8.17".simd-accel or false) ||
        (encoding_rs."0.8.17"."simd-accel" or false); }
    ];
  }) [
    (features_.cfg_if."${deps."encoding_rs"."0.8.17"."cfg_if"}" deps)
  ];


# end
# env_logger-0.6.2

  crates.env_logger."0.6.2" = deps: { features?(features_.env_logger."0.6.2" deps {}) }: buildRustCrate {
    crateName = "env_logger";
    version = "0.6.2";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ws1zrbycvqhs18jyymy0d62v394j368060swgnn7500xrfdnl25";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."env_logger"."0.6.2"."log"}" deps)
    ]
      ++ (if features.env_logger."0.6.2".atty or false then [ (crates.atty."${deps."env_logger"."0.6.2".atty}" deps) ] else [])
      ++ (if features.env_logger."0.6.2".humantime or false then [ (crates.humantime."${deps."env_logger"."0.6.2".humantime}" deps) ] else [])
      ++ (if features.env_logger."0.6.2".regex or false then [ (crates.regex."${deps."env_logger"."0.6.2".regex}" deps) ] else [])
      ++ (if features.env_logger."0.6.2".termcolor or false then [ (crates.termcolor."${deps."env_logger"."0.6.2".termcolor}" deps) ] else []));
    features = mkFeatures (features."env_logger"."0.6.2" or {});
  };
  features_.env_logger."0.6.2" = deps: f: updateFeatures f (rec {
    atty."${deps.env_logger."0.6.2".atty}".default = true;
    env_logger = fold recursiveUpdate {} [
      { "0.6.2".atty =
        (f.env_logger."0.6.2".atty or false) ||
        (f.env_logger."0.6.2".default or false) ||
        (env_logger."0.6.2"."default" or false); }
      { "0.6.2".default = (f.env_logger."0.6.2".default or true); }
      { "0.6.2".humantime =
        (f.env_logger."0.6.2".humantime or false) ||
        (f.env_logger."0.6.2".default or false) ||
        (env_logger."0.6.2"."default" or false); }
      { "0.6.2".regex =
        (f.env_logger."0.6.2".regex or false) ||
        (f.env_logger."0.6.2".default or false) ||
        (env_logger."0.6.2"."default" or false); }
      { "0.6.2".termcolor =
        (f.env_logger."0.6.2".termcolor or false) ||
        (f.env_logger."0.6.2".default or false) ||
        (env_logger."0.6.2"."default" or false); }
    ];
    humantime."${deps.env_logger."0.6.2".humantime}".default = true;
    log = fold recursiveUpdate {} [
      { "${deps.env_logger."0.6.2".log}"."std" = true; }
      { "${deps.env_logger."0.6.2".log}".default = true; }
    ];
    regex."${deps.env_logger."0.6.2".regex}".default = true;
    termcolor."${deps.env_logger."0.6.2".termcolor}".default = true;
  }) [
    (features_.atty."${deps."env_logger"."0.6.2"."atty"}" deps)
    (features_.humantime."${deps."env_logger"."0.6.2"."humantime"}" deps)
    (features_.log."${deps."env_logger"."0.6.2"."log"}" deps)
    (features_.regex."${deps."env_logger"."0.6.2"."regex"}" deps)
    (features_.termcolor."${deps."env_logger"."0.6.2"."termcolor"}" deps)
  ];


# end
# error-chain-0.12.1

  crates.error_chain."0.12.1" = deps: { features?(features_.error_chain."0.12.1" deps {}) }: buildRustCrate {
    crateName = "error-chain";
    version = "0.12.1";
    authors = [ "Brian Anderson <banderson@mozilla.com>" "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" "Yamakaky <yamakaky@yamaworld.fr>" ];
    sha256 = "1lgs40xn50p0n4yqyryv9gzpvjw7sg355vjqcqmn5ai84rmh14m7";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.error_chain."0.12.1".backtrace or false then [ (crates.backtrace."${deps."error_chain"."0.12.1".backtrace}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."error_chain"."0.12.1"."version_check"}" deps)
    ]);
    features = mkFeatures (features."error_chain"."0.12.1" or {});
  };
  features_.error_chain."0.12.1" = deps: f: updateFeatures f (rec {
    backtrace."${deps.error_chain."0.12.1".backtrace}".default = true;
    error_chain = fold recursiveUpdate {} [
      { "0.12.1".backtrace =
        (f.error_chain."0.12.1".backtrace or false) ||
        (f.error_chain."0.12.1".default or false) ||
        (error_chain."0.12.1"."default" or false); }
      { "0.12.1".default = (f.error_chain."0.12.1".default or true); }
      { "0.12.1".example_generated =
        (f.error_chain."0.12.1".example_generated or false) ||
        (f.error_chain."0.12.1".default or false) ||
        (error_chain."0.12.1"."default" or false); }
    ];
    version_check."${deps.error_chain."0.12.1".version_check}".default = true;
  }) [
    (features_.backtrace."${deps."error_chain"."0.12.1"."backtrace"}" deps)
    (features_.version_check."${deps."error_chain"."0.12.1"."version_check"}" deps)
  ];


# end
# failure-0.1.5

  crates.failure."0.1.5" = deps: { features?(features_.failure."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure";
    version = "0.1.5";
    authors = [ "Without Boats <boats@mozilla.com>" ];
    sha256 = "1msaj1c0fg12dzyf4fhxqlx1gfx41lj2smdjmkc9hkrgajk2g3kx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.failure."0.1.5".backtrace or false then [ (crates.backtrace."${deps."failure"."0.1.5".backtrace}" deps) ] else [])
      ++ (if features.failure."0.1.5".failure_derive or false then [ (crates.failure_derive."${deps."failure"."0.1.5".failure_derive}" deps) ] else []));
    features = mkFeatures (features."failure"."0.1.5" or {});
  };
  features_.failure."0.1.5" = deps: f: updateFeatures f (rec {
    backtrace."${deps.failure."0.1.5".backtrace}".default = true;
    failure = fold recursiveUpdate {} [
      { "0.1.5".backtrace =
        (f.failure."0.1.5".backtrace or false) ||
        (f.failure."0.1.5".std or false) ||
        (failure."0.1.5"."std" or false); }
      { "0.1.5".default = (f.failure."0.1.5".default or true); }
      { "0.1.5".derive =
        (f.failure."0.1.5".derive or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5".failure_derive =
        (f.failure."0.1.5".failure_derive or false) ||
        (f.failure."0.1.5".derive or false) ||
        (failure."0.1.5"."derive" or false); }
      { "0.1.5".std =
        (f.failure."0.1.5".std or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
    ];
    failure_derive."${deps.failure."0.1.5".failure_derive}".default = true;
  }) [
    (features_.backtrace."${deps."failure"."0.1.5"."backtrace"}" deps)
    (features_.failure_derive."${deps."failure"."0.1.5"."failure_derive"}" deps)
  ];


# end
# failure_derive-0.1.5

  crates.failure_derive."0.1.5" = deps: { features?(features_.failure_derive."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure_derive";
    version = "0.1.5";
    authors = [ "Without Boats <woboats@gmail.com>" ];
    sha256 = "1wzk484b87r4qszcvdl2bkniv5ls4r2f2dshz7hmgiv6z4ln12g0";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."failure_derive"."0.1.5"."quote"}" deps)
      (crates."syn"."${deps."failure_derive"."0.1.5"."syn"}" deps)
      (crates."synstructure"."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
    ]);
    features = mkFeatures (features."failure_derive"."0.1.5" or {});
  };
  features_.failure_derive."0.1.5" = deps: f: updateFeatures f (rec {
    failure_derive."0.1.5".default = (f.failure_derive."0.1.5".default or true);
    proc_macro2."${deps.failure_derive."0.1.5".proc_macro2}".default = true;
    quote."${deps.failure_derive."0.1.5".quote}".default = true;
    syn."${deps.failure_derive."0.1.5".syn}".default = true;
    synstructure."${deps.failure_derive."0.1.5".synstructure}".default = true;
  }) [
    (features_.proc_macro2."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
    (features_.quote."${deps."failure_derive"."0.1.5"."quote"}" deps)
    (features_.syn."${deps."failure_derive"."0.1.5"."syn"}" deps)
    (features_.synstructure."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
  ];


# end
# fake-simd-0.1.2

  crates.fake_simd."0.1.2" = deps: { features?(features_.fake_simd."0.1.2" deps {}) }: buildRustCrate {
    crateName = "fake-simd";
    version = "0.1.2";
    authors = [ "The Rust-Crypto Project Developers" ];
    sha256 = "1a0f1j66nkwfy17s06vm2bn9vh8vy8llcijfhh9m10p58v08661a";
  };
  features_.fake_simd."0.1.2" = deps: f: updateFeatures f (rec {
    fake_simd."0.1.2".default = (f.fake_simd."0.1.2".default or true);
  }) [];


# end
# filetime-0.2.6

  crates.filetime."0.2.6" = deps: { features?(features_.filetime."0.2.6" deps {}) }: buildRustCrate {
    crateName = "filetime";
    version = "0.2.6";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "07yx5lmv4mbv5ynqdzviwrgsji42vk8wjvggdiy5daklf6885f94";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."filetime"."0.2.6"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."filetime"."0.2.6"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."filetime"."0.2.6"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."filetime"."0.2.6"."winapi"}" deps)
    ]) else []);
  };
  features_.filetime."0.2.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.filetime."0.2.6".cfg_if}".default = true;
    filetime."0.2.6".default = (f.filetime."0.2.6".default or true);
    libc."${deps.filetime."0.2.6".libc}".default = true;
    redox_syscall."${deps.filetime."0.2.6".redox_syscall}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.filetime."0.2.6".winapi}"."fileapi" = true; }
      { "${deps.filetime."0.2.6".winapi}"."minwindef" = true; }
      { "${deps.filetime."0.2.6".winapi}"."winbase" = true; }
      { "${deps.filetime."0.2.6".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."filetime"."0.2.6"."cfg_if"}" deps)
    (features_.redox_syscall."${deps."filetime"."0.2.6"."redox_syscall"}" deps)
    (features_.libc."${deps."filetime"."0.2.6"."libc"}" deps)
    (features_.winapi."${deps."filetime"."0.2.6"."winapi"}" deps)
  ];


# end
# flate2-1.0.9

  crates.flate2."1.0.9" = deps: { features?(features_.flate2."1.0.9" deps {}) }: buildRustCrate {
    crateName = "flate2";
    version = "1.0.9";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1zvi7gxw201p9acgz0bcxlpiagqf26nd7qa57rqim7hgxbi4dpy4";
    dependencies = mapFeatures features ([
      (crates."crc32fast"."${deps."flate2"."1.0.9"."crc32fast"}" deps)
      (crates."libc"."${deps."flate2"."1.0.9"."libc"}" deps)
    ]
      ++ (if features.flate2."1.0.9".miniz-sys or false then [ (crates.miniz_sys."${deps."flate2"."1.0.9".miniz_sys}" deps) ] else [])
      ++ (if features.flate2."1.0.9".miniz_oxide_c_api or false then [ (crates.miniz_oxide_c_api."${deps."flate2"."1.0.9".miniz_oxide_c_api}" deps) ] else []))
      ++ (if cpu == "wasm32" && !(kernel == "emscripten") then mapFeatures features ([
      (crates."miniz_oxide_c_api"."${deps."flate2"."1.0.9"."miniz_oxide_c_api"}" deps)
    ]) else []);
    features = mkFeatures (features."flate2"."1.0.9" or {});
  };
  features_.flate2."1.0.9" = deps: f: updateFeatures f (rec {
    crc32fast."${deps.flate2."1.0.9".crc32fast}".default = true;
    flate2 = fold recursiveUpdate {} [
      { "1.0.9".default = (f.flate2."1.0.9".default or true); }
      { "1.0.9".futures =
        (f.flate2."1.0.9".futures or false) ||
        (f.flate2."1.0.9".tokio or false) ||
        (flate2."1.0.9"."tokio" or false); }
      { "1.0.9".libz-sys =
        (f.flate2."1.0.9".libz-sys or false) ||
        (f.flate2."1.0.9".zlib or false) ||
        (flate2."1.0.9"."zlib" or false); }
      { "1.0.9".miniz-sys =
        (f.flate2."1.0.9".miniz-sys or false) ||
        (f.flate2."1.0.9".default or false) ||
        (flate2."1.0.9"."default" or false); }
      { "1.0.9".miniz_oxide_c_api =
        (f.flate2."1.0.9".miniz_oxide_c_api or false) ||
        (f.flate2."1.0.9".rust_backend or false) ||
        (flate2."1.0.9"."rust_backend" or false); }
      { "1.0.9".tokio-io =
        (f.flate2."1.0.9".tokio-io or false) ||
        (f.flate2."1.0.9".tokio or false) ||
        (flate2."1.0.9"."tokio" or false); }
    ];
    libc."${deps.flate2."1.0.9".libc}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "${deps.flate2."1.0.9".miniz_oxide_c_api}"."no_c_export" =
        (f.miniz_oxide_c_api."${deps.flate2."1.0.9".miniz_oxide_c_api}"."no_c_export" or false) ||
        true ||
        true; }
      { "${deps.flate2."1.0.9".miniz_oxide_c_api}".default = true; }
    ];
    miniz_sys."${deps.flate2."1.0.9".miniz_sys}".default = true;
  }) [
    (features_.crc32fast."${deps."flate2"."1.0.9"."crc32fast"}" deps)
    (features_.libc."${deps."flate2"."1.0.9"."libc"}" deps)
    (features_.miniz_sys."${deps."flate2"."1.0.9"."miniz_sys"}" deps)
    (features_.miniz_oxide_c_api."${deps."flate2"."1.0.9"."miniz_oxide_c_api"}" deps)
    (features_.miniz_oxide_c_api."${deps."flate2"."1.0.9"."miniz_oxide_c_api"}" deps)
  ];


# end
# fnv-1.0.6

  crates.fnv."1.0.6" = deps: { features?(features_.fnv."1.0.6" deps {}) }: buildRustCrate {
    crateName = "fnv";
    version = "1.0.6";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "128mlh23y3gg6ag5h8iiqlcbl59smisdzraqy88ldrf75kbw27ip";
    libPath = "lib.rs";
  };
  features_.fnv."1.0.6" = deps: f: updateFeatures f (rec {
    fnv."1.0.6".default = (f.fnv."1.0.6".default or true);
  }) [];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_.fuchsia_cprng."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_.fuchsia_cprng."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# fuchsia-zircon-0.3.3

  crates.fuchsia_zircon."0.3.3" = deps: { features?(features_.fuchsia_zircon."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon";
    version = "0.3.3";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "0jrf4shb1699r4la8z358vri8318w4mdi6qzfqy30p2ymjlca4gk";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
    ]);
  };
  features_.fuchsia_zircon."0.3.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.fuchsia_zircon."0.3.3".bitflags}".default = true;
    fuchsia_zircon."0.3.3".default = (f.fuchsia_zircon."0.3.3".default or true);
    fuchsia_zircon_sys."${deps.fuchsia_zircon."0.3.3".fuchsia_zircon_sys}".default = true;
  }) [
    (features_.bitflags."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
    (features_.fuchsia_zircon_sys."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
  ];


# end
# fuchsia-zircon-sys-0.3.3

  crates.fuchsia_zircon_sys."0.3.3" = deps: { features?(features_.fuchsia_zircon_sys."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon-sys";
    version = "0.3.3";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "08jp1zxrm9jbrr6l26bjal4dbm8bxfy57ickdgibsqxr1n9j3hf5";
  };
  features_.fuchsia_zircon_sys."0.3.3" = deps: f: updateFeatures f (rec {
    fuchsia_zircon_sys."0.3.3".default = (f.fuchsia_zircon_sys."0.3.3".default or true);
  }) [];


# end
# futures-0.1.28

  crates.futures."0.1.28" = deps: { features?(features_.futures."0.1.28" deps {}) }: buildRustCrate {
    crateName = "futures";
    version = "0.1.28";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0pkxsf15wcizg3qb0qkip52xis8kiq7rdxiw1f2whzq0mb7m6m0s";
    features = mkFeatures (features."futures"."0.1.28" or {});
  };
  features_.futures."0.1.28" = deps: f: updateFeatures f (rec {
    futures = fold recursiveUpdate {} [
      { "0.1.28".default = (f.futures."0.1.28".default or true); }
      { "0.1.28".use_std =
        (f.futures."0.1.28".use_std or false) ||
        (f.futures."0.1.28".default or false) ||
        (futures."0.1.28"."default" or false); }
      { "0.1.28".with-deprecated =
        (f.futures."0.1.28".with-deprecated or false) ||
        (f.futures."0.1.28".default or false) ||
        (futures."0.1.28"."default" or false); }
    ];
  }) [];


# end
# futures-cpupool-0.1.8

  crates.futures_cpupool."0.1.8" = deps: { features?(features_.futures_cpupool."0.1.8" deps {}) }: buildRustCrate {
    crateName = "futures-cpupool";
    version = "0.1.8";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0ficd31n5ljiixy6x0vjglhq4fp0v1p4qzxm3v6ymsrb3z080l5c";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."futures_cpupool"."0.1.8"."futures"}" deps)
      (crates."num_cpus"."${deps."futures_cpupool"."0.1.8"."num_cpus"}" deps)
    ]);
    features = mkFeatures (features."futures_cpupool"."0.1.8" or {});
  };
  features_.futures_cpupool."0.1.8" = deps: f: updateFeatures f (rec {
    futures = fold recursiveUpdate {} [
      { "${deps.futures_cpupool."0.1.8".futures}"."use_std" = true; }
      { "${deps.futures_cpupool."0.1.8".futures}"."with-deprecated" =
        (f.futures."${deps.futures_cpupool."0.1.8".futures}"."with-deprecated" or false) ||
        (futures_cpupool."0.1.8"."with-deprecated" or false) ||
        (f."futures_cpupool"."0.1.8"."with-deprecated" or false); }
      { "${deps.futures_cpupool."0.1.8".futures}".default = (f.futures."${deps.futures_cpupool."0.1.8".futures}".default or false); }
    ];
    futures_cpupool = fold recursiveUpdate {} [
      { "0.1.8".default = (f.futures_cpupool."0.1.8".default or true); }
      { "0.1.8".with-deprecated =
        (f.futures_cpupool."0.1.8".with-deprecated or false) ||
        (f.futures_cpupool."0.1.8".default or false) ||
        (futures_cpupool."0.1.8"."default" or false); }
    ];
    num_cpus."${deps.futures_cpupool."0.1.8".num_cpus}".default = true;
  }) [
    (features_.futures."${deps."futures_cpupool"."0.1.8"."futures"}" deps)
    (features_.num_cpus."${deps."futures_cpupool"."0.1.8"."num_cpus"}" deps)
  ];


# end
# generic-array-0.12.3

  crates.generic_array."0.12.3" = deps: { features?(features_.generic_array."0.12.3" deps {}) }: buildRustCrate {
    crateName = "generic-array";
    version = "0.12.3";
    authors = [ "Bartłomiej Kamiński <fizyk20@gmail.com>" "Aaron Trent <novacrazy@gmail.com>" ];
    sha256 = "1b6bvl1zsh5v9d85szkqfq4sw33xsw03mhchjk3zwxs29psg3nns";
    libName = "generic_array";
    dependencies = mapFeatures features ([
      (crates."typenum"."${deps."generic_array"."0.12.3"."typenum"}" deps)
    ]);
  };
  features_.generic_array."0.12.3" = deps: f: updateFeatures f (rec {
    generic_array."0.12.3".default = (f.generic_array."0.12.3".default or true);
    typenum."${deps.generic_array."0.12.3".typenum}".default = true;
  }) [
    (features_.typenum."${deps."generic_array"."0.12.3"."typenum"}" deps)
  ];


# end
# getrandom-0.1.6

  crates.getrandom."0.1.6" = deps: { features?(features_.getrandom."0.1.6" deps {}) }: buildRustCrate {
    crateName = "getrandom";
    version = "0.1.6";
    authors = [ "The Rand Project Developers" ];
    edition = "2018";
    sha256 = "0d14zm2c4fs8jyf5bbz3kwyjm2yqxqspchy6hjc7830yqvsaj3v8";
    dependencies = mapFeatures features ([
])
      ++ (if (kernel == "linux" || kernel == "darwin") || kernel == "redox" then mapFeatures features ([
      (crates."lazy_static"."${deps."getrandom"."0.1.6"."lazy_static"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") || kernel == "wasi" then mapFeatures features ([
      (crates."libc"."${deps."getrandom"."0.1.6"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "uefi" then mapFeatures features ([
      (crates."lazy_static"."${deps."getrandom"."0.1.6"."lazy_static"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
      (crates."lazy_static"."${deps."getrandom"."0.1.6"."lazy_static"}" deps)
    ]) else []);
    features = mkFeatures (features."getrandom"."0.1.6" or {});
  };
  features_.getrandom."0.1.6" = deps: f: updateFeatures f (rec {
    getrandom."0.1.6".default = (f.getrandom."0.1.6".default or true);
    lazy_static = fold recursiveUpdate {} [
      { "${deps.getrandom."0.1.6".lazy_static}"."spin_no_std" = true; }
      { "${deps.getrandom."0.1.6".lazy_static}".default = true; }
    ];
    libc."${deps.getrandom."0.1.6".libc}".default = true;
  }) [
    (features_.lazy_static."${deps."getrandom"."0.1.6"."lazy_static"}" deps)
    (features_.libc."${deps."getrandom"."0.1.6"."libc"}" deps)
    (features_.lazy_static."${deps."getrandom"."0.1.6"."lazy_static"}" deps)
    (features_.lazy_static."${deps."getrandom"."0.1.6"."lazy_static"}" deps)
  ];


# end
# goblin-0.0.22

  crates.goblin."0.0.22" = deps: { features?(features_.goblin."0.0.22" deps {}) }: buildRustCrate {
    crateName = "goblin";
    version = "0.0.22";
    authors = [ "m4b <m4b.github.io@gmail.com>" "seu <seu@panopticon.re>" "Will Glynn <will@willglynn.com>" "Philip Craig <philipjcraig@gmail.com>" ];
    edition = "2018";
    sha256 = "0y7parzflfb86jrxvk4m62pla7489mx1vxdl38ygqrm8vnyc3n85";
    dependencies = mapFeatures features ([
      (crates."plain"."${deps."goblin"."0.0.22"."plain"}" deps)
      (crates."scroll"."${deps."goblin"."0.0.22"."scroll"}" deps)
    ]
      ++ (if features.goblin."0.0.22".log or false then [ (crates.log."${deps."goblin"."0.0.22".log}" deps) ] else []));
    features = mkFeatures (features."goblin"."0.0.22" or {});
  };
  features_.goblin."0.0.22" = deps: f: updateFeatures f (rec {
    goblin = fold recursiveUpdate {} [
      { "0.0.22".alloc =
        (f.goblin."0.0.22".alloc or false) ||
        (f.goblin."0.0.22".archive or false) ||
        (goblin."0.0.22"."archive" or false) ||
        (f.goblin."0.0.22".endian_fd or false) ||
        (goblin."0.0.22"."endian_fd" or false) ||
        (f.goblin."0.0.22".mach32 or false) ||
        (goblin."0.0.22"."mach32" or false) ||
        (f.goblin."0.0.22".mach64 or false) ||
        (goblin."0.0.22"."mach64" or false) ||
        (f.goblin."0.0.22".pe32 or false) ||
        (goblin."0.0.22"."pe32" or false) ||
        (f.goblin."0.0.22".pe64 or false) ||
        (goblin."0.0.22"."pe64" or false) ||
        (f.goblin."0.0.22".std or false) ||
        (goblin."0.0.22"."std" or false); }
      { "0.0.22".archive =
        (f.goblin."0.0.22".archive or false) ||
        (f.goblin."0.0.22".default or false) ||
        (goblin."0.0.22"."default" or false); }
      { "0.0.22".default = (f.goblin."0.0.22".default or true); }
      { "0.0.22".elf32 =
        (f.goblin."0.0.22".elf32 or false) ||
        (f.goblin."0.0.22".default or false) ||
        (goblin."0.0.22"."default" or false); }
      { "0.0.22".elf64 =
        (f.goblin."0.0.22".elf64 or false) ||
        (f.goblin."0.0.22".default or false) ||
        (goblin."0.0.22"."default" or false); }
      { "0.0.22".endian_fd =
        (f.goblin."0.0.22".endian_fd or false) ||
        (f.goblin."0.0.22".default or false) ||
        (goblin."0.0.22"."default" or false) ||
        (f.goblin."0.0.22".mach32 or false) ||
        (goblin."0.0.22"."mach32" or false) ||
        (f.goblin."0.0.22".mach64 or false) ||
        (goblin."0.0.22"."mach64" or false) ||
        (f.goblin."0.0.22".pe32 or false) ||
        (goblin."0.0.22"."pe32" or false) ||
        (f.goblin."0.0.22".pe64 or false) ||
        (goblin."0.0.22"."pe64" or false); }
      { "0.0.22".log =
        (f.goblin."0.0.22".log or false) ||
        (f.goblin."0.0.22".alloc or false) ||
        (goblin."0.0.22"."alloc" or false); }
      { "0.0.22".mach32 =
        (f.goblin."0.0.22".mach32 or false) ||
        (f.goblin."0.0.22".default or false) ||
        (goblin."0.0.22"."default" or false); }
      { "0.0.22".mach64 =
        (f.goblin."0.0.22".mach64 or false) ||
        (f.goblin."0.0.22".default or false) ||
        (goblin."0.0.22"."default" or false); }
      { "0.0.22".pe32 =
        (f.goblin."0.0.22".pe32 or false) ||
        (f.goblin."0.0.22".default or false) ||
        (goblin."0.0.22"."default" or false); }
      { "0.0.22".pe64 =
        (f.goblin."0.0.22".pe64 or false) ||
        (f.goblin."0.0.22".default or false) ||
        (goblin."0.0.22"."default" or false); }
      { "0.0.22".std =
        (f.goblin."0.0.22".std or false) ||
        (f.goblin."0.0.22".default or false) ||
        (goblin."0.0.22"."default" or false); }
    ];
    log."${deps.goblin."0.0.22".log}".default = (f.log."${deps.goblin."0.0.22".log}".default or false);
    plain."${deps.goblin."0.0.22".plain}".default = true;
    scroll = fold recursiveUpdate {} [
      { "${deps.goblin."0.0.22".scroll}"."derive" =
        (f.scroll."${deps.goblin."0.0.22".scroll}"."derive" or false) ||
        (goblin."0.0.22"."alloc" or false) ||
        (f."goblin"."0.0.22"."alloc" or false); }
      { "${deps.goblin."0.0.22".scroll}"."std" =
        (f.scroll."${deps.goblin."0.0.22".scroll}"."std" or false) ||
        (goblin."0.0.22"."std" or false) ||
        (f."goblin"."0.0.22"."std" or false); }
      { "${deps.goblin."0.0.22".scroll}".default = true; }
    ];
  }) [
    (features_.log."${deps."goblin"."0.0.22"."log"}" deps)
    (features_.plain."${deps."goblin"."0.0.22"."plain"}" deps)
    (features_.scroll."${deps."goblin"."0.0.22"."scroll"}" deps)
  ];


# end
# h2-0.1.25

  crates.h2."0.1.25" = deps: { features?(features_.h2."0.1.25" deps {}) }: buildRustCrate {
    crateName = "h2";
    version = "0.1.25";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1v496qjybxh67za2gnlkxjwvlghh4fh9n3q75m3x4gp526k141ph";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."h2"."0.1.25"."byteorder"}" deps)
      (crates."bytes"."${deps."h2"."0.1.25"."bytes"}" deps)
      (crates."fnv"."${deps."h2"."0.1.25"."fnv"}" deps)
      (crates."futures"."${deps."h2"."0.1.25"."futures"}" deps)
      (crates."http"."${deps."h2"."0.1.25"."http"}" deps)
      (crates."indexmap"."${deps."h2"."0.1.25"."indexmap"}" deps)
      (crates."log"."${deps."h2"."0.1.25"."log"}" deps)
      (crates."slab"."${deps."h2"."0.1.25"."slab"}" deps)
      (crates."string"."${deps."h2"."0.1.25"."string"}" deps)
      (crates."tokio_io"."${deps."h2"."0.1.25"."tokio_io"}" deps)
    ]);
    features = mkFeatures (features."h2"."0.1.25" or {});
  };
  features_.h2."0.1.25" = deps: f: updateFeatures f (rec {
    byteorder."${deps.h2."0.1.25".byteorder}".default = true;
    bytes."${deps.h2."0.1.25".bytes}".default = true;
    fnv."${deps.h2."0.1.25".fnv}".default = true;
    futures."${deps.h2."0.1.25".futures}".default = true;
    h2."0.1.25".default = (f.h2."0.1.25".default or true);
    http."${deps.h2."0.1.25".http}".default = true;
    indexmap."${deps.h2."0.1.25".indexmap}".default = true;
    log."${deps.h2."0.1.25".log}".default = true;
    slab."${deps.h2."0.1.25".slab}".default = true;
    string."${deps.h2."0.1.25".string}".default = true;
    tokio_io."${deps.h2."0.1.25".tokio_io}".default = true;
  }) [
    (features_.byteorder."${deps."h2"."0.1.25"."byteorder"}" deps)
    (features_.bytes."${deps."h2"."0.1.25"."bytes"}" deps)
    (features_.fnv."${deps."h2"."0.1.25"."fnv"}" deps)
    (features_.futures."${deps."h2"."0.1.25"."futures"}" deps)
    (features_.http."${deps."h2"."0.1.25"."http"}" deps)
    (features_.indexmap."${deps."h2"."0.1.25"."indexmap"}" deps)
    (features_.log."${deps."h2"."0.1.25"."log"}" deps)
    (features_.slab."${deps."h2"."0.1.25"."slab"}" deps)
    (features_.string."${deps."h2"."0.1.25"."string"}" deps)
    (features_.tokio_io."${deps."h2"."0.1.25"."tokio_io"}" deps)
  ];


# end
# heck-0.3.1

  crates.heck."0.3.1" = deps: { features?(features_.heck."0.3.1" deps {}) }: buildRustCrate {
    crateName = "heck";
    version = "0.3.1";
    authors = [ "Without Boats <woboats@gmail.com>" ];
    sha256 = "1q7vmnlh62kls6cvkfhbcacxkawaznaqa5wwm9dg1xkcza846c3d";
    dependencies = mapFeatures features ([
      (crates."unicode_segmentation"."${deps."heck"."0.3.1"."unicode_segmentation"}" deps)
    ]);
  };
  features_.heck."0.3.1" = deps: f: updateFeatures f (rec {
    heck."0.3.1".default = (f.heck."0.3.1".default or true);
    unicode_segmentation."${deps.heck."0.3.1".unicode_segmentation}".default = true;
  }) [
    (features_.unicode_segmentation."${deps."heck"."0.3.1"."unicode_segmentation"}" deps)
  ];


# end
# http-0.1.17

  crates.http."0.1.17" = deps: { features?(features_.http."0.1.17" deps {}) }: buildRustCrate {
    crateName = "http";
    version = "0.1.17";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Carl Lerche <me@carllerche.com>" "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0q71wgggg1h5kjyg1gb4m70g3ian9qwrkx2b9wwvfyafrkmjpg9c";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."http"."0.1.17"."bytes"}" deps)
      (crates."fnv"."${deps."http"."0.1.17"."fnv"}" deps)
      (crates."itoa"."${deps."http"."0.1.17"."itoa"}" deps)
    ]);
  };
  features_.http."0.1.17" = deps: f: updateFeatures f (rec {
    bytes."${deps.http."0.1.17".bytes}".default = true;
    fnv."${deps.http."0.1.17".fnv}".default = true;
    http."0.1.17".default = (f.http."0.1.17".default or true);
    itoa."${deps.http."0.1.17".itoa}".default = true;
  }) [
    (features_.bytes."${deps."http"."0.1.17"."bytes"}" deps)
    (features_.fnv."${deps."http"."0.1.17"."fnv"}" deps)
    (features_.itoa."${deps."http"."0.1.17"."itoa"}" deps)
  ];


# end
# http-body-0.1.0

  crates.http_body."0.1.0" = deps: { features?(features_.http_body."0.1.0" deps {}) }: buildRustCrate {
    crateName = "http-body";
    version = "0.1.0";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0rbk76455i6l9wrhcgq5p7hbvf9h9fc8ylbfphy4m5qswghly70m";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."http_body"."0.1.0"."bytes"}" deps)
      (crates."futures"."${deps."http_body"."0.1.0"."futures"}" deps)
      (crates."http"."${deps."http_body"."0.1.0"."http"}" deps)
      (crates."tokio_buf"."${deps."http_body"."0.1.0"."tokio_buf"}" deps)
    ]);
  };
  features_.http_body."0.1.0" = deps: f: updateFeatures f (rec {
    bytes."${deps.http_body."0.1.0".bytes}".default = true;
    futures."${deps.http_body."0.1.0".futures}".default = true;
    http."${deps.http_body."0.1.0".http}".default = true;
    http_body."0.1.0".default = (f.http_body."0.1.0".default or true);
    tokio_buf."${deps.http_body."0.1.0".tokio_buf}".default = (f.tokio_buf."${deps.http_body."0.1.0".tokio_buf}".default or false);
  }) [
    (features_.bytes."${deps."http_body"."0.1.0"."bytes"}" deps)
    (features_.futures."${deps."http_body"."0.1.0"."futures"}" deps)
    (features_.http."${deps."http_body"."0.1.0"."http"}" deps)
    (features_.tokio_buf."${deps."http_body"."0.1.0"."tokio_buf"}" deps)
  ];


# end
# httparse-1.3.4

  crates.httparse."1.3.4" = deps: { features?(features_.httparse."1.3.4" deps {}) }: buildRustCrate {
    crateName = "httparse";
    version = "1.3.4";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0dggj4s0cq69bn63q9nqzzay5acmwl33nrbhjjsh5xys8sk2x4jw";
    build = "build.rs";
    features = mkFeatures (features."httparse"."1.3.4" or {});
  };
  features_.httparse."1.3.4" = deps: f: updateFeatures f (rec {
    httparse = fold recursiveUpdate {} [
      { "1.3.4".default = (f.httparse."1.3.4".default or true); }
      { "1.3.4".std =
        (f.httparse."1.3.4".std or false) ||
        (f.httparse."1.3.4".default or false) ||
        (httparse."1.3.4"."default" or false); }
    ];
  }) [];


# end
# humantime-1.2.0

  crates.humantime."1.2.0" = deps: { features?(features_.humantime."1.2.0" deps {}) }: buildRustCrate {
    crateName = "humantime";
    version = "1.2.0";
    authors = [ "Paul Colomiets <paul@colomiets.name>" ];
    sha256 = "0wlcxzz2mhq0brkfbjb12hc6jm17bgm8m6pdgblw4qjwmf26aw28";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."quick_error"."${deps."humantime"."1.2.0"."quick_error"}" deps)
    ]);
  };
  features_.humantime."1.2.0" = deps: f: updateFeatures f (rec {
    humantime."1.2.0".default = (f.humantime."1.2.0".default or true);
    quick_error."${deps.humantime."1.2.0".quick_error}".default = true;
  }) [
    (features_.quick_error."${deps."humantime"."1.2.0"."quick_error"}" deps)
  ];


# end
# hyper-0.12.31

  crates.hyper."0.12.31" = deps: { features?(features_.hyper."0.12.31" deps {}) }: buildRustCrate {
    crateName = "hyper";
    version = "0.12.31";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0p975mp6lgkk8v64pbk7rn597m7h4fyyyf5a5j25mi59z11kz0jb";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."hyper"."0.12.31"."bytes"}" deps)
      (crates."futures"."${deps."hyper"."0.12.31"."futures"}" deps)
      (crates."h2"."${deps."hyper"."0.12.31"."h2"}" deps)
      (crates."http"."${deps."hyper"."0.12.31"."http"}" deps)
      (crates."http_body"."${deps."hyper"."0.12.31"."http_body"}" deps)
      (crates."httparse"."${deps."hyper"."0.12.31"."httparse"}" deps)
      (crates."iovec"."${deps."hyper"."0.12.31"."iovec"}" deps)
      (crates."itoa"."${deps."hyper"."0.12.31"."itoa"}" deps)
      (crates."log"."${deps."hyper"."0.12.31"."log"}" deps)
      (crates."time"."${deps."hyper"."0.12.31"."time"}" deps)
      (crates."tokio_buf"."${deps."hyper"."0.12.31"."tokio_buf"}" deps)
      (crates."tokio_io"."${deps."hyper"."0.12.31"."tokio_io"}" deps)
      (crates."want"."${deps."hyper"."0.12.31"."want"}" deps)
    ]
      ++ (if features.hyper."0.12.31".futures-cpupool or false then [ (crates.futures_cpupool."${deps."hyper"."0.12.31".futures_cpupool}" deps) ] else [])
      ++ (if features.hyper."0.12.31".net2 or false then [ (crates.net2."${deps."hyper"."0.12.31".net2}" deps) ] else [])
      ++ (if features.hyper."0.12.31".tokio or false then [ (crates.tokio."${deps."hyper"."0.12.31".tokio}" deps) ] else [])
      ++ (if features.hyper."0.12.31".tokio-executor or false then [ (crates.tokio_executor."${deps."hyper"."0.12.31".tokio_executor}" deps) ] else [])
      ++ (if features.hyper."0.12.31".tokio-reactor or false then [ (crates.tokio_reactor."${deps."hyper"."0.12.31".tokio_reactor}" deps) ] else [])
      ++ (if features.hyper."0.12.31".tokio-tcp or false then [ (crates.tokio_tcp."${deps."hyper"."0.12.31".tokio_tcp}" deps) ] else [])
      ++ (if features.hyper."0.12.31".tokio-threadpool or false then [ (crates.tokio_threadpool."${deps."hyper"."0.12.31".tokio_threadpool}" deps) ] else [])
      ++ (if features.hyper."0.12.31".tokio-timer or false then [ (crates.tokio_timer."${deps."hyper"."0.12.31".tokio_timer}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."hyper"."0.12.31"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."hyper"."0.12.31" or {});
  };
  features_.hyper."0.12.31" = deps: f: updateFeatures f (rec {
    bytes."${deps.hyper."0.12.31".bytes}".default = true;
    futures."${deps.hyper."0.12.31".futures}".default = true;
    futures_cpupool."${deps.hyper."0.12.31".futures_cpupool}".default = true;
    h2."${deps.hyper."0.12.31".h2}".default = true;
    http."${deps.hyper."0.12.31".http}".default = true;
    http_body."${deps.hyper."0.12.31".http_body}".default = true;
    httparse."${deps.hyper."0.12.31".httparse}".default = true;
    hyper = fold recursiveUpdate {} [
      { "0.12.31".__internal_flaky_tests =
        (f.hyper."0.12.31".__internal_flaky_tests or false) ||
        (f.hyper."0.12.31".default or false) ||
        (hyper."0.12.31"."default" or false); }
      { "0.12.31".default = (f.hyper."0.12.31".default or true); }
      { "0.12.31".futures-cpupool =
        (f.hyper."0.12.31".futures-cpupool or false) ||
        (f.hyper."0.12.31".runtime or false) ||
        (hyper."0.12.31"."runtime" or false); }
      { "0.12.31".net2 =
        (f.hyper."0.12.31".net2 or false) ||
        (f.hyper."0.12.31".runtime or false) ||
        (hyper."0.12.31"."runtime" or false); }
      { "0.12.31".runtime =
        (f.hyper."0.12.31".runtime or false) ||
        (f.hyper."0.12.31".default or false) ||
        (hyper."0.12.31"."default" or false); }
      { "0.12.31".tokio =
        (f.hyper."0.12.31".tokio or false) ||
        (f.hyper."0.12.31".runtime or false) ||
        (hyper."0.12.31"."runtime" or false); }
      { "0.12.31".tokio-executor =
        (f.hyper."0.12.31".tokio-executor or false) ||
        (f.hyper."0.12.31".runtime or false) ||
        (hyper."0.12.31"."runtime" or false); }
      { "0.12.31".tokio-reactor =
        (f.hyper."0.12.31".tokio-reactor or false) ||
        (f.hyper."0.12.31".runtime or false) ||
        (hyper."0.12.31"."runtime" or false); }
      { "0.12.31".tokio-tcp =
        (f.hyper."0.12.31".tokio-tcp or false) ||
        (f.hyper."0.12.31".runtime or false) ||
        (hyper."0.12.31"."runtime" or false); }
      { "0.12.31".tokio-threadpool =
        (f.hyper."0.12.31".tokio-threadpool or false) ||
        (f.hyper."0.12.31".runtime or false) ||
        (hyper."0.12.31"."runtime" or false); }
      { "0.12.31".tokio-timer =
        (f.hyper."0.12.31".tokio-timer or false) ||
        (f.hyper."0.12.31".runtime or false) ||
        (hyper."0.12.31"."runtime" or false); }
    ];
    iovec."${deps.hyper."0.12.31".iovec}".default = true;
    itoa."${deps.hyper."0.12.31".itoa}".default = true;
    log."${deps.hyper."0.12.31".log}".default = true;
    net2."${deps.hyper."0.12.31".net2}".default = true;
    rustc_version."${deps.hyper."0.12.31".rustc_version}".default = true;
    time."${deps.hyper."0.12.31".time}".default = true;
    tokio = fold recursiveUpdate {} [
      { "${deps.hyper."0.12.31".tokio}"."rt-full" = true; }
      { "${deps.hyper."0.12.31".tokio}".default = (f.tokio."${deps.hyper."0.12.31".tokio}".default or false); }
    ];
    tokio_buf."${deps.hyper."0.12.31".tokio_buf}".default = true;
    tokio_executor."${deps.hyper."0.12.31".tokio_executor}".default = true;
    tokio_io."${deps.hyper."0.12.31".tokio_io}".default = true;
    tokio_reactor."${deps.hyper."0.12.31".tokio_reactor}".default = true;
    tokio_tcp."${deps.hyper."0.12.31".tokio_tcp}".default = true;
    tokio_threadpool."${deps.hyper."0.12.31".tokio_threadpool}".default = true;
    tokio_timer."${deps.hyper."0.12.31".tokio_timer}".default = true;
    want."${deps.hyper."0.12.31".want}".default = true;
  }) [
    (features_.bytes."${deps."hyper"."0.12.31"."bytes"}" deps)
    (features_.futures."${deps."hyper"."0.12.31"."futures"}" deps)
    (features_.futures_cpupool."${deps."hyper"."0.12.31"."futures_cpupool"}" deps)
    (features_.h2."${deps."hyper"."0.12.31"."h2"}" deps)
    (features_.http."${deps."hyper"."0.12.31"."http"}" deps)
    (features_.http_body."${deps."hyper"."0.12.31"."http_body"}" deps)
    (features_.httparse."${deps."hyper"."0.12.31"."httparse"}" deps)
    (features_.iovec."${deps."hyper"."0.12.31"."iovec"}" deps)
    (features_.itoa."${deps."hyper"."0.12.31"."itoa"}" deps)
    (features_.log."${deps."hyper"."0.12.31"."log"}" deps)
    (features_.net2."${deps."hyper"."0.12.31"."net2"}" deps)
    (features_.time."${deps."hyper"."0.12.31"."time"}" deps)
    (features_.tokio."${deps."hyper"."0.12.31"."tokio"}" deps)
    (features_.tokio_buf."${deps."hyper"."0.12.31"."tokio_buf"}" deps)
    (features_.tokio_executor."${deps."hyper"."0.12.31"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."hyper"."0.12.31"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."hyper"."0.12.31"."tokio_reactor"}" deps)
    (features_.tokio_tcp."${deps."hyper"."0.12.31"."tokio_tcp"}" deps)
    (features_.tokio_threadpool."${deps."hyper"."0.12.31"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."hyper"."0.12.31"."tokio_timer"}" deps)
    (features_.want."${deps."hyper"."0.12.31"."want"}" deps)
    (features_.rustc_version."${deps."hyper"."0.12.31"."rustc_version"}" deps)
  ];


# end
# hyper-rustls-0.16.1

  crates.hyper_rustls."0.16.1" = deps: { features?(features_.hyper_rustls."0.16.1" deps {}) }: buildRustCrate {
    crateName = "hyper-rustls";
    version = "0.16.1";
    authors = [ "Joseph Birr-Pixton <jpixton@gmail.com>" ];
    sha256 = "0c1xkg1ar31h4cz6bzbm4v477zyi46jsf2jp46nrqfj1crjzpjmy";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."hyper_rustls"."0.16.1"."bytes"}" deps)
      (crates."futures"."${deps."hyper_rustls"."0.16.1"."futures"}" deps)
      (crates."hyper"."${deps."hyper_rustls"."0.16.1"."hyper"}" deps)
      (crates."rustls"."${deps."hyper_rustls"."0.16.1"."rustls"}" deps)
      (crates."tokio_io"."${deps."hyper_rustls"."0.16.1"."tokio_io"}" deps)
      (crates."tokio_rustls"."${deps."hyper_rustls"."0.16.1"."tokio_rustls"}" deps)
      (crates."webpki"."${deps."hyper_rustls"."0.16.1"."webpki"}" deps)
    ]
      ++ (if features.hyper_rustls."0.16.1".ct-logs or false then [ (crates.ct_logs."${deps."hyper_rustls"."0.16.1".ct_logs}" deps) ] else [])
      ++ (if features.hyper_rustls."0.16.1".webpki-roots or false then [ (crates.webpki_roots."${deps."hyper_rustls"."0.16.1".webpki_roots}" deps) ] else []));
    features = mkFeatures (features."hyper_rustls"."0.16.1" or {});
  };
  features_.hyper_rustls."0.16.1" = deps: f: updateFeatures f (rec {
    bytes."${deps.hyper_rustls."0.16.1".bytes}".default = true;
    ct_logs."${deps.hyper_rustls."0.16.1".ct_logs}".default = true;
    futures."${deps.hyper_rustls."0.16.1".futures}".default = true;
    hyper = fold recursiveUpdate {} [
      { "${deps.hyper_rustls."0.16.1".hyper}"."runtime" =
        (f.hyper."${deps.hyper_rustls."0.16.1".hyper}"."runtime" or false) ||
        (hyper_rustls."0.16.1"."tokio-runtime" or false) ||
        (f."hyper_rustls"."0.16.1"."tokio-runtime" or false); }
      { "${deps.hyper_rustls."0.16.1".hyper}".default = (f.hyper."${deps.hyper_rustls."0.16.1".hyper}".default or false); }
    ];
    hyper_rustls = fold recursiveUpdate {} [
      { "0.16.1".ct-logs =
        (f.hyper_rustls."0.16.1".ct-logs or false) ||
        (f.hyper_rustls."0.16.1".tokio-runtime or false) ||
        (hyper_rustls."0.16.1"."tokio-runtime" or false); }
      { "0.16.1".default = (f.hyper_rustls."0.16.1".default or true); }
      { "0.16.1".tokio-runtime =
        (f.hyper_rustls."0.16.1".tokio-runtime or false) ||
        (f.hyper_rustls."0.16.1".default or false) ||
        (hyper_rustls."0.16.1"."default" or false); }
      { "0.16.1".webpki-roots =
        (f.hyper_rustls."0.16.1".webpki-roots or false) ||
        (f.hyper_rustls."0.16.1".tokio-runtime or false) ||
        (hyper_rustls."0.16.1"."tokio-runtime" or false); }
    ];
    rustls."${deps.hyper_rustls."0.16.1".rustls}".default = true;
    tokio_io."${deps.hyper_rustls."0.16.1".tokio_io}".default = true;
    tokio_rustls."${deps.hyper_rustls."0.16.1".tokio_rustls}".default = true;
    webpki."${deps.hyper_rustls."0.16.1".webpki}".default = true;
    webpki_roots."${deps.hyper_rustls."0.16.1".webpki_roots}".default = true;
  }) [
    (features_.bytes."${deps."hyper_rustls"."0.16.1"."bytes"}" deps)
    (features_.ct_logs."${deps."hyper_rustls"."0.16.1"."ct_logs"}" deps)
    (features_.futures."${deps."hyper_rustls"."0.16.1"."futures"}" deps)
    (features_.hyper."${deps."hyper_rustls"."0.16.1"."hyper"}" deps)
    (features_.rustls."${deps."hyper_rustls"."0.16.1"."rustls"}" deps)
    (features_.tokio_io."${deps."hyper_rustls"."0.16.1"."tokio_io"}" deps)
    (features_.tokio_rustls."${deps."hyper_rustls"."0.16.1"."tokio_rustls"}" deps)
    (features_.webpki."${deps."hyper_rustls"."0.16.1"."webpki"}" deps)
    (features_.webpki_roots."${deps."hyper_rustls"."0.16.1"."webpki_roots"}" deps)
  ];


# end
# idna-0.1.5

  crates.idna."0.1.5" = deps: { features?(features_.idna."0.1.5" deps {}) }: buildRustCrate {
    crateName = "idna";
    version = "0.1.5";
    authors = [ "The rust-url developers" ];
    sha256 = "1gwgl19rz5vzi67rrhamczhxy050f5ynx4ybabfapyalv7z1qmjy";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."idna"."0.1.5"."matches"}" deps)
      (crates."unicode_bidi"."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
      (crates."unicode_normalization"."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
    ]);
  };
  features_.idna."0.1.5" = deps: f: updateFeatures f (rec {
    idna."0.1.5".default = (f.idna."0.1.5".default or true);
    matches."${deps.idna."0.1.5".matches}".default = true;
    unicode_bidi."${deps.idna."0.1.5".unicode_bidi}".default = true;
    unicode_normalization."${deps.idna."0.1.5".unicode_normalization}".default = true;
  }) [
    (features_.matches."${deps."idna"."0.1.5"."matches"}" deps)
    (features_.unicode_bidi."${deps."idna"."0.1.5"."unicode_bidi"}" deps)
    (features_.unicode_normalization."${deps."idna"."0.1.5"."unicode_normalization"}" deps)
  ];


# end
# indexmap-1.0.2

  crates.indexmap."1.0.2" = deps: { features?(features_.indexmap."1.0.2" deps {}) }: buildRustCrate {
    crateName = "indexmap";
    version = "1.0.2";
    authors = [ "bluss" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "18a0cn5xy3a7wswxg5lwfg3j4sh5blk28ykw0ysgr486djd353gf";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."indexmap"."1.0.2" or {});
  };
  features_.indexmap."1.0.2" = deps: f: updateFeatures f (rec {
    indexmap = fold recursiveUpdate {} [
      { "1.0.2".default = (f.indexmap."1.0.2".default or true); }
      { "1.0.2".serde =
        (f.indexmap."1.0.2".serde or false) ||
        (f.indexmap."1.0.2".serde-1 or false) ||
        (indexmap."1.0.2"."serde-1" or false); }
    ];
  }) [];


# end
# iovec-0.1.2

  crates.iovec."0.1.2" = deps: { features?(features_.iovec."0.1.2" deps {}) }: buildRustCrate {
    crateName = "iovec";
    version = "0.1.2";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0vjymmb7wj4v4kza5jjn48fcdb85j3k37y7msjl3ifz0p9yiyp2r";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."iovec"."0.1.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."iovec"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.iovec."0.1.2" = deps: f: updateFeatures f (rec {
    iovec."0.1.2".default = (f.iovec."0.1.2".default or true);
    libc."${deps.iovec."0.1.2".libc}".default = true;
    winapi."${deps.iovec."0.1.2".winapi}".default = true;
  }) [
    (features_.libc."${deps."iovec"."0.1.2"."libc"}" deps)
    (features_.winapi."${deps."iovec"."0.1.2"."winapi"}" deps)
  ];


# end
# itoa-0.4.4

  crates.itoa."0.4.4" = deps: { features?(features_.itoa."0.4.4" deps {}) }: buildRustCrate {
    crateName = "itoa";
    version = "0.4.4";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1fqc34xzzl2spfdawxd9awhzl0fwf1y6y4i94l8bq8rfrzd90awl";
    features = mkFeatures (features."itoa"."0.4.4" or {});
  };
  features_.itoa."0.4.4" = deps: f: updateFeatures f (rec {
    itoa = fold recursiveUpdate {} [
      { "0.4.4".default = (f.itoa."0.4.4".default or true); }
      { "0.4.4".std =
        (f.itoa."0.4.4".std or false) ||
        (f.itoa."0.4.4".default or false) ||
        (itoa."0.4.4"."default" or false); }
    ];
  }) [];


# end
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
    libName = "kernel32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
    ]);
  };
  features_.kernel32_sys."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    (features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
  ];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_.lazy_static."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.lazy_static."1.3.0".spin or false then [ (crates.spin."${deps."lazy_static"."1.3.0".spin}" deps) ] else []));
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_.lazy_static."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
      { "1.3.0".spin =
        (f.lazy_static."1.3.0".spin or false) ||
        (f.lazy_static."1.3.0".spin_no_std or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
    ];
    spin."${deps.lazy_static."1.3.0".spin}".default = true;
  }) [
    (features_.spin."${deps."lazy_static"."1.3.0"."spin"}" deps)
  ];


# end
# libc-0.2.58

  crates.libc."0.2.58" = deps: { features?(features_.libc."0.2.58" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.58";
    authors = [ "The Rust Project Developers" ];
    sha256 = "06yk3c0qlcn925ap1rrhikpzgwf504ydkcadj41kib7a06f66k7c";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.58" or {});
  };
  features_.libc."0.2.58" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.58".align =
        (f.libc."0.2.58".align or false) ||
        (f.libc."0.2.58".rustc-dep-of-std or false) ||
        (libc."0.2.58"."rustc-dep-of-std" or false); }
      { "0.2.58".default = (f.libc."0.2.58".default or true); }
      { "0.2.58".rustc-std-workspace-core =
        (f.libc."0.2.58".rustc-std-workspace-core or false) ||
        (f.libc."0.2.58".rustc-dep-of-std or false) ||
        (libc."0.2.58"."rustc-dep-of-std" or false); }
      { "0.2.58".std =
        (f.libc."0.2.58".std or false) ||
        (f.libc."0.2.58".default or false) ||
        (libc."0.2.58"."default" or false) ||
        (f.libc."0.2.58".use_std or false) ||
        (libc."0.2.58"."use_std" or false); }
    ];
  }) [];


# end
# libflate-0.1.25

  crates.libflate."0.1.25" = deps: { features?(features_.libflate."0.1.25" deps {}) }: buildRustCrate {
    crateName = "libflate";
    version = "0.1.25";
    authors = [ "Takeru Ohta <phjgt308@gmail.com>" ];
    sha256 = "1sd1rd8i2lqddf98n9lsps76iymqxl7r22swjb9p65lrkipi6m4a";
    dependencies = mapFeatures features ([
      (crates."adler32"."${deps."libflate"."0.1.25"."adler32"}" deps)
      (crates."byteorder"."${deps."libflate"."0.1.25"."byteorder"}" deps)
      (crates."crc32fast"."${deps."libflate"."0.1.25"."crc32fast"}" deps)
      (crates."rle_decode_fast"."${deps."libflate"."0.1.25"."rle_decode_fast"}" deps)
      (crates."take_mut"."${deps."libflate"."0.1.25"."take_mut"}" deps)
    ]);
  };
  features_.libflate."0.1.25" = deps: f: updateFeatures f (rec {
    adler32."${deps.libflate."0.1.25".adler32}".default = true;
    byteorder."${deps.libflate."0.1.25".byteorder}".default = true;
    crc32fast."${deps.libflate."0.1.25".crc32fast}".default = true;
    libflate."0.1.25".default = (f.libflate."0.1.25".default or true);
    rle_decode_fast."${deps.libflate."0.1.25".rle_decode_fast}".default = true;
    take_mut."${deps.libflate."0.1.25".take_mut}".default = true;
  }) [
    (features_.adler32."${deps."libflate"."0.1.25"."adler32"}" deps)
    (features_.byteorder."${deps."libflate"."0.1.25"."byteorder"}" deps)
    (features_.crc32fast."${deps."libflate"."0.1.25"."crc32fast"}" deps)
    (features_.rle_decode_fast."${deps."libflate"."0.1.25"."rle_decode_fast"}" deps)
    (features_.take_mut."${deps."libflate"."0.1.25"."take_mut"}" deps)
  ];


# end
# lock_api-0.1.5

  crates.lock_api."0.1.5" = deps: { features?(features_.lock_api."0.1.5" deps {}) }: buildRustCrate {
    crateName = "lock_api";
    version = "0.1.5";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "132sidr5hvjfkaqm3l95zpcpi8yk5ddd0g79zf1ad4v65sxirqqm";
    dependencies = mapFeatures features ([
      (crates."scopeguard"."${deps."lock_api"."0.1.5"."scopeguard"}" deps)
    ]
      ++ (if features.lock_api."0.1.5".owning_ref or false then [ (crates.owning_ref."${deps."lock_api"."0.1.5".owning_ref}" deps) ] else []));
    features = mkFeatures (features."lock_api"."0.1.5" or {});
  };
  features_.lock_api."0.1.5" = deps: f: updateFeatures f (rec {
    lock_api."0.1.5".default = (f.lock_api."0.1.5".default or true);
    owning_ref."${deps.lock_api."0.1.5".owning_ref}".default = true;
    scopeguard."${deps.lock_api."0.1.5".scopeguard}".default = (f.scopeguard."${deps.lock_api."0.1.5".scopeguard}".default or false);
  }) [
    (features_.owning_ref."${deps."lock_api"."0.1.5"."owning_ref"}" deps)
    (features_.scopeguard."${deps."lock_api"."0.1.5"."scopeguard"}" deps)
  ];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# matches-0.1.8

  crates.matches."0.1.8" = deps: { features?(features_.matches."0.1.8" deps {}) }: buildRustCrate {
    crateName = "matches";
    version = "0.1.8";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "03hl636fg6xggy0a26200xs74amk3k9n0908rga2szn68agyz3cv";
    libPath = "lib.rs";
  };
  features_.matches."0.1.8" = deps: f: updateFeatures f (rec {
    matches."0.1.8".default = (f.matches."0.1.8".default or true);
  }) [];


# end
# memchr-2.2.0

  crates.memchr."2.2.0" = deps: { features?(features_.memchr."2.2.0" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.0";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "11vwg8iig9jyjxq3n1cq15g29ikzw5l7ar87md54k1aisjs0997p";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.0" or {});
  };
  features_.memchr."2.2.0" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.0".default = (f.memchr."2.2.0".default or true); }
      { "2.2.0".use_std =
        (f.memchr."2.2.0".use_std or false) ||
        (f.memchr."2.2.0".default or false) ||
        (memchr."2.2.0"."default" or false); }
    ];
  }) [];


# end
# memoffset-0.2.1

  crates.memoffset."0.2.1" = deps: { features?(features_.memoffset."0.2.1" deps {}) }: buildRustCrate {
    crateName = "memoffset";
    version = "0.2.1";
    authors = [ "Gilad Naaman <gilad.naaman@gmail.com>" ];
    sha256 = "00vym01jk9slibq2nsiilgffp7n6k52a4q3n4dqp0xf5kzxvffcf";
  };
  features_.memoffset."0.2.1" = deps: f: updateFeatures f (rec {
    memoffset."0.2.1".default = (f.memoffset."0.2.1".default or true);
  }) [];


# end
# mime-0.3.13

  crates.mime."0.3.13" = deps: { features?(features_.mime."0.3.13" deps {}) }: buildRustCrate {
    crateName = "mime";
    version = "0.3.13";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "191b240rj0l8hq2bmn74z1c9rqnrfx0dbfxgyq7vnf3jkrbc5v86";
    dependencies = mapFeatures features ([
      (crates."unicase"."${deps."mime"."0.3.13"."unicase"}" deps)
    ]);
  };
  features_.mime."0.3.13" = deps: f: updateFeatures f (rec {
    mime."0.3.13".default = (f.mime."0.3.13".default or true);
    unicase."${deps.mime."0.3.13".unicase}".default = true;
  }) [
    (features_.unicase."${deps."mime"."0.3.13"."unicase"}" deps)
  ];


# end
# mime_guess-2.0.0-alpha.6

  crates.mime_guess."2.0.0-alpha.6" = deps: { features?(features_.mime_guess."2.0.0-alpha.6" deps {}) }: buildRustCrate {
    crateName = "mime_guess";
    version = "2.0.0-alpha.6";
    authors = [ "Austin Bonander <austin.bonander@gmail.com>" ];
    sha256 = "1k2mdq43gi2qr63b7m5zs624rfi40ysk33cay49jlhq97jwnk9db";
    dependencies = mapFeatures features ([
      (crates."mime"."${deps."mime_guess"."2.0.0-alpha.6"."mime"}" deps)
      (crates."phf"."${deps."mime_guess"."2.0.0-alpha.6"."phf"}" deps)
      (crates."unicase"."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."phf_codegen"."${deps."mime_guess"."2.0.0-alpha.6"."phf_codegen"}" deps)
      (crates."unicase"."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    ]);
    features = mkFeatures (features."mime_guess"."2.0.0-alpha.6" or {});
  };
  features_.mime_guess."2.0.0-alpha.6" = deps: f: updateFeatures f (rec {
    mime."${deps.mime_guess."2.0.0-alpha.6".mime}".default = true;
    mime_guess."2.0.0-alpha.6".default = (f.mime_guess."2.0.0-alpha.6".default or true);
    phf = fold recursiveUpdate {} [
      { "${deps.mime_guess."2.0.0-alpha.6".phf}"."unicase" = true; }
      { "${deps.mime_guess."2.0.0-alpha.6".phf}".default = true; }
    ];
    phf_codegen."${deps.mime_guess."2.0.0-alpha.6".phf_codegen}".default = true;
    unicase."${deps.mime_guess."2.0.0-alpha.6".unicase}".default = true;
  }) [
    (features_.mime."${deps."mime_guess"."2.0.0-alpha.6"."mime"}" deps)
    (features_.phf."${deps."mime_guess"."2.0.0-alpha.6"."phf"}" deps)
    (features_.unicase."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
    (features_.phf_codegen."${deps."mime_guess"."2.0.0-alpha.6"."phf_codegen"}" deps)
    (features_.unicase."${deps."mime_guess"."2.0.0-alpha.6"."unicase"}" deps)
  ];


# end
# miniz-sys-0.1.12

  crates.miniz_sys."0.1.12" = deps: { features?(features_.miniz_sys."0.1.12" deps {}) }: buildRustCrate {
    crateName = "miniz-sys";
    version = "0.1.12";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0id77wj1wcrp848hv66p8hazrkxm7jm3gim2m60z22ddsvlxh69q";
    libPath = "lib.rs";
    libName = "miniz_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."miniz_sys"."0.1.12"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."miniz_sys"."0.1.12"."cc"}" deps)
    ]);
  };
  features_.miniz_sys."0.1.12" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_sys."0.1.12".cc}".default = true;
    libc."${deps.miniz_sys."0.1.12".libc}".default = true;
    miniz_sys."0.1.12".default = (f.miniz_sys."0.1.12".default or true);
  }) [
    (features_.libc."${deps."miniz_sys"."0.1.12"."libc"}" deps)
    (features_.cc."${deps."miniz_sys"."0.1.12"."cc"}" deps)
  ];


# end
# miniz_oxide-0.2.2

  crates.miniz_oxide."0.2.2" = deps: { features?(features_.miniz_oxide."0.2.2" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide";
    version = "0.2.2";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "0qk3ybkcdm1aghq734xhi4i2mb56fl6h8rdanqv3mdn7grxwz7fy";
    dependencies = mapFeatures features ([
      (crates."adler32"."${deps."miniz_oxide"."0.2.2"."adler32"}" deps)
    ]);
  };
  features_.miniz_oxide."0.2.2" = deps: f: updateFeatures f (rec {
    adler32."${deps.miniz_oxide."0.2.2".adler32}".default = true;
    miniz_oxide."0.2.2".default = (f.miniz_oxide."0.2.2".default or true);
  }) [
    (features_.adler32."${deps."miniz_oxide"."0.2.2"."adler32"}" deps)
  ];


# end
# miniz_oxide_c_api-0.2.2

  crates.miniz_oxide_c_api."0.2.2" = deps: { features?(features_.miniz_oxide_c_api."0.2.2" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide_c_api";
    version = "0.2.2";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "1fnax7kf28b44c7i02bra04vxgni262nvl593604k33san3jl8dc";
    build = "src/build.rs";
    dependencies = mapFeatures features ([
      (crates."crc32fast"."${deps."miniz_oxide_c_api"."0.2.2"."crc32fast"}" deps)
      (crates."libc"."${deps."miniz_oxide_c_api"."0.2.2"."libc"}" deps)
      (crates."miniz_oxide"."${deps."miniz_oxide_c_api"."0.2.2"."miniz_oxide"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."miniz_oxide_c_api"."0.2.2"."cc"}" deps)
    ]);
    features = mkFeatures (features."miniz_oxide_c_api"."0.2.2" or {});
  };
  features_.miniz_oxide_c_api."0.2.2" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_oxide_c_api."0.2.2".cc}".default = true;
    crc32fast."${deps.miniz_oxide_c_api."0.2.2".crc32fast}".default = true;
    libc."${deps.miniz_oxide_c_api."0.2.2".libc}".default = true;
    miniz_oxide."${deps.miniz_oxide_c_api."0.2.2".miniz_oxide}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "0.2.2".build_orig_miniz =
        (f.miniz_oxide_c_api."0.2.2".build_orig_miniz or false) ||
        (f.miniz_oxide_c_api."0.2.2".benching or false) ||
        (miniz_oxide_c_api."0.2.2"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.2".fuzzing or false) ||
        (miniz_oxide_c_api."0.2.2"."fuzzing" or false); }
      { "0.2.2".build_stub_miniz =
        (f.miniz_oxide_c_api."0.2.2".build_stub_miniz or false) ||
        (f.miniz_oxide_c_api."0.2.2".miniz_zip or false) ||
        (miniz_oxide_c_api."0.2.2"."miniz_zip" or false); }
      { "0.2.2".default = (f.miniz_oxide_c_api."0.2.2".default or true); }
      { "0.2.2".no_c_export =
        (f.miniz_oxide_c_api."0.2.2".no_c_export or false) ||
        (f.miniz_oxide_c_api."0.2.2".benching or false) ||
        (miniz_oxide_c_api."0.2.2"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.2".fuzzing or false) ||
        (miniz_oxide_c_api."0.2.2"."fuzzing" or false); }
    ];
  }) [
    (features_.crc32fast."${deps."miniz_oxide_c_api"."0.2.2"."crc32fast"}" deps)
    (features_.libc."${deps."miniz_oxide_c_api"."0.2.2"."libc"}" deps)
    (features_.miniz_oxide."${deps."miniz_oxide_c_api"."0.2.2"."miniz_oxide"}" deps)
    (features_.cc."${deps."miniz_oxide_c_api"."0.2.2"."cc"}" deps)
  ];


# end
# mio-0.6.19

  crates.mio."0.6.19" = deps: { features?(features_.mio."0.6.19" deps {}) }: buildRustCrate {
    crateName = "mio";
    version = "0.6.19";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0pjazzvqwkb4fgmm4b3m8i05c2gq60lvqqia0faawswgqy7rvgac";
    dependencies = mapFeatures features ([
      (crates."iovec"."${deps."mio"."0.6.19"."iovec"}" deps)
      (crates."log"."${deps."mio"."0.6.19"."log"}" deps)
      (crates."net2"."${deps."mio"."0.6.19"."net2"}" deps)
      (crates."slab"."${deps."mio"."0.6.19"."slab"}" deps)
    ])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_zircon"."${deps."mio"."0.6.19"."fuchsia_zircon"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."mio"."0.6.19"."fuchsia_zircon_sys"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."mio"."0.6.19"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."mio"."0.6.19"."kernel32_sys"}" deps)
      (crates."miow"."${deps."mio"."0.6.19"."miow"}" deps)
      (crates."winapi"."${deps."mio"."0.6.19"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."mio"."0.6.19" or {});
  };
  features_.mio."0.6.19" = deps: f: updateFeatures f (rec {
    fuchsia_zircon."${deps.mio."0.6.19".fuchsia_zircon}".default = true;
    fuchsia_zircon_sys."${deps.mio."0.6.19".fuchsia_zircon_sys}".default = true;
    iovec."${deps.mio."0.6.19".iovec}".default = true;
    kernel32_sys."${deps.mio."0.6.19".kernel32_sys}".default = true;
    libc."${deps.mio."0.6.19".libc}".default = true;
    log."${deps.mio."0.6.19".log}".default = true;
    mio = fold recursiveUpdate {} [
      { "0.6.19".default = (f.mio."0.6.19".default or true); }
      { "0.6.19".with-deprecated =
        (f.mio."0.6.19".with-deprecated or false) ||
        (f.mio."0.6.19".default or false) ||
        (mio."0.6.19"."default" or false); }
    ];
    miow."${deps.mio."0.6.19".miow}".default = true;
    net2."${deps.mio."0.6.19".net2}".default = true;
    slab."${deps.mio."0.6.19".slab}".default = true;
    winapi."${deps.mio."0.6.19".winapi}".default = true;
  }) [
    (features_.iovec."${deps."mio"."0.6.19"."iovec"}" deps)
    (features_.log."${deps."mio"."0.6.19"."log"}" deps)
    (features_.net2."${deps."mio"."0.6.19"."net2"}" deps)
    (features_.slab."${deps."mio"."0.6.19"."slab"}" deps)
    (features_.fuchsia_zircon."${deps."mio"."0.6.19"."fuchsia_zircon"}" deps)
    (features_.fuchsia_zircon_sys."${deps."mio"."0.6.19"."fuchsia_zircon_sys"}" deps)
    (features_.libc."${deps."mio"."0.6.19"."libc"}" deps)
    (features_.kernel32_sys."${deps."mio"."0.6.19"."kernel32_sys"}" deps)
    (features_.miow."${deps."mio"."0.6.19"."miow"}" deps)
    (features_.winapi."${deps."mio"."0.6.19"."winapi"}" deps)
  ];


# end
# miow-0.2.1

  crates.miow."0.2.1" = deps: { features?(features_.miow."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miow";
    version = "0.2.1";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "14f8zkc6ix7mkyis1vsqnim8m29b6l55abkba3p2yz7j1ibcvrl0";
    dependencies = mapFeatures features ([
      (crates."kernel32_sys"."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
      (crates."net2"."${deps."miow"."0.2.1"."net2"}" deps)
      (crates."winapi"."${deps."miow"."0.2.1"."winapi"}" deps)
      (crates."ws2_32_sys"."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
    ]);
  };
  features_.miow."0.2.1" = deps: f: updateFeatures f (rec {
    kernel32_sys."${deps.miow."0.2.1".kernel32_sys}".default = true;
    miow."0.2.1".default = (f.miow."0.2.1".default or true);
    net2."${deps.miow."0.2.1".net2}".default = (f.net2."${deps.miow."0.2.1".net2}".default or false);
    winapi."${deps.miow."0.2.1".winapi}".default = true;
    ws2_32_sys."${deps.miow."0.2.1".ws2_32_sys}".default = true;
  }) [
    (features_.kernel32_sys."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
    (features_.net2."${deps."miow"."0.2.1"."net2"}" deps)
    (features_.winapi."${deps."miow"."0.2.1"."winapi"}" deps)
    (features_.ws2_32_sys."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
  ];


# end
# net2-0.2.33

  crates.net2."0.2.33" = deps: { features?(features_.net2."0.2.33" deps {}) }: buildRustCrate {
    crateName = "net2";
    version = "0.2.33";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1qnmajafgybj5wyxz9iffa8x5wgbwd2znfklmhqj7vl6lw1m65mq";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."net2"."0.2.33"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" || (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."net2"."0.2.33"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."net2"."0.2.33"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."net2"."0.2.33" or {});
  };
  features_.net2."0.2.33" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.net2."0.2.33".cfg_if}".default = true;
    libc."${deps.net2."0.2.33".libc}".default = true;
    net2 = fold recursiveUpdate {} [
      { "0.2.33".default = (f.net2."0.2.33".default or true); }
      { "0.2.33".duration =
        (f.net2."0.2.33".duration or false) ||
        (f.net2."0.2.33".default or false) ||
        (net2."0.2.33"."default" or false); }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.net2."0.2.33".winapi}"."handleapi" = true; }
      { "${deps.net2."0.2.33".winapi}"."winsock2" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2def" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2ipdef" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2tcpip" = true; }
      { "${deps.net2."0.2.33".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."net2"."0.2.33"."cfg_if"}" deps)
    (features_.libc."${deps."net2"."0.2.33"."libc"}" deps)
    (features_.winapi."${deps."net2"."0.2.33"."winapi"}" deps)
  ];


# end
# nodrop-0.1.13

  crates.nodrop."0.1.13" = deps: { features?(features_.nodrop."0.1.13" deps {}) }: buildRustCrate {
    crateName = "nodrop";
    version = "0.1.13";
    authors = [ "bluss" ];
    sha256 = "0gkfx6wihr9z0m8nbdhma5pyvbipznjpkzny2d4zkc05b0vnhinb";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."nodrop"."0.1.13" or {});
  };
  features_.nodrop."0.1.13" = deps: f: updateFeatures f (rec {
    nodrop = fold recursiveUpdate {} [
      { "0.1.13".default = (f.nodrop."0.1.13".default or true); }
      { "0.1.13".nodrop-union =
        (f.nodrop."0.1.13".nodrop-union or false) ||
        (f.nodrop."0.1.13".use_union or false) ||
        (nodrop."0.1.13"."use_union" or false); }
      { "0.1.13".std =
        (f.nodrop."0.1.13".std or false) ||
        (f.nodrop."0.1.13".default or false) ||
        (nodrop."0.1.13"."default" or false); }
    ];
  }) [];


# end
# num-integer-0.1.41

  crates.num_integer."0.1.41" = deps: { features?(features_.num_integer."0.1.41" deps {}) }: buildRustCrate {
    crateName = "num-integer";
    version = "0.1.41";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1y45nh9xlp2dra9svb1wfsy65fysm3k1w4m8jynywccq645yixid";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."num_integer"."0.1.41"."num_traits"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."num_integer"."0.1.41"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."num_integer"."0.1.41" or {});
  };
  features_.num_integer."0.1.41" = deps: f: updateFeatures f (rec {
    autocfg."${deps.num_integer."0.1.41".autocfg}".default = true;
    num_integer = fold recursiveUpdate {} [
      { "0.1.41".default = (f.num_integer."0.1.41".default or true); }
      { "0.1.41".std =
        (f.num_integer."0.1.41".std or false) ||
        (f.num_integer."0.1.41".default or false) ||
        (num_integer."0.1.41"."default" or false); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_integer."0.1.41".num_traits}"."i128" =
        (f.num_traits."${deps.num_integer."0.1.41".num_traits}"."i128" or false) ||
        (num_integer."0.1.41"."i128" or false) ||
        (f."num_integer"."0.1.41"."i128" or false); }
      { "${deps.num_integer."0.1.41".num_traits}"."std" =
        (f.num_traits."${deps.num_integer."0.1.41".num_traits}"."std" or false) ||
        (num_integer."0.1.41"."std" or false) ||
        (f."num_integer"."0.1.41"."std" or false); }
      { "${deps.num_integer."0.1.41".num_traits}".default = (f.num_traits."${deps.num_integer."0.1.41".num_traits}".default or false); }
    ];
  }) [
    (features_.num_traits."${deps."num_integer"."0.1.41"."num_traits"}" deps)
    (features_.autocfg."${deps."num_integer"."0.1.41"."autocfg"}" deps)
  ];


# end
# num-traits-0.2.8

  crates.num_traits."0.2.8" = deps: { features?(features_.num_traits."0.2.8" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.2.8";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1mnlmy35n734n9xlq0qkfbgzz33x09a1s4rfj30p1976p09b862v";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."num_traits"."0.2.8"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."num_traits"."0.2.8" or {});
  };
  features_.num_traits."0.2.8" = deps: f: updateFeatures f (rec {
    autocfg."${deps.num_traits."0.2.8".autocfg}".default = true;
    num_traits = fold recursiveUpdate {} [
      { "0.2.8".default = (f.num_traits."0.2.8".default or true); }
      { "0.2.8".std =
        (f.num_traits."0.2.8".std or false) ||
        (f.num_traits."0.2.8".default or false) ||
        (num_traits."0.2.8"."default" or false); }
    ];
  }) [
    (features_.autocfg."${deps."num_traits"."0.2.8"."autocfg"}" deps)
  ];


# end
# num_cpus-1.10.1

  crates.num_cpus."1.10.1" = deps: { features?(features_.num_cpus."1.10.1" deps {}) }: buildRustCrate {
    crateName = "num_cpus";
    version = "1.10.1";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1zi5s2cbnqqb0k0kdd6gqn2x97f9bssv44430h6w28awwzppyh8i";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."num_cpus"."1.10.1"."libc"}" deps)
    ]);
  };
  features_.num_cpus."1.10.1" = deps: f: updateFeatures f (rec {
    libc."${deps.num_cpus."1.10.1".libc}".default = true;
    num_cpus."1.10.1".default = (f.num_cpus."1.10.1".default or true);
  }) [
    (features_.libc."${deps."num_cpus"."1.10.1"."libc"}" deps)
  ];


# end
# numtoa-0.1.0

  crates.numtoa."0.1.0" = deps: { features?(features_.numtoa."0.1.0" deps {}) }: buildRustCrate {
    crateName = "numtoa";
    version = "0.1.0";
    authors = [ "Michael Aaron Murphy <mmstickman@gmail.com>" ];
    sha256 = "1i2wxr96bb1rvax15z843126z3bnl2frpx69vxsp95r96wr24j08";
    features = mkFeatures (features."numtoa"."0.1.0" or {});
  };
  features_.numtoa."0.1.0" = deps: f: updateFeatures f (rec {
    numtoa."0.1.0".default = (f.numtoa."0.1.0".default or true);
  }) [];


# end
# opaque-debug-0.2.2

  crates.opaque_debug."0.2.2" = deps: { features?(features_.opaque_debug."0.2.2" deps {}) }: buildRustCrate {
    crateName = "opaque-debug";
    version = "0.2.2";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0dkzsnxpg50gz3gjcdzc4j6g4s0jphllg6q7jqmsy9nd9glidy74";
  };
  features_.opaque_debug."0.2.2" = deps: f: updateFeatures f (rec {
    opaque_debug."0.2.2".default = (f.opaque_debug."0.2.2".default or true);
  }) [];


# end
# owning_ref-0.4.0

  crates.owning_ref."0.4.0" = deps: { features?(features_.owning_ref."0.4.0" deps {}) }: buildRustCrate {
    crateName = "owning_ref";
    version = "0.4.0";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1m95qpc3hamkw9wlbfzqkzk7h6skyj40zr6sa3ps151slcfnnchm";
    dependencies = mapFeatures features ([
      (crates."stable_deref_trait"."${deps."owning_ref"."0.4.0"."stable_deref_trait"}" deps)
    ]);
  };
  features_.owning_ref."0.4.0" = deps: f: updateFeatures f (rec {
    owning_ref."0.4.0".default = (f.owning_ref."0.4.0".default or true);
    stable_deref_trait."${deps.owning_ref."0.4.0".stable_deref_trait}".default = true;
  }) [
    (features_.stable_deref_trait."${deps."owning_ref"."0.4.0"."stable_deref_trait"}" deps)
  ];


# end
# parking_lot-0.7.1

  crates.parking_lot."0.7.1" = deps: { features?(features_.parking_lot."0.7.1" deps {}) }: buildRustCrate {
    crateName = "parking_lot";
    version = "0.7.1";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "1qpb49xd176hqqabxdb48f1hvylfbf68rpz8yfrhw0x68ys0lkq1";
    dependencies = mapFeatures features ([
      (crates."lock_api"."${deps."parking_lot"."0.7.1"."lock_api"}" deps)
      (crates."parking_lot_core"."${deps."parking_lot"."0.7.1"."parking_lot_core"}" deps)
    ]);
    features = mkFeatures (features."parking_lot"."0.7.1" or {});
  };
  features_.parking_lot."0.7.1" = deps: f: updateFeatures f (rec {
    lock_api = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.7.1".lock_api}"."nightly" =
        (f.lock_api."${deps.parking_lot."0.7.1".lock_api}"."nightly" or false) ||
        (parking_lot."0.7.1"."nightly" or false) ||
        (f."parking_lot"."0.7.1"."nightly" or false); }
      { "${deps.parking_lot."0.7.1".lock_api}"."owning_ref" =
        (f.lock_api."${deps.parking_lot."0.7.1".lock_api}"."owning_ref" or false) ||
        (parking_lot."0.7.1"."owning_ref" or false) ||
        (f."parking_lot"."0.7.1"."owning_ref" or false); }
      { "${deps.parking_lot."0.7.1".lock_api}".default = true; }
    ];
    parking_lot = fold recursiveUpdate {} [
      { "0.7.1".default = (f.parking_lot."0.7.1".default or true); }
      { "0.7.1".owning_ref =
        (f.parking_lot."0.7.1".owning_ref or false) ||
        (f.parking_lot."0.7.1".default or false) ||
        (parking_lot."0.7.1"."default" or false); }
    ];
    parking_lot_core = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.7.1".parking_lot_core}"."deadlock_detection" =
        (f.parking_lot_core."${deps.parking_lot."0.7.1".parking_lot_core}"."deadlock_detection" or false) ||
        (parking_lot."0.7.1"."deadlock_detection" or false) ||
        (f."parking_lot"."0.7.1"."deadlock_detection" or false); }
      { "${deps.parking_lot."0.7.1".parking_lot_core}"."nightly" =
        (f.parking_lot_core."${deps.parking_lot."0.7.1".parking_lot_core}"."nightly" or false) ||
        (parking_lot."0.7.1"."nightly" or false) ||
        (f."parking_lot"."0.7.1"."nightly" or false); }
      { "${deps.parking_lot."0.7.1".parking_lot_core}".default = true; }
    ];
  }) [
    (features_.lock_api."${deps."parking_lot"."0.7.1"."lock_api"}" deps)
    (features_.parking_lot_core."${deps."parking_lot"."0.7.1"."parking_lot_core"}" deps)
  ];


# end
# parking_lot_core-0.4.0

  crates.parking_lot_core."0.4.0" = deps: { features?(features_.parking_lot_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "parking_lot_core";
    version = "0.4.0";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "1mzk5i240ddvhwnz65hhjk4cq61z235g1n8bd7al4mg6vx437c16";
    dependencies = mapFeatures features ([
      (crates."rand"."${deps."parking_lot_core"."0.4.0"."rand"}" deps)
      (crates."smallvec"."${deps."parking_lot_core"."0.4.0"."smallvec"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."parking_lot_core"."0.4.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."parking_lot_core"."0.4.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."parking_lot_core"."0.4.0"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."parking_lot_core"."0.4.0" or {});
  };
  features_.parking_lot_core."0.4.0" = deps: f: updateFeatures f (rec {
    libc."${deps.parking_lot_core."0.4.0".libc}".default = true;
    parking_lot_core = fold recursiveUpdate {} [
      { "0.4.0".backtrace =
        (f.parking_lot_core."0.4.0".backtrace or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0".default = (f.parking_lot_core."0.4.0".default or true); }
      { "0.4.0".petgraph =
        (f.parking_lot_core."0.4.0".petgraph or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0".thread-id =
        (f.parking_lot_core."0.4.0".thread-id or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
    ];
    rand."${deps.parking_lot_core."0.4.0".rand}".default = true;
    rustc_version."${deps.parking_lot_core."0.4.0".rustc_version}".default = true;
    smallvec."${deps.parking_lot_core."0.4.0".smallvec}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.parking_lot_core."0.4.0".winapi}"."errhandlingapi" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."handleapi" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."minwindef" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."ntstatus" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winbase" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winerror" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winnt" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}".default = true; }
    ];
  }) [
    (features_.rand."${deps."parking_lot_core"."0.4.0"."rand"}" deps)
    (features_.smallvec."${deps."parking_lot_core"."0.4.0"."smallvec"}" deps)
    (features_.rustc_version."${deps."parking_lot_core"."0.4.0"."rustc_version"}" deps)
    (features_.libc."${deps."parking_lot_core"."0.4.0"."libc"}" deps)
    (features_.winapi."${deps."parking_lot_core"."0.4.0"."winapi"}" deps)
  ];


# end
# percent-encoding-1.0.1

  crates.percent_encoding."1.0.1" = deps: { features?(features_.percent_encoding."1.0.1" deps {}) }: buildRustCrate {
    crateName = "percent-encoding";
    version = "1.0.1";
    authors = [ "The rust-url developers" ];
    sha256 = "04ahrp7aw4ip7fmadb0bknybmkfav0kk0gw4ps3ydq5w6hr0ib5i";
    libPath = "lib.rs";
  };
  features_.percent_encoding."1.0.1" = deps: f: updateFeatures f (rec {
    percent_encoding."1.0.1".default = (f.percent_encoding."1.0.1".default or true);
  }) [];


# end
# phf-0.7.24

  crates.phf."0.7.24" = deps: { features?(features_.phf."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "19mmhmafd1dhywc7pzkmd1nq0kjfvg57viny20jqa91hhprf2dv5";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."phf_shared"."${deps."phf"."0.7.24"."phf_shared"}" deps)
    ]);
    features = mkFeatures (features."phf"."0.7.24" or {});
  };
  features_.phf."0.7.24" = deps: f: updateFeatures f (rec {
    phf = fold recursiveUpdate {} [
      { "0.7.24".default = (f.phf."0.7.24".default or true); }
      { "0.7.24".phf_macros =
        (f.phf."0.7.24".phf_macros or false) ||
        (f.phf."0.7.24".macros or false) ||
        (phf."0.7.24"."macros" or false); }
    ];
    phf_shared = fold recursiveUpdate {} [
      { "${deps.phf."0.7.24".phf_shared}"."core" =
        (f.phf_shared."${deps.phf."0.7.24".phf_shared}"."core" or false) ||
        (phf."0.7.24"."core" or false) ||
        (f."phf"."0.7.24"."core" or false); }
      { "${deps.phf."0.7.24".phf_shared}"."unicase" =
        (f.phf_shared."${deps.phf."0.7.24".phf_shared}"."unicase" or false) ||
        (phf."0.7.24"."unicase" or false) ||
        (f."phf"."0.7.24"."unicase" or false); }
      { "${deps.phf."0.7.24".phf_shared}".default = true; }
    ];
  }) [
    (features_.phf_shared."${deps."phf"."0.7.24"."phf_shared"}" deps)
  ];


# end
# phf_codegen-0.7.24

  crates.phf_codegen."0.7.24" = deps: { features?(features_.phf_codegen."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_codegen";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0avkx97r4ph8rv70wwgniarlcfiq27yd74gmnxfdv3rx840cyf8g";
    dependencies = mapFeatures features ([
      (crates."phf_generator"."${deps."phf_codegen"."0.7.24"."phf_generator"}" deps)
      (crates."phf_shared"."${deps."phf_codegen"."0.7.24"."phf_shared"}" deps)
    ]);
  };
  features_.phf_codegen."0.7.24" = deps: f: updateFeatures f (rec {
    phf_codegen."0.7.24".default = (f.phf_codegen."0.7.24".default or true);
    phf_generator."${deps.phf_codegen."0.7.24".phf_generator}".default = true;
    phf_shared."${deps.phf_codegen."0.7.24".phf_shared}".default = true;
  }) [
    (features_.phf_generator."${deps."phf_codegen"."0.7.24"."phf_generator"}" deps)
    (features_.phf_shared."${deps."phf_codegen"."0.7.24"."phf_shared"}" deps)
  ];


# end
# phf_generator-0.7.24

  crates.phf_generator."0.7.24" = deps: { features?(features_.phf_generator."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_generator";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1frn2jfydinifxb1fki0xnnsxf0f1ciaa79jz415r5qhw1ash72j";
    dependencies = mapFeatures features ([
      (crates."phf_shared"."${deps."phf_generator"."0.7.24"."phf_shared"}" deps)
      (crates."rand"."${deps."phf_generator"."0.7.24"."rand"}" deps)
    ]);
  };
  features_.phf_generator."0.7.24" = deps: f: updateFeatures f (rec {
    phf_generator."0.7.24".default = (f.phf_generator."0.7.24".default or true);
    phf_shared."${deps.phf_generator."0.7.24".phf_shared}".default = true;
    rand."${deps.phf_generator."0.7.24".rand}".default = true;
  }) [
    (features_.phf_shared."${deps."phf_generator"."0.7.24"."phf_shared"}" deps)
    (features_.rand."${deps."phf_generator"."0.7.24"."rand"}" deps)
  ];


# end
# phf_shared-0.7.24

  crates.phf_shared."0.7.24" = deps: { features?(features_.phf_shared."0.7.24" deps {}) }: buildRustCrate {
    crateName = "phf_shared";
    version = "0.7.24";
    authors = [ "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1hndqn461jvm2r269ym4qh7fnjc6n8yy53avc2pb43p70vxhm9rl";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."siphasher"."${deps."phf_shared"."0.7.24"."siphasher"}" deps)
    ]
      ++ (if features.phf_shared."0.7.24".unicase or false then [ (crates.unicase."${deps."phf_shared"."0.7.24".unicase}" deps) ] else []));
    features = mkFeatures (features."phf_shared"."0.7.24" or {});
  };
  features_.phf_shared."0.7.24" = deps: f: updateFeatures f (rec {
    phf_shared."0.7.24".default = (f.phf_shared."0.7.24".default or true);
    siphasher."${deps.phf_shared."0.7.24".siphasher}".default = true;
    unicase."${deps.phf_shared."0.7.24".unicase}".default = true;
  }) [
    (features_.siphasher."${deps."phf_shared"."0.7.24"."siphasher"}" deps)
    (features_.unicase."${deps."phf_shared"."0.7.24"."unicase"}" deps)
  ];


# end
# plain-0.2.3

  crates.plain."0.2.3" = deps: { features?(features_.plain."0.2.3" deps {}) }: buildRustCrate {
    crateName = "plain";
    version = "0.2.3";
    authors = [ "jzr" ];
    sha256 = "014acpysmanhp2i7wcy9m6l35qbbjmgcipzvll2xqfn1dv50qrhi";
  };
  features_.plain."0.2.3" = deps: f: updateFeatures f (rec {
    plain."0.2.3".default = (f.plain."0.2.3".default or true);
  }) [];


# end
# platforms-0.2.0

  crates.platforms."0.2.0" = deps: { features?(features_.platforms."0.2.0" deps {}) }: buildRustCrate {
    crateName = "platforms";
    version = "0.2.0";
    authors = [ "Tony Arcieri <bascule@gmail.com>" ];
    edition = "2018";
    sha256 = "1rrpzn6yl70032kvls99q2lgc97zc9hwx0xlaxpn5vi6qqqsbjjn";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."platforms"."0.2.0" or {});
  };
  features_.platforms."0.2.0" = deps: f: updateFeatures f (rec {
    platforms = fold recursiveUpdate {} [
      { "0.2.0".default = (f.platforms."0.2.0".default or true); }
      { "0.2.0".std =
        (f.platforms."0.2.0".std or false) ||
        (f.platforms."0.2.0".default or false) ||
        (platforms."0.2.0"."default" or false); }
    ];
  }) [];


# end
# podio-0.1.6

  crates.podio."0.1.6" = deps: { features?(features_.podio."0.1.6" deps {}) }: buildRustCrate {
    crateName = "podio";
    version = "0.1.6";
    authors = [ "Mathijs van de Nes <git@mathijs.vd-nes.nl>" ];
    sha256 = "1dkhy2cv6wk4nrk0ak2s2w67bqbbxv9ymsxmwrkhz9fs84rx6mz4";
  };
  features_.podio."0.1.6" = deps: f: updateFeatures f (rec {
    podio."0.1.6".default = (f.podio."0.1.6".default or true);
  }) [];


# end
# ppv-lite86-0.2.5

  crates.ppv_lite86."0.2.5" = deps: { features?(features_.ppv_lite86."0.2.5" deps {}) }: buildRustCrate {
    crateName = "ppv-lite86";
    version = "0.2.5";
    authors = [ "The CryptoCorrosion Contributors" ];
    edition = "2018";
    sha256 = "1r3bhih75vhl8v7q0flmywl7hmfg902yf3jjzracsh0jlkldij6r";
    features = mkFeatures (features."ppv_lite86"."0.2.5" or {});
  };
  features_.ppv_lite86."0.2.5" = deps: f: updateFeatures f (rec {
    ppv_lite86 = fold recursiveUpdate {} [
      { "0.2.5".default = (f.ppv_lite86."0.2.5".default or true); }
      { "0.2.5".simd =
        (f.ppv_lite86."0.2.5".simd or false) ||
        (f.ppv_lite86."0.2.5".default or false) ||
        (ppv_lite86."0.2.5"."default" or false); }
      { "0.2.5".std =
        (f.ppv_lite86."0.2.5".std or false) ||
        (f.ppv_lite86."0.2.5".default or false) ||
        (ppv_lite86."0.2.5"."default" or false); }
    ];
  }) [];


# end
# pretty_env_logger-0.3.0

  crates.pretty_env_logger."0.3.0" = deps: { features?(features_.pretty_env_logger."0.3.0" deps {}) }: buildRustCrate {
    crateName = "pretty_env_logger";
    version = "0.3.0";
    authors = [ "Sean McArthur <sean@seanmonstar>" ];
    sha256 = "06xnmmax6kzj393fbah9vcmj836yvpi0czamk3jbss19ghbbmlvc";
    dependencies = mapFeatures features ([
      (crates."chrono"."${deps."pretty_env_logger"."0.3.0"."chrono"}" deps)
      (crates."env_logger"."${deps."pretty_env_logger"."0.3.0"."env_logger"}" deps)
      (crates."log"."${deps."pretty_env_logger"."0.3.0"."log"}" deps)
    ]);
  };
  features_.pretty_env_logger."0.3.0" = deps: f: updateFeatures f (rec {
    chrono."${deps.pretty_env_logger."0.3.0".chrono}".default = true;
    env_logger."${deps.pretty_env_logger."0.3.0".env_logger}".default = true;
    log."${deps.pretty_env_logger."0.3.0".log}".default = true;
    pretty_env_logger."0.3.0".default = (f.pretty_env_logger."0.3.0".default or true);
  }) [
    (features_.chrono."${deps."pretty_env_logger"."0.3.0"."chrono"}" deps)
    (features_.env_logger."${deps."pretty_env_logger"."0.3.0"."env_logger"}" deps)
    (features_.log."${deps."pretty_env_logger"."0.3.0"."log"}" deps)
  ];


# end
# proc-macro2-0.4.30

  crates.proc_macro2."0.4.30" = deps: { features?(features_.proc_macro2."0.4.30" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.30";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0iifv51wrm6r4r2gghw6rray3nv53zcap355bbz1nsmbhj5s09b9";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.30" or {});
  };
  features_.proc_macro2."0.4.30" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.30".default = (f.proc_macro2."0.4.30".default or true); }
      { "0.4.30".proc-macro =
        (f.proc_macro2."0.4.30".proc-macro or false) ||
        (f.proc_macro2."0.4.30".default or false) ||
        (proc_macro2."0.4.30"."default" or false); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.30".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
  ];


# end
# publicsuffix-1.5.2

  crates.publicsuffix."1.5.2" = deps: { features?(features_.publicsuffix."1.5.2" deps {}) }: buildRustCrate {
    crateName = "publicsuffix";
    version = "1.5.2";
    authors = [ "rushmorem <rushmore@webenchanter.com>" ];
    sha256 = "0iind4s270k5fvw0qjsvwndrp2rr6nypz83xy3ljsajidydxjh3r";
    dependencies = mapFeatures features ([
      (crates."error_chain"."${deps."publicsuffix"."1.5.2"."error_chain"}" deps)
      (crates."idna"."${deps."publicsuffix"."1.5.2"."idna"}" deps)
      (crates."lazy_static"."${deps."publicsuffix"."1.5.2"."lazy_static"}" deps)
      (crates."regex"."${deps."publicsuffix"."1.5.2"."regex"}" deps)
      (crates."url"."${deps."publicsuffix"."1.5.2"."url"}" deps)
    ]);
    features = mkFeatures (features."publicsuffix"."1.5.2" or {});
  };
  features_.publicsuffix."1.5.2" = deps: f: updateFeatures f (rec {
    error_chain."${deps.publicsuffix."1.5.2".error_chain}".default = true;
    idna."${deps.publicsuffix."1.5.2".idna}".default = true;
    lazy_static."${deps.publicsuffix."1.5.2".lazy_static}".default = true;
    publicsuffix = fold recursiveUpdate {} [
      { "1.5.2".default = (f.publicsuffix."1.5.2".default or true); }
      { "1.5.2".native-tls =
        (f.publicsuffix."1.5.2".native-tls or false) ||
        (f.publicsuffix."1.5.2".remote_list or false) ||
        (publicsuffix."1.5.2"."remote_list" or false); }
      { "1.5.2".remote_list =
        (f.publicsuffix."1.5.2".remote_list or false) ||
        (f.publicsuffix."1.5.2".default or false) ||
        (publicsuffix."1.5.2"."default" or false); }
    ];
    regex."${deps.publicsuffix."1.5.2".regex}".default = true;
    url."${deps.publicsuffix."1.5.2".url}".default = true;
  }) [
    (features_.error_chain."${deps."publicsuffix"."1.5.2"."error_chain"}" deps)
    (features_.idna."${deps."publicsuffix"."1.5.2"."idna"}" deps)
    (features_.lazy_static."${deps."publicsuffix"."1.5.2"."lazy_static"}" deps)
    (features_.regex."${deps."publicsuffix"."1.5.2"."regex"}" deps)
    (features_.url."${deps."publicsuffix"."1.5.2"."url"}" deps)
  ];


# end
# pyo3-pack-0.7.0-beta.2

  crates.pyo3_pack."0.7.0-beta.2" = deps: { features?(features_.pyo3_pack."0.7.0-beta.2" deps {}) }: buildRustCrate {
    crateName = "pyo3-pack";
    version = "0.7.0-beta.2";
    authors = [ "konstin <konstin@mailbox.org>" ];
    edition = "2018";
    sha256 = "1wjsy6a2flwb58mlwj4j4k53cls2a3fgcmhh656kj0207k58rb5m";
    libName = "pyo3_pack";
    crateBin =
      [{  name = "pyo3-pack"; }];
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."pyo3_pack"."0.7.0-beta.2"."base64"}" deps)
      (crates."cargo_metadata"."${deps."pyo3_pack"."0.7.0-beta.2"."cargo_metadata"}" deps)
      (crates."cbindgen"."${deps."pyo3_pack"."0.7.0-beta.2"."cbindgen"}" deps)
      (crates."digest"."${deps."pyo3_pack"."0.7.0-beta.2"."digest"}" deps)
      (crates."failure"."${deps."pyo3_pack"."0.7.0-beta.2"."failure"}" deps)
      (crates."flate2"."${deps."pyo3_pack"."0.7.0-beta.2"."flate2"}" deps)
      (crates."goblin"."${deps."pyo3_pack"."0.7.0-beta.2"."goblin"}" deps)
      (crates."platforms"."${deps."pyo3_pack"."0.7.0-beta.2"."platforms"}" deps)
      (crates."regex"."${deps."pyo3_pack"."0.7.0-beta.2"."regex"}" deps)
      (crates."serde"."${deps."pyo3_pack"."0.7.0-beta.2"."serde"}" deps)
      (crates."serde_json"."${deps."pyo3_pack"."0.7.0-beta.2"."serde_json"}" deps)
      (crates."sha2"."${deps."pyo3_pack"."0.7.0-beta.2"."sha2"}" deps)
      (crates."shlex"."${deps."pyo3_pack"."0.7.0-beta.2"."shlex"}" deps)
      (crates."structopt"."${deps."pyo3_pack"."0.7.0-beta.2"."structopt"}" deps)
      (crates."tar"."${deps."pyo3_pack"."0.7.0-beta.2"."tar"}" deps)
      (crates."target_info"."${deps."pyo3_pack"."0.7.0-beta.2"."target_info"}" deps)
      (crates."tempfile"."${deps."pyo3_pack"."0.7.0-beta.2"."tempfile"}" deps)
      (crates."toml"."${deps."pyo3_pack"."0.7.0-beta.2"."toml"}" deps)
      (crates."walkdir"."${deps."pyo3_pack"."0.7.0-beta.2"."walkdir"}" deps)
      (crates."zip"."${deps."pyo3_pack"."0.7.0-beta.2"."zip"}" deps)
    ]
      ++ (if features.pyo3_pack."0.7.0-beta.2".pretty_env_logger or false then [ (crates.pretty_env_logger."${deps."pyo3_pack"."0.7.0-beta.2".pretty_env_logger}" deps) ] else [])
      ++ (if features.pyo3_pack."0.7.0-beta.2".reqwest or false then [ (crates.reqwest."${deps."pyo3_pack"."0.7.0-beta.2".reqwest}" deps) ] else [])
      ++ (if features.pyo3_pack."0.7.0-beta.2".rpassword or false then [ (crates.rpassword."${deps."pyo3_pack"."0.7.0-beta.2".rpassword}" deps) ] else []));
    features = mkFeatures (features."pyo3_pack"."0.7.0-beta.2" or {});
  };
  features_.pyo3_pack."0.7.0-beta.2" = deps: f: updateFeatures f (rec {
    base64."${deps.pyo3_pack."0.7.0-beta.2".base64}".default = true;
    cargo_metadata."${deps.pyo3_pack."0.7.0-beta.2".cargo_metadata}".default = true;
    cbindgen."${deps.pyo3_pack."0.7.0-beta.2".cbindgen}".default = true;
    digest = fold recursiveUpdate {} [
      { "${deps.pyo3_pack."0.7.0-beta.2".digest}"."std" = true; }
      { "${deps.pyo3_pack."0.7.0-beta.2".digest}".default = true; }
    ];
    failure."${deps.pyo3_pack."0.7.0-beta.2".failure}".default = true;
    flate2."${deps.pyo3_pack."0.7.0-beta.2".flate2}".default = true;
    goblin."${deps.pyo3_pack."0.7.0-beta.2".goblin}".default = true;
    platforms."${deps.pyo3_pack."0.7.0-beta.2".platforms}".default = true;
    pretty_env_logger."${deps.pyo3_pack."0.7.0-beta.2".pretty_env_logger}".default = true;
    pyo3_pack = fold recursiveUpdate {} [
      { "0.7.0-beta.2".auditwheel =
        (f.pyo3_pack."0.7.0-beta.2".auditwheel or false) ||
        (f.pyo3_pack."0.7.0-beta.2".default or false) ||
        (pyo3_pack."0.7.0-beta.2"."default" or false); }
      { "0.7.0-beta.2".default = (f.pyo3_pack."0.7.0-beta.2".default or true); }
      { "0.7.0-beta.2".keyring =
        (f.pyo3_pack."0.7.0-beta.2".keyring or false) ||
        (f.pyo3_pack."0.7.0-beta.2".password-storage or false) ||
        (pyo3_pack."0.7.0-beta.2"."password-storage" or false); }
      { "0.7.0-beta.2".log =
        (f.pyo3_pack."0.7.0-beta.2".log or false) ||
        (f.pyo3_pack."0.7.0-beta.2".default or false) ||
        (pyo3_pack."0.7.0-beta.2"."default" or false); }
      { "0.7.0-beta.2".pretty_env_logger =
        (f.pyo3_pack."0.7.0-beta.2".pretty_env_logger or false) ||
        (f.pyo3_pack."0.7.0-beta.2".log or false) ||
        (pyo3_pack."0.7.0-beta.2"."log" or false); }
      { "0.7.0-beta.2".reqwest =
        (f.pyo3_pack."0.7.0-beta.2".reqwest or false) ||
        (f.pyo3_pack."0.7.0-beta.2".upload or false) ||
        (pyo3_pack."0.7.0-beta.2"."upload" or false); }
      { "0.7.0-beta.2".rpassword =
        (f.pyo3_pack."0.7.0-beta.2".rpassword or false) ||
        (f.pyo3_pack."0.7.0-beta.2".upload or false) ||
        (pyo3_pack."0.7.0-beta.2"."upload" or false); }
      { "0.7.0-beta.2".rustls =
        (f.pyo3_pack."0.7.0-beta.2".rustls or false) ||
        (f.pyo3_pack."0.7.0-beta.2".default or false) ||
        (pyo3_pack."0.7.0-beta.2"."default" or false); }
      { "0.7.0-beta.2".upload =
        (f.pyo3_pack."0.7.0-beta.2".upload or false) ||
        (f.pyo3_pack."0.7.0-beta.2".default or false) ||
        (pyo3_pack."0.7.0-beta.2"."default" or false) ||
        (f.pyo3_pack."0.7.0-beta.2".password-storage or false) ||
        (pyo3_pack."0.7.0-beta.2"."password-storage" or false); }
    ];
    regex."${deps.pyo3_pack."0.7.0-beta.2".regex}".default = true;
    reqwest = fold recursiveUpdate {} [
      { "${deps.pyo3_pack."0.7.0-beta.2".reqwest}"."rustls-tls" =
        (f.reqwest."${deps.pyo3_pack."0.7.0-beta.2".reqwest}"."rustls-tls" or false) ||
        (pyo3_pack."0.7.0-beta.2"."rustls" or false) ||
        (f."pyo3_pack"."0.7.0-beta.2"."rustls" or false); }
      { "${deps.pyo3_pack."0.7.0-beta.2".reqwest}".default = (f.reqwest."${deps.pyo3_pack."0.7.0-beta.2".reqwest}".default or false); }
    ];
    rpassword."${deps.pyo3_pack."0.7.0-beta.2".rpassword}".default = true;
    serde = fold recursiveUpdate {} [
      { "${deps.pyo3_pack."0.7.0-beta.2".serde}"."derive" = true; }
      { "${deps.pyo3_pack."0.7.0-beta.2".serde}".default = true; }
    ];
    serde_json."${deps.pyo3_pack."0.7.0-beta.2".serde_json}".default = true;
    sha2."${deps.pyo3_pack."0.7.0-beta.2".sha2}".default = true;
    shlex."${deps.pyo3_pack."0.7.0-beta.2".shlex}".default = true;
    structopt."${deps.pyo3_pack."0.7.0-beta.2".structopt}".default = true;
    tar."${deps.pyo3_pack."0.7.0-beta.2".tar}".default = true;
    target_info."${deps.pyo3_pack."0.7.0-beta.2".target_info}".default = true;
    tempfile."${deps.pyo3_pack."0.7.0-beta.2".tempfile}".default = true;
    toml."${deps.pyo3_pack."0.7.0-beta.2".toml}".default = true;
    walkdir."${deps.pyo3_pack."0.7.0-beta.2".walkdir}".default = true;
    zip."${deps.pyo3_pack."0.7.0-beta.2".zip}".default = true;
  }) [
    (features_.base64."${deps."pyo3_pack"."0.7.0-beta.2"."base64"}" deps)
    (features_.cargo_metadata."${deps."pyo3_pack"."0.7.0-beta.2"."cargo_metadata"}" deps)
    (features_.cbindgen."${deps."pyo3_pack"."0.7.0-beta.2"."cbindgen"}" deps)
    (features_.digest."${deps."pyo3_pack"."0.7.0-beta.2"."digest"}" deps)
    (features_.failure."${deps."pyo3_pack"."0.7.0-beta.2"."failure"}" deps)
    (features_.flate2."${deps."pyo3_pack"."0.7.0-beta.2"."flate2"}" deps)
    (features_.goblin."${deps."pyo3_pack"."0.7.0-beta.2"."goblin"}" deps)
    (features_.platforms."${deps."pyo3_pack"."0.7.0-beta.2"."platforms"}" deps)
    (features_.pretty_env_logger."${deps."pyo3_pack"."0.7.0-beta.2"."pretty_env_logger"}" deps)
    (features_.regex."${deps."pyo3_pack"."0.7.0-beta.2"."regex"}" deps)
    (features_.reqwest."${deps."pyo3_pack"."0.7.0-beta.2"."reqwest"}" deps)
    (features_.rpassword."${deps."pyo3_pack"."0.7.0-beta.2"."rpassword"}" deps)
    (features_.serde."${deps."pyo3_pack"."0.7.0-beta.2"."serde"}" deps)
    (features_.serde_json."${deps."pyo3_pack"."0.7.0-beta.2"."serde_json"}" deps)
    (features_.sha2."${deps."pyo3_pack"."0.7.0-beta.2"."sha2"}" deps)
    (features_.shlex."${deps."pyo3_pack"."0.7.0-beta.2"."shlex"}" deps)
    (features_.structopt."${deps."pyo3_pack"."0.7.0-beta.2"."structopt"}" deps)
    (features_.tar."${deps."pyo3_pack"."0.7.0-beta.2"."tar"}" deps)
    (features_.target_info."${deps."pyo3_pack"."0.7.0-beta.2"."target_info"}" deps)
    (features_.tempfile."${deps."pyo3_pack"."0.7.0-beta.2"."tempfile"}" deps)
    (features_.toml."${deps."pyo3_pack"."0.7.0-beta.2"."toml"}" deps)
    (features_.walkdir."${deps."pyo3_pack"."0.7.0-beta.2"."walkdir"}" deps)
    (features_.zip."${deps."pyo3_pack"."0.7.0-beta.2"."zip"}" deps)
  ];


# end
# quick-error-1.2.2

  crates.quick_error."1.2.2" = deps: { features?(features_.quick_error."1.2.2" deps {}) }: buildRustCrate {
    crateName = "quick-error";
    version = "1.2.2";
    authors = [ "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" ];
    sha256 = "192a3adc5phgpibgqblsdx1b421l5yg9bjbmv552qqq9f37h60k5";
  };
  features_.quick_error."1.2.2" = deps: f: updateFeatures f (rec {
    quick_error."1.2.2".default = (f.quick_error."1.2.2".default or true);
  }) [];


# end
# quote-0.6.12

  crates.quote."0.6.12" = deps: { features?(features_.quote."0.6.12" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.12";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1ckd2d2sy0hrwrqcr47dn0n3hyh7ygpc026l8xaycccyg27mihv9";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.12"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.12" or {});
  };
  features_.quote."0.6.12" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.12".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.12"."proc-macro" or false) ||
        (f."quote"."0.6.12"."proc-macro" or false); }
      { "${deps.quote."0.6.12".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.12".default = (f.quote."0.6.12".default or true); }
      { "0.6.12".proc-macro =
        (f.quote."0.6.12".proc-macro or false) ||
        (f.quote."0.6.12".default or false) ||
        (quote."0.6.12"."default" or false); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.12"."proc_macro2"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5".alloc =
        (f.rand."0.6.5".alloc or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
      { "0.6.5".packed_simd =
        (f.rand."0.6.5".packed_simd or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5".rand_os =
        (f.rand."0.6.5".rand_os or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5".simd_support =
        (f.rand."0.6.5".simd_support or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5".std =
        (f.rand."0.6.5".std or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand-0.7.0

  crates.rand."0.7.0" = deps: { features?(features_.rand."0.7.0" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.7.0";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    edition = "2018";
    sha256 = "00nfv8p95nf985sxdfd7j23br77v47sf9hp95qjna1zsz4fyjs8v";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand"."0.7.0"."rand_core"}" deps)
    ])
      ++ (if !(kernel == "emscripten") then mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.7.0"."rand_chacha"}" deps)
    ]) else [])
      ++ (if kernel == "emscripten" then mapFeatures features ([
      (crates."rand_hc"."${deps."rand"."0.7.0"."rand_hc"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.7.0"."libc"}" deps)
    ]) else []);
    features = mkFeatures (features."rand"."0.7.0" or {});
  };
  features_.rand."0.7.0" = deps: f: updateFeatures f (rec {
    libc."${deps.rand."0.7.0".libc}".default = (f.libc."${deps.rand."0.7.0".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.7.0".alloc =
        (f.rand."0.7.0".alloc or false) ||
        (f.rand."0.7.0".std or false) ||
        (rand."0.7.0"."std" or false); }
      { "0.7.0".default = (f.rand."0.7.0".default or true); }
      { "0.7.0".getrandom =
        (f.rand."0.7.0".getrandom or false) ||
        (f.rand."0.7.0".std or false) ||
        (rand."0.7.0"."std" or false); }
      { "0.7.0".getrandom_package =
        (f.rand."0.7.0".getrandom_package or false) ||
        (f.rand."0.7.0".getrandom or false) ||
        (rand."0.7.0"."getrandom" or false); }
      { "0.7.0".packed_simd =
        (f.rand."0.7.0".packed_simd or false) ||
        (f.rand."0.7.0".simd_support or false) ||
        (rand."0.7.0"."simd_support" or false); }
      { "0.7.0".rand_pcg =
        (f.rand."0.7.0".rand_pcg or false) ||
        (f.rand."0.7.0".small_rng or false) ||
        (rand."0.7.0"."small_rng" or false); }
      { "0.7.0".simd_support =
        (f.rand."0.7.0".simd_support or false) ||
        (f.rand."0.7.0".nightly or false) ||
        (rand."0.7.0"."nightly" or false); }
      { "0.7.0".std =
        (f.rand."0.7.0".std or false) ||
        (f.rand."0.7.0".default or false) ||
        (rand."0.7.0"."default" or false); }
    ];
    rand_chacha."${deps.rand."0.7.0".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.7.0".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.7.0".rand_core}"."alloc" or false) ||
        (rand."0.7.0"."alloc" or false) ||
        (f."rand"."0.7.0"."alloc" or false); }
      { "${deps.rand."0.7.0".rand_core}"."getrandom" =
        (f.rand_core."${deps.rand."0.7.0".rand_core}"."getrandom" or false) ||
        (rand."0.7.0"."getrandom" or false) ||
        (f."rand"."0.7.0"."getrandom" or false); }
      { "${deps.rand."0.7.0".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.7.0".rand_core}"."std" or false) ||
        (rand."0.7.0"."std" or false) ||
        (f."rand"."0.7.0"."std" or false); }
      { "${deps.rand."0.7.0".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.7.0".rand_hc}".default = true;
  }) [
    (features_.rand_core."${deps."rand"."0.7.0"."rand_core"}" deps)
    (features_.rand_chacha."${deps."rand"."0.7.0"."rand_chacha"}" deps)
    (features_.rand_hc."${deps."rand"."0.7.0"."rand_hc"}" deps)
    (features_.libc."${deps."rand"."0.7.0"."libc"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_chacha-0.2.0

  crates.rand_chacha."0.2.0" = deps: { features?(features_.rand_chacha."0.2.0" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.2.0";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" "The CryptoCorrosion Contributors" ];
    sha256 = "02mbnky6cz7bacxgxbax438ahsca3wvcjcwnbhp8m2d4gls6fc92";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."c2_chacha"."${deps."rand_chacha"."0.2.0"."c2_chacha"}" deps)
      (crates."rand_core"."${deps."rand_chacha"."0.2.0"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.2.0"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand_chacha"."0.2.0" or {});
  };
  features_.rand_chacha."0.2.0" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.2.0".autocfg}".default = true;
    c2_chacha = fold recursiveUpdate {} [
      { "${deps.rand_chacha."0.2.0".c2_chacha}"."simd" =
        (f.c2_chacha."${deps.rand_chacha."0.2.0".c2_chacha}"."simd" or false) ||
        (rand_chacha."0.2.0"."simd" or false) ||
        (f."rand_chacha"."0.2.0"."simd" or false); }
      { "${deps.rand_chacha."0.2.0".c2_chacha}"."std" =
        (f.c2_chacha."${deps.rand_chacha."0.2.0".c2_chacha}"."std" or false) ||
        (rand_chacha."0.2.0"."std" or false) ||
        (f."rand_chacha"."0.2.0"."std" or false); }
      { "${deps.rand_chacha."0.2.0".c2_chacha}".default = (f.c2_chacha."${deps.rand_chacha."0.2.0".c2_chacha}".default or false); }
    ];
    rand_chacha = fold recursiveUpdate {} [
      { "0.2.0".default = (f.rand_chacha."0.2.0".default or true); }
      { "0.2.0".simd =
        (f.rand_chacha."0.2.0".simd or false) ||
        (f.rand_chacha."0.2.0".default or false) ||
        (rand_chacha."0.2.0"."default" or false); }
      { "0.2.0".std =
        (f.rand_chacha."0.2.0".std or false) ||
        (f.rand_chacha."0.2.0".default or false) ||
        (rand_chacha."0.2.0"."default" or false); }
    ];
    rand_core."${deps.rand_chacha."0.2.0".rand_core}".default = true;
  }) [
    (features_.c2_chacha."${deps."rand_chacha"."0.2.0"."c2_chacha"}" deps)
    (features_.rand_core."${deps."rand_chacha"."0.2.0"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.2.0"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
      { "0.3.1".std =
        (f.rand_core."0.3.1".std or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0".alloc =
        (f.rand_core."0.4.0".alloc or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
      { "0.4.0".serde =
        (f.rand_core."0.4.0".serde or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".serde_derive =
        (f.rand_core."0.4.0".serde_derive or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
    ];
  }) [];


# end
# rand_core-0.5.0

  crates.rand_core."0.5.0" = deps: { features?(features_.rand_core."0.5.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.5.0";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "12xakgqlbi2j0mabap4p908kisw91wjvsp69jphq2mv9hxjqq0gr";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.rand_core."0.5.0".getrandom or false then [ (crates.getrandom."${deps."rand_core"."0.5.0".getrandom}" deps) ] else []));
    features = mkFeatures (features."rand_core"."0.5.0" or {});
  };
  features_.rand_core."0.5.0" = deps: f: updateFeatures f (rec {
    getrandom = fold recursiveUpdate {} [
      { "${deps.rand_core."0.5.0".getrandom}"."std" =
        (f.getrandom."${deps.rand_core."0.5.0".getrandom}"."std" or false) ||
        (rand_core."0.5.0"."std" or false) ||
        (f."rand_core"."0.5.0"."std" or false); }
      { "${deps.rand_core."0.5.0".getrandom}".default = true; }
    ];
    rand_core = fold recursiveUpdate {} [
      { "0.5.0".alloc =
        (f.rand_core."0.5.0".alloc or false) ||
        (f.rand_core."0.5.0".std or false) ||
        (rand_core."0.5.0"."std" or false); }
      { "0.5.0".default = (f.rand_core."0.5.0".default or true); }
      { "0.5.0".getrandom =
        (f.rand_core."0.5.0".getrandom or false) ||
        (f.rand_core."0.5.0".std or false) ||
        (rand_core."0.5.0"."std" or false); }
      { "0.5.0".serde =
        (f.rand_core."0.5.0".serde or false) ||
        (f.rand_core."0.5.0".serde1 or false) ||
        (rand_core."0.5.0"."serde1" or false); }
      { "0.5.0".serde_derive =
        (f.rand_core."0.5.0".serde_derive or false) ||
        (f.rand_core."0.5.0".serde1 or false) ||
        (rand_core."0.5.0"."serde1" or false); }
    ];
  }) [
    (features_.getrandom."${deps."rand_core"."0.5.0"."getrandom"}" deps)
  ];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_hc-0.2.0

  crates.rand_hc."0.2.0" = deps: { features?(features_.rand_hc."0.2.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.2.0";
    authors = [ "The Rand Project Developers" ];
    edition = "2018";
    sha256 = "0592q9kqcna9aiyzy6vp3fadxkkbpfkmi2cnkv48zhybr0v2yf01";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.2.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.2.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.2.0".rand_core}".default = true;
    rand_hc."0.2.0".default = (f.rand_hc."0.2.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.2.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_isaac."0.1.1".serde or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_isaac."0.1.1".serde_derive or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.4

  crates.rand_jitter."0.1.4" = deps: { features?(features_.rand_jitter."0.1.4" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.4";
    authors = [ "The Rand Project Developers" ];
    sha256 = "13nr4h042ab9l7qcv47bxrxw3gkf2pc3cni6c9pyi4nxla0mm7b6";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.4" or {});
  };
  features_.rand_jitter."0.1.4" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.4".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.4".rand_core}"."std" or false) ||
        (rand_jitter."0.1.4"."std" or false) ||
        (f."rand_jitter"."0.1.4"."std" or false); }
      { "${deps.rand_jitter."0.1.4".rand_core}".default = true; }
    ];
    rand_jitter."0.1.4".default = (f.rand_jitter."0.1.4".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.4".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
  ];


# end
# rand_os-0.1.3

  crates.rand_os."0.1.3" = deps: { features?(features_.rand_os."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.3";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0ywwspizgs9g8vzn6m5ix9yg36n15119d6n792h7mk4r5vs0ww4j";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.3"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.3" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.3".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.3".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.3".rand_core}".default = true; }
    ];
    rand_os."0.1.3".default = (f.rand_os."0.1.3".default or true);
    rdrand."${deps.rand_os."0.1.3".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.2

  crates.rand_pcg."0.1.2" = deps: { features?(features_.rand_pcg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.2";
    authors = [ "The Rand Project Developers" ];
    sha256 = "04qgi2ai2z42li5h4aawvxbpnlqyjfnipz9d6k73mdnl6p1xq938";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.2" or {});
  };
  features_.rand_pcg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_pcg."0.1.2".autocfg}".default = true;
    rand_core."${deps.rand_pcg."0.1.2".rand_core}".default = true;
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.2".default = (f.rand_pcg."0.1.2".default or true); }
      { "0.1.2".serde =
        (f.rand_pcg."0.1.2".serde or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2".serde_derive =
        (f.rand_pcg."0.1.2".serde_derive or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_xorshift."0.1.1".serde or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_xorshift."0.1.1".serde_derive or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
      { "0.4.0".std =
        (f.rdrand."0.4.0".std or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# redox_syscall-0.1.56

  crates.redox_syscall."0.1.56" = deps: { features?(features_.redox_syscall."0.1.56" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.56";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "0jcp8nd947zcy938bz09pzlmi3vyxfdzg92pjxdvvk0699vwcc26";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.56" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.56".default = (f.redox_syscall."0.1.56".default or true);
  }) [];


# end
# redox_termios-0.1.1

  crates.redox_termios."0.1.1" = deps: { features?(features_.redox_termios."0.1.1" deps {}) }: buildRustCrate {
    crateName = "redox_termios";
    version = "0.1.1";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "04s6yyzjca552hdaqlvqhp3vw0zqbc304md5czyd3axh56iry8wh";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."redox_syscall"."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
    ]);
  };
  features_.redox_termios."0.1.1" = deps: f: updateFeatures f (rec {
    redox_syscall."${deps.redox_termios."0.1.1".redox_syscall}".default = true;
    redox_termios."0.1.1".default = (f.redox_termios."0.1.1".default or true);
  }) [
    (features_.redox_syscall."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
  ];


# end
# regex-1.1.8

  crates.regex."1.1.8" = deps: { features?(features_.regex."1.1.8" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.8";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1819yiz118bwn5akcpb1hipdxk0sh4gn46qqvwdgsc03pd0lhig9";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.8"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.8"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.8"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.8"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.8"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.8" or {});
  };
  features_.regex."1.1.8" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.8".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.8".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.8".default = (f.regex."1.1.8".default or true); }
      { "1.1.8".pattern =
        (f.regex."1.1.8".pattern or false) ||
        (f.regex."1.1.8".unstable or false) ||
        (regex."1.1.8"."unstable" or false); }
      { "1.1.8".use_std =
        (f.regex."1.1.8".use_std or false) ||
        (f.regex."1.1.8".default or false) ||
        (regex."1.1.8"."default" or false); }
    ];
    regex_syntax."${deps.regex."1.1.8".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.8".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.8".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.8"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.8"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.8"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.8"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.8"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.6.7

  crates.regex_syntax."0.6.7" = deps: { features?(features_.regex_syntax."0.6.7" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.7";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1vv0d9p9djkz0kfg1ajd1p3j3dsiq78nnqsvl3ivygasj3llqb9x";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.7"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.7" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.7".default = (f.regex_syntax."0.6.7".default or true);
    ucd_util."${deps.regex_syntax."0.6.7".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.7"."ucd_util"}" deps)
  ];


# end
# remove_dir_all-0.5.2

  crates.remove_dir_all."0.5.2" = deps: { features?(features_.remove_dir_all."0.5.2" deps {}) }: buildRustCrate {
    crateName = "remove_dir_all";
    version = "0.5.2";
    authors = [ "Aaronepower <theaaronepower@gmail.com>" ];
    sha256 = "04sxg2ppvxiljc2i13bwvpbi540rf9d2a89cq0wmqf9pjvr3a1wm";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."remove_dir_all"."0.5.2"."winapi"}" deps)
    ]) else []);
  };
  features_.remove_dir_all."0.5.2" = deps: f: updateFeatures f (rec {
    remove_dir_all."0.5.2".default = (f.remove_dir_all."0.5.2".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.remove_dir_all."0.5.2".winapi}"."errhandlingapi" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."fileapi" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."std" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."winbase" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."winerror" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."remove_dir_all"."0.5.2"."winapi"}" deps)
  ];


# end
# reqwest-0.9.18

  crates.reqwest."0.9.18" = deps: { features?(features_.reqwest."0.9.18" deps {}) }: buildRustCrate {
    crateName = "reqwest";
    version = "0.9.18";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1hkpzy309cl96ydph9aanq7kmy182s1l8h8hsvfzwpis8l2714m0";
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."reqwest"."0.9.18"."base64"}" deps)
      (crates."bytes"."${deps."reqwest"."0.9.18"."bytes"}" deps)
      (crates."cookie"."${deps."reqwest"."0.9.18"."cookie"}" deps)
      (crates."cookie_store"."${deps."reqwest"."0.9.18"."cookie_store"}" deps)
      (crates."encoding_rs"."${deps."reqwest"."0.9.18"."encoding_rs"}" deps)
      (crates."flate2"."${deps."reqwest"."0.9.18"."flate2"}" deps)
      (crates."futures"."${deps."reqwest"."0.9.18"."futures"}" deps)
      (crates."http"."${deps."reqwest"."0.9.18"."http"}" deps)
      (crates."hyper"."${deps."reqwest"."0.9.18"."hyper"}" deps)
      (crates."log"."${deps."reqwest"."0.9.18"."log"}" deps)
      (crates."mime"."${deps."reqwest"."0.9.18"."mime"}" deps)
      (crates."mime_guess"."${deps."reqwest"."0.9.18"."mime_guess"}" deps)
      (crates."serde"."${deps."reqwest"."0.9.18"."serde"}" deps)
      (crates."serde_json"."${deps."reqwest"."0.9.18"."serde_json"}" deps)
      (crates."serde_urlencoded"."${deps."reqwest"."0.9.18"."serde_urlencoded"}" deps)
      (crates."time"."${deps."reqwest"."0.9.18"."time"}" deps)
      (crates."tokio"."${deps."reqwest"."0.9.18"."tokio"}" deps)
      (crates."tokio_executor"."${deps."reqwest"."0.9.18"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."reqwest"."0.9.18"."tokio_io"}" deps)
      (crates."tokio_threadpool"."${deps."reqwest"."0.9.18"."tokio_threadpool"}" deps)
      (crates."tokio_timer"."${deps."reqwest"."0.9.18"."tokio_timer"}" deps)
      (crates."url"."${deps."reqwest"."0.9.18"."url"}" deps)
      (crates."uuid"."${deps."reqwest"."0.9.18"."uuid"}" deps)
    ]
      ++ (if features.reqwest."0.9.18".hyper-rustls or false then [ (crates.hyper_rustls."${deps."reqwest"."0.9.18".hyper_rustls}" deps) ] else [])
      ++ (if features.reqwest."0.9.18".rustls or false then [ (crates.rustls."${deps."reqwest"."0.9.18".rustls}" deps) ] else [])
      ++ (if features.reqwest."0.9.18".tokio-rustls or false then [ (crates.tokio_rustls."${deps."reqwest"."0.9.18".tokio_rustls}" deps) ] else [])
      ++ (if features.reqwest."0.9.18".webpki-roots or false then [ (crates.webpki_roots."${deps."reqwest"."0.9.18".webpki_roots}" deps) ] else []));
    features = mkFeatures (features."reqwest"."0.9.18" or {});
  };
  features_.reqwest."0.9.18" = deps: f: updateFeatures f (rec {
    base64."${deps.reqwest."0.9.18".base64}".default = true;
    bytes."${deps.reqwest."0.9.18".bytes}".default = true;
    cookie."${deps.reqwest."0.9.18".cookie}".default = true;
    cookie_store."${deps.reqwest."0.9.18".cookie_store}".default = true;
    encoding_rs."${deps.reqwest."0.9.18".encoding_rs}".default = true;
    flate2 = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.18".flate2}"."rust_backend" = true; }
      { "${deps.reqwest."0.9.18".flate2}".default = (f.flate2."${deps.reqwest."0.9.18".flate2}".default or false); }
    ];
    futures."${deps.reqwest."0.9.18".futures}".default = true;
    http."${deps.reqwest."0.9.18".http}".default = true;
    hyper."${deps.reqwest."0.9.18".hyper}".default = true;
    hyper_rustls."${deps.reqwest."0.9.18".hyper_rustls}".default = true;
    log."${deps.reqwest."0.9.18".log}".default = true;
    mime."${deps.reqwest."0.9.18".mime}".default = true;
    mime_guess."${deps.reqwest."0.9.18".mime_guess}".default = true;
    reqwest = fold recursiveUpdate {} [
      { "0.9.18".default = (f.reqwest."0.9.18".default or true); }
      { "0.9.18".default-tls =
        (f.reqwest."0.9.18".default-tls or false) ||
        (f.reqwest."0.9.18".default or false) ||
        (reqwest."0.9.18"."default" or false) ||
        (f.reqwest."0.9.18".default-tls-vendored or false) ||
        (reqwest."0.9.18"."default-tls-vendored" or false); }
      { "0.9.18".hyper-old-types =
        (f.reqwest."0.9.18".hyper-old-types or false) ||
        (f.reqwest."0.9.18".hyper-011 or false) ||
        (reqwest."0.9.18"."hyper-011" or false); }
      { "0.9.18".hyper-rustls =
        (f.reqwest."0.9.18".hyper-rustls or false) ||
        (f.reqwest."0.9.18".rustls-tls or false) ||
        (reqwest."0.9.18"."rustls-tls" or false); }
      { "0.9.18".hyper-tls =
        (f.reqwest."0.9.18".hyper-tls or false) ||
        (f.reqwest."0.9.18".default-tls or false) ||
        (reqwest."0.9.18"."default-tls" or false); }
      { "0.9.18".native-tls =
        (f.reqwest."0.9.18".native-tls or false) ||
        (f.reqwest."0.9.18".default-tls or false) ||
        (reqwest."0.9.18"."default-tls" or false); }
      { "0.9.18".rustls =
        (f.reqwest."0.9.18".rustls or false) ||
        (f.reqwest."0.9.18".rustls-tls or false) ||
        (reqwest."0.9.18"."rustls-tls" or false); }
      { "0.9.18".tls =
        (f.reqwest."0.9.18".tls or false) ||
        (f.reqwest."0.9.18".default-tls or false) ||
        (reqwest."0.9.18"."default-tls" or false) ||
        (f.reqwest."0.9.18".rustls-tls or false) ||
        (reqwest."0.9.18"."rustls-tls" or false); }
      { "0.9.18".tokio-rustls =
        (f.reqwest."0.9.18".tokio-rustls or false) ||
        (f.reqwest."0.9.18".rustls-tls or false) ||
        (reqwest."0.9.18"."rustls-tls" or false); }
      { "0.9.18".trust-dns-resolver =
        (f.reqwest."0.9.18".trust-dns-resolver or false) ||
        (f.reqwest."0.9.18".trust-dns or false) ||
        (reqwest."0.9.18"."trust-dns" or false); }
      { "0.9.18".webpki-roots =
        (f.reqwest."0.9.18".webpki-roots or false) ||
        (f.reqwest."0.9.18".rustls-tls or false) ||
        (reqwest."0.9.18"."rustls-tls" or false); }
    ];
    rustls = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.18".rustls}"."dangerous_configuration" = true; }
      { "${deps.reqwest."0.9.18".rustls}".default = true; }
    ];
    serde."${deps.reqwest."0.9.18".serde}".default = true;
    serde_json."${deps.reqwest."0.9.18".serde_json}".default = true;
    serde_urlencoded."${deps.reqwest."0.9.18".serde_urlencoded}".default = true;
    time."${deps.reqwest."0.9.18".time}".default = true;
    tokio = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.18".tokio}"."rt-full" = true; }
      { "${deps.reqwest."0.9.18".tokio}"."tcp" = true; }
      { "${deps.reqwest."0.9.18".tokio}".default = (f.tokio."${deps.reqwest."0.9.18".tokio}".default or false); }
    ];
    tokio_executor."${deps.reqwest."0.9.18".tokio_executor}".default = true;
    tokio_io."${deps.reqwest."0.9.18".tokio_io}".default = true;
    tokio_rustls."${deps.reqwest."0.9.18".tokio_rustls}".default = true;
    tokio_threadpool."${deps.reqwest."0.9.18".tokio_threadpool}".default = true;
    tokio_timer."${deps.reqwest."0.9.18".tokio_timer}".default = true;
    url."${deps.reqwest."0.9.18".url}".default = true;
    uuid = fold recursiveUpdate {} [
      { "${deps.reqwest."0.9.18".uuid}"."v4" = true; }
      { "${deps.reqwest."0.9.18".uuid}".default = true; }
    ];
    webpki_roots."${deps.reqwest."0.9.18".webpki_roots}".default = true;
  }) [
    (features_.base64."${deps."reqwest"."0.9.18"."base64"}" deps)
    (features_.bytes."${deps."reqwest"."0.9.18"."bytes"}" deps)
    (features_.cookie."${deps."reqwest"."0.9.18"."cookie"}" deps)
    (features_.cookie_store."${deps."reqwest"."0.9.18"."cookie_store"}" deps)
    (features_.encoding_rs."${deps."reqwest"."0.9.18"."encoding_rs"}" deps)
    (features_.flate2."${deps."reqwest"."0.9.18"."flate2"}" deps)
    (features_.futures."${deps."reqwest"."0.9.18"."futures"}" deps)
    (features_.http."${deps."reqwest"."0.9.18"."http"}" deps)
    (features_.hyper."${deps."reqwest"."0.9.18"."hyper"}" deps)
    (features_.hyper_rustls."${deps."reqwest"."0.9.18"."hyper_rustls"}" deps)
    (features_.log."${deps."reqwest"."0.9.18"."log"}" deps)
    (features_.mime."${deps."reqwest"."0.9.18"."mime"}" deps)
    (features_.mime_guess."${deps."reqwest"."0.9.18"."mime_guess"}" deps)
    (features_.rustls."${deps."reqwest"."0.9.18"."rustls"}" deps)
    (features_.serde."${deps."reqwest"."0.9.18"."serde"}" deps)
    (features_.serde_json."${deps."reqwest"."0.9.18"."serde_json"}" deps)
    (features_.serde_urlencoded."${deps."reqwest"."0.9.18"."serde_urlencoded"}" deps)
    (features_.time."${deps."reqwest"."0.9.18"."time"}" deps)
    (features_.tokio."${deps."reqwest"."0.9.18"."tokio"}" deps)
    (features_.tokio_executor."${deps."reqwest"."0.9.18"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."reqwest"."0.9.18"."tokio_io"}" deps)
    (features_.tokio_rustls."${deps."reqwest"."0.9.18"."tokio_rustls"}" deps)
    (features_.tokio_threadpool."${deps."reqwest"."0.9.18"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."reqwest"."0.9.18"."tokio_timer"}" deps)
    (features_.url."${deps."reqwest"."0.9.18"."url"}" deps)
    (features_.uuid."${deps."reqwest"."0.9.18"."uuid"}" deps)
    (features_.webpki_roots."${deps."reqwest"."0.9.18"."webpki_roots"}" deps)
  ];


# end
# ring-0.14.6

  crates.ring."0.14.6" = deps: { features?(features_.ring."0.14.6" deps {}) }: buildRustCrate {
    crateName = "ring";
    version = "0.14.6";
    authors = [ "Brian Smith <brian@briansmith.org>" ];
    edition = "2018";
    sha256 = "1x0xpr9bsqmxclqp9ai1a6xv58pihgpi6ri00gkfgj5cwnq1injp";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."ring"."0.14.6"."libc"}" deps)
      (crates."untrusted"."${deps."ring"."0.14.6"."untrusted"}" deps)
    ])
      ++ (if kernel == "android" || kernel == "linux" then mapFeatures features ([
]) else [])
      ++ (if kernel == "redox" || (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin" || kernel == "ios") then mapFeatures features ([
      (crates."lazy_static"."${deps."ring"."0.14.6"."lazy_static"}" deps)
    ]) else [])
      ++ (if !(kernel == "ios") then mapFeatures features ([
      (crates."spin"."${deps."ring"."0.14.6"."spin"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."ring"."0.14.6"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."ring"."0.14.6"."cc"}" deps)
    ]);
    features = mkFeatures (features."ring"."0.14.6" or {});
  };
  features_.ring."0.14.6" = deps: f: updateFeatures f (rec {
    cc."${deps.ring."0.14.6".cc}".default = true;
    lazy_static."${deps.ring."0.14.6".lazy_static}".default = true;
    libc."${deps.ring."0.14.6".libc}".default = true;
    ring = fold recursiveUpdate {} [
      { "0.14.6".default = (f.ring."0.14.6".default or true); }
      { "0.14.6".dev_urandom_fallback =
        (f.ring."0.14.6".dev_urandom_fallback or false) ||
        (f.ring."0.14.6".default or false) ||
        (ring."0.14.6"."default" or false); }
      { "0.14.6".use_heap =
        (f.ring."0.14.6".use_heap or false) ||
        (f.ring."0.14.6".default or false) ||
        (ring."0.14.6"."default" or false); }
    ];
    spin."${deps.ring."0.14.6".spin}".default = true;
    untrusted."${deps.ring."0.14.6".untrusted}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.ring."0.14.6".winapi}"."ntsecapi" = true; }
      { "${deps.ring."0.14.6".winapi}"."wtypesbase" = true; }
      { "${deps.ring."0.14.6".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."ring"."0.14.6"."libc"}" deps)
    (features_.untrusted."${deps."ring"."0.14.6"."untrusted"}" deps)
    (features_.cc."${deps."ring"."0.14.6"."cc"}" deps)
    (features_.lazy_static."${deps."ring"."0.14.6"."lazy_static"}" deps)
    (features_.spin."${deps."ring"."0.14.6"."spin"}" deps)
    (features_.winapi."${deps."ring"."0.14.6"."winapi"}" deps)
  ];


# end
# rle-decode-fast-1.0.1

  crates.rle_decode_fast."1.0.1" = deps: { features?(features_.rle_decode_fast."1.0.1" deps {}) }: buildRustCrate {
    crateName = "rle-decode-fast";
    version = "1.0.1";
    authors = [ "Moritz Wanzenböck <moritz@wanzenbug.xyz>" ];
    edition = "2015";
    sha256 = "1lq981ayfqszsh4q7sl4qjjnpj7h3p5hv06shnscrggh6l6ynhjp";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rle_decode_fast"."1.0.1" or {});
  };
  features_.rle_decode_fast."1.0.1" = deps: f: updateFeatures f (rec {
    rle_decode_fast = fold recursiveUpdate {} [
      { "1.0.1".criterion =
        (f.rle_decode_fast."1.0.1".criterion or false) ||
        (f.rle_decode_fast."1.0.1".bench or false) ||
        (rle_decode_fast."1.0.1"."bench" or false); }
      { "1.0.1".default = (f.rle_decode_fast."1.0.1".default or true); }
    ];
  }) [];


# end
# rpassword-3.0.2

  crates.rpassword."3.0.2" = deps: { features?(features_.rpassword."3.0.2" deps {}) }: buildRustCrate {
    crateName = "rpassword";
    version = "3.0.2";
    authors = [ "Conrad Kleinespel <conradk@conradk.com>" ];
    sha256 = "1rn344l45cpzz6d0wllf0n90jfd6c24kyhvv3d5bfwb3skr03f0b";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rpassword"."3.0.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."rpassword"."3.0.2"."kernel32_sys"}" deps)
      (crates."winapi"."${deps."rpassword"."3.0.2"."winapi"}" deps)
    ]) else []);
  };
  features_.rpassword."3.0.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."${deps.rpassword."3.0.2".kernel32_sys}".default = true;
    libc."${deps.rpassword."3.0.2".libc}".default = true;
    rpassword."3.0.2".default = (f.rpassword."3.0.2".default or true);
    winapi."${deps.rpassword."3.0.2".winapi}".default = true;
  }) [
    (features_.libc."${deps."rpassword"."3.0.2"."libc"}" deps)
    (features_.kernel32_sys."${deps."rpassword"."3.0.2"."kernel32_sys"}" deps)
    (features_.winapi."${deps."rpassword"."3.0.2"."winapi"}" deps)
  ];


# end
# rustc-demangle-0.1.15

  crates.rustc_demangle."0.1.15" = deps: { features?(features_.rustc_demangle."0.1.15" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.15";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "04rgsfzhz4k9s56vkczsdbvmvg9409xp0nw4cy99lb2i0aa0255s";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rustc_demangle"."0.1.15" or {});
  };
  features_.rustc_demangle."0.1.15" = deps: f: updateFeatures f (rec {
    rustc_demangle = fold recursiveUpdate {} [
      { "0.1.15".compiler_builtins =
        (f.rustc_demangle."0.1.15".compiler_builtins or false) ||
        (f.rustc_demangle."0.1.15".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15".core =
        (f.rustc_demangle."0.1.15".core or false) ||
        (f.rustc_demangle."0.1.15".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15".default = (f.rustc_demangle."0.1.15".default or true); }
    ];
  }) [];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_.rustc_version."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.2.3"."semver"}" deps)
  ];


# end
# rustls-0.15.2

  crates.rustls."0.15.2" = deps: { features?(features_.rustls."0.15.2" deps {}) }: buildRustCrate {
    crateName = "rustls";
    version = "0.15.2";
    authors = [ "Joseph Birr-Pixton <jpixton@gmail.com>" ];
    edition = "2018";
    sha256 = "1qgq0vbnh5mfr0w403g7bbdsyjc7gsf2jcpzgsjnq8581jdj3vv6";
    dependencies = mapFeatures features ([
      (crates."base64"."${deps."rustls"."0.15.2"."base64"}" deps)
      (crates."ring"."${deps."rustls"."0.15.2"."ring"}" deps)
      (crates."sct"."${deps."rustls"."0.15.2"."sct"}" deps)
      (crates."untrusted"."${deps."rustls"."0.15.2"."untrusted"}" deps)
      (crates."webpki"."${deps."rustls"."0.15.2"."webpki"}" deps)
    ]
      ++ (if features.rustls."0.15.2".log or false then [ (crates.log."${deps."rustls"."0.15.2".log}" deps) ] else []));
    features = mkFeatures (features."rustls"."0.15.2" or {});
  };
  features_.rustls."0.15.2" = deps: f: updateFeatures f (rec {
    base64."${deps.rustls."0.15.2".base64}".default = true;
    log."${deps.rustls."0.15.2".log}".default = true;
    ring."${deps.rustls."0.15.2".ring}".default = true;
    rustls = fold recursiveUpdate {} [
      { "0.15.2".default = (f.rustls."0.15.2".default or true); }
      { "0.15.2".log =
        (f.rustls."0.15.2".log or false) ||
        (f.rustls."0.15.2".logging or false) ||
        (rustls."0.15.2"."logging" or false); }
      { "0.15.2".logging =
        (f.rustls."0.15.2".logging or false) ||
        (f.rustls."0.15.2".default or false) ||
        (rustls."0.15.2"."default" or false); }
    ];
    sct."${deps.rustls."0.15.2".sct}".default = true;
    untrusted."${deps.rustls."0.15.2".untrusted}".default = true;
    webpki."${deps.rustls."0.15.2".webpki}".default = true;
  }) [
    (features_.base64."${deps."rustls"."0.15.2"."base64"}" deps)
    (features_.log."${deps."rustls"."0.15.2"."log"}" deps)
    (features_.ring."${deps."rustls"."0.15.2"."ring"}" deps)
    (features_.sct."${deps."rustls"."0.15.2"."sct"}" deps)
    (features_.untrusted."${deps."rustls"."0.15.2"."untrusted"}" deps)
    (features_.webpki."${deps."rustls"."0.15.2"."webpki"}" deps)
  ];


# end
# ryu-1.0.0

  crates.ryu."1.0.0" = deps: { features?(features_.ryu."1.0.0" deps {}) }: buildRustCrate {
    crateName = "ryu";
    version = "1.0.0";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0hysqba7hi31xw1jka8jh7qb4m9fx5l6vik55wpc3rpsg46cwgbf";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ryu"."1.0.0" or {});
  };
  features_.ryu."1.0.0" = deps: f: updateFeatures f (rec {
    ryu."1.0.0".default = (f.ryu."1.0.0".default or true);
  }) [];


# end
# same-file-1.0.4

  crates.same_file."1.0.4" = deps: { features?(features_.same_file."1.0.4" deps {}) }: buildRustCrate {
    crateName = "same-file";
    version = "1.0.4";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1zs244ssl381cqlnh2g42g3i60qip4z72i26z44d6kas3y3gy77q";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi_util"."${deps."same_file"."1.0.4"."winapi_util"}" deps)
    ]) else []);
  };
  features_.same_file."1.0.4" = deps: f: updateFeatures f (rec {
    same_file."1.0.4".default = (f.same_file."1.0.4".default or true);
    winapi_util."${deps.same_file."1.0.4".winapi_util}".default = true;
  }) [
    (features_.winapi_util."${deps."same_file"."1.0.4"."winapi_util"}" deps)
  ];


# end
# scopeguard-0.3.3

  crates.scopeguard."0.3.3" = deps: { features?(features_.scopeguard."0.3.3" deps {}) }: buildRustCrate {
    crateName = "scopeguard";
    version = "0.3.3";
    authors = [ "bluss" ];
    sha256 = "0i1l013csrqzfz6c68pr5pi01hg5v5yahq8fsdmaxy6p8ygsjf3r";
    features = mkFeatures (features."scopeguard"."0.3.3" or {});
  };
  features_.scopeguard."0.3.3" = deps: f: updateFeatures f (rec {
    scopeguard = fold recursiveUpdate {} [
      { "0.3.3".default = (f.scopeguard."0.3.3".default or true); }
      { "0.3.3".use_std =
        (f.scopeguard."0.3.3".use_std or false) ||
        (f.scopeguard."0.3.3".default or false) ||
        (scopeguard."0.3.3"."default" or false); }
    ];
  }) [];


# end
# scroll-0.9.2

  crates.scroll."0.9.2" = deps: { features?(features_.scroll."0.9.2" deps {}) }: buildRustCrate {
    crateName = "scroll";
    version = "0.9.2";
    authors = [ "m4b <m4b.github.io@gmail.com>" "Ted Mielczarek <ted@mielczarek.org>" ];
    sha256 = "0qfwzffs7vq749l83liyxh4437p46as02mx04l33y9fdaypv8aq0";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.scroll."0.9.2".scroll_derive or false then [ (crates.scroll_derive."${deps."scroll"."0.9.2".scroll_derive}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."scroll"."0.9.2"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."scroll"."0.9.2" or {});
  };
  features_.scroll."0.9.2" = deps: f: updateFeatures f (rec {
    rustc_version."${deps.scroll."0.9.2".rustc_version}".default = true;
    scroll = fold recursiveUpdate {} [
      { "0.9.2".default = (f.scroll."0.9.2".default or true); }
      { "0.9.2".scroll_derive =
        (f.scroll."0.9.2".scroll_derive or false) ||
        (f.scroll."0.9.2".derive or false) ||
        (scroll."0.9.2"."derive" or false); }
      { "0.9.2".std =
        (f.scroll."0.9.2".std or false) ||
        (f.scroll."0.9.2".default or false) ||
        (scroll."0.9.2"."default" or false); }
    ];
    scroll_derive."${deps.scroll."0.9.2".scroll_derive}".default = true;
  }) [
    (features_.scroll_derive."${deps."scroll"."0.9.2"."scroll_derive"}" deps)
    (features_.rustc_version."${deps."scroll"."0.9.2"."rustc_version"}" deps)
  ];


# end
# scroll_derive-0.9.5

  crates.scroll_derive."0.9.5" = deps: { features?(features_.scroll_derive."0.9.5" deps {}) }: buildRustCrate {
    crateName = "scroll_derive";
    version = "0.9.5";
    authors = [ "m4b <m4b.github.io@gmail.com>" "Ted Mielczarek <ted@mielczarek.org>" ];
    sha256 = "1bsk0cjjnc3li8lh3v1bg2bharv0r384p306d8cvybvn7855ymqi";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."scroll_derive"."0.9.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."scroll_derive"."0.9.5"."quote"}" deps)
      (crates."syn"."${deps."scroll_derive"."0.9.5"."syn"}" deps)
    ]);
  };
  features_.scroll_derive."0.9.5" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.scroll_derive."0.9.5".proc_macro2}".default = true;
    quote."${deps.scroll_derive."0.9.5".quote}".default = true;
    scroll_derive."0.9.5".default = (f.scroll_derive."0.9.5".default or true);
    syn."${deps.scroll_derive."0.9.5".syn}".default = true;
  }) [
    (features_.proc_macro2."${deps."scroll_derive"."0.9.5"."proc_macro2"}" deps)
    (features_.quote."${deps."scroll_derive"."0.9.5"."quote"}" deps)
    (features_.syn."${deps."scroll_derive"."0.9.5"."syn"}" deps)
  ];


# end
# sct-0.5.0

  crates.sct."0.5.0" = deps: { features?(features_.sct."0.5.0" deps {}) }: buildRustCrate {
    crateName = "sct";
    version = "0.5.0";
    authors = [ "Joseph Birr-Pixton <jpixton@gmail.com>" ];
    edition = "2018";
    sha256 = "17y9jyb83q124570vkyir6js9lag353wddc3il6pip3dpimyjnr1";
    dependencies = mapFeatures features ([
      (crates."ring"."${deps."sct"."0.5.0"."ring"}" deps)
      (crates."untrusted"."${deps."sct"."0.5.0"."untrusted"}" deps)
    ]);
  };
  features_.sct."0.5.0" = deps: f: updateFeatures f (rec {
    ring."${deps.sct."0.5.0".ring}".default = true;
    sct."0.5.0".default = (f.sct."0.5.0".default or true);
    untrusted."${deps.sct."0.5.0".untrusted}".default = true;
  }) [
    (features_.ring."${deps."sct"."0.5.0"."ring"}" deps)
    (features_.untrusted."${deps."sct"."0.5.0"."untrusted"}" deps)
  ];


# end
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_.semver."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]
      ++ (if features.semver."0.9.0".serde or false then [ (crates.serde."${deps."semver"."0.9.0".serde}" deps) ] else []));
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_.semver."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
      { "0.9.0".serde =
        (f.semver."0.9.0".serde or false) ||
        (f.semver."0.9.0".ci or false) ||
        (semver."0.9.0"."ci" or false); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
    serde."${deps.semver."0.9.0".serde}".default = true;
  }) [
    (features_.semver_parser."${deps."semver"."0.9.0"."semver_parser"}" deps)
    (features_.serde."${deps."semver"."0.9.0"."serde"}" deps)
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_.semver_parser."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_.semver_parser."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# serde-1.0.94

  crates.serde."1.0.94" = deps: { features?(features_.serde."1.0.94" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.94";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1qk7sk8xcjlj832ia5ahkas536kz06s3y0h70rqqji6srgl716f6";
    build = "build.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.serde."1.0.94".serde_derive or false then [ (crates.serde_derive."${deps."serde"."1.0.94".serde_derive}" deps) ] else []));
    features = mkFeatures (features."serde"."1.0.94" or {});
  };
  features_.serde."1.0.94" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.94".default = (f.serde."1.0.94".default or true); }
      { "1.0.94".serde_derive =
        (f.serde."1.0.94".serde_derive or false) ||
        (f.serde."1.0.94".derive or false) ||
        (serde."1.0.94"."derive" or false); }
      { "1.0.94".std =
        (f.serde."1.0.94".std or false) ||
        (f.serde."1.0.94".default or false) ||
        (serde."1.0.94"."default" or false); }
      { "1.0.94".unstable =
        (f.serde."1.0.94".unstable or false) ||
        (f.serde."1.0.94".alloc or false) ||
        (serde."1.0.94"."alloc" or false); }
    ];
    serde_derive."${deps.serde."1.0.94".serde_derive}".default = true;
  }) [
    (features_.serde_derive."${deps."serde"."1.0.94"."serde_derive"}" deps)
  ];


# end
# serde_derive-1.0.94

  crates.serde_derive."1.0.94" = deps: { features?(features_.serde_derive."1.0.94" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.94";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "07s8pyjbdbs5891rbkwvgr6dgk9vbkg9gppnajbhz7nxmpkhgrx4";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.94"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.94"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.94"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.94" or {});
  };
  features_.serde_derive."1.0.94" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.94".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.94".quote}".default = true;
    serde_derive."1.0.94".default = (f.serde_derive."1.0.94".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.94".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.94".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.94"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.94"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.94"."syn"}" deps)
  ];


# end
# serde_json-1.0.40

  crates.serde_json."1.0.40" = deps: { features?(features_.serde_json."1.0.40" deps {}) }: buildRustCrate {
    crateName = "serde_json";
    version = "1.0.40";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1wf8lkisjvyg4ghp2fwm3ysymjy66l030l8d7p6033wiayfzpyh3";
    dependencies = mapFeatures features ([
      (crates."itoa"."${deps."serde_json"."1.0.40"."itoa"}" deps)
      (crates."ryu"."${deps."serde_json"."1.0.40"."ryu"}" deps)
      (crates."serde"."${deps."serde_json"."1.0.40"."serde"}" deps)
    ]);
    features = mkFeatures (features."serde_json"."1.0.40" or {});
  };
  features_.serde_json."1.0.40" = deps: f: updateFeatures f (rec {
    itoa."${deps.serde_json."1.0.40".itoa}".default = true;
    ryu."${deps.serde_json."1.0.40".ryu}".default = true;
    serde."${deps.serde_json."1.0.40".serde}".default = true;
    serde_json = fold recursiveUpdate {} [
      { "1.0.40".default = (f.serde_json."1.0.40".default or true); }
      { "1.0.40".indexmap =
        (f.serde_json."1.0.40".indexmap or false) ||
        (f.serde_json."1.0.40".preserve_order or false) ||
        (serde_json."1.0.40"."preserve_order" or false); }
    ];
  }) [
    (features_.itoa."${deps."serde_json"."1.0.40"."itoa"}" deps)
    (features_.ryu."${deps."serde_json"."1.0.40"."ryu"}" deps)
    (features_.serde."${deps."serde_json"."1.0.40"."serde"}" deps)
  ];


# end
# serde_urlencoded-0.5.5

  crates.serde_urlencoded."0.5.5" = deps: { features?(features_.serde_urlencoded."0.5.5" deps {}) }: buildRustCrate {
    crateName = "serde_urlencoded";
    version = "0.5.5";
    authors = [ "Anthony Ramine <n.oxyde@gmail.com>" ];
    sha256 = "1rf49i9w1p1yhr9fr5xsq6mi23i9ggj7132qwrfsaiimfvs6y7i0";
    dependencies = mapFeatures features ([
      (crates."dtoa"."${deps."serde_urlencoded"."0.5.5"."dtoa"}" deps)
      (crates."itoa"."${deps."serde_urlencoded"."0.5.5"."itoa"}" deps)
      (crates."serde"."${deps."serde_urlencoded"."0.5.5"."serde"}" deps)
      (crates."url"."${deps."serde_urlencoded"."0.5.5"."url"}" deps)
    ]);
  };
  features_.serde_urlencoded."0.5.5" = deps: f: updateFeatures f (rec {
    dtoa."${deps.serde_urlencoded."0.5.5".dtoa}".default = true;
    itoa."${deps.serde_urlencoded."0.5.5".itoa}".default = true;
    serde."${deps.serde_urlencoded."0.5.5".serde}".default = true;
    serde_urlencoded."0.5.5".default = (f.serde_urlencoded."0.5.5".default or true);
    url."${deps.serde_urlencoded."0.5.5".url}".default = true;
  }) [
    (features_.dtoa."${deps."serde_urlencoded"."0.5.5"."dtoa"}" deps)
    (features_.itoa."${deps."serde_urlencoded"."0.5.5"."itoa"}" deps)
    (features_.serde."${deps."serde_urlencoded"."0.5.5"."serde"}" deps)
    (features_.url."${deps."serde_urlencoded"."0.5.5"."url"}" deps)
  ];


# end
# sha2-0.8.0

  crates.sha2."0.8.0" = deps: { features?(features_.sha2."0.8.0" deps {}) }: buildRustCrate {
    crateName = "sha2";
    version = "0.8.0";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0jhg56v7m6mj3jb857np4qvr72146garnabcgdk368fm0csfs1sq";
    dependencies = mapFeatures features ([
      (crates."block_buffer"."${deps."sha2"."0.8.0"."block_buffer"}" deps)
      (crates."digest"."${deps."sha2"."0.8.0"."digest"}" deps)
      (crates."fake_simd"."${deps."sha2"."0.8.0"."fake_simd"}" deps)
      (crates."opaque_debug"."${deps."sha2"."0.8.0"."opaque_debug"}" deps)
    ]);
    features = mkFeatures (features."sha2"."0.8.0" or {});
  };
  features_.sha2."0.8.0" = deps: f: updateFeatures f (rec {
    block_buffer."${deps.sha2."0.8.0".block_buffer}".default = true;
    digest = fold recursiveUpdate {} [
      { "${deps.sha2."0.8.0".digest}"."std" =
        (f.digest."${deps.sha2."0.8.0".digest}"."std" or false) ||
        (sha2."0.8.0"."std" or false) ||
        (f."sha2"."0.8.0"."std" or false); }
      { "${deps.sha2."0.8.0".digest}".default = true; }
    ];
    fake_simd."${deps.sha2."0.8.0".fake_simd}".default = true;
    opaque_debug."${deps.sha2."0.8.0".opaque_debug}".default = true;
    sha2 = fold recursiveUpdate {} [
      { "0.8.0".default = (f.sha2."0.8.0".default or true); }
      { "0.8.0".sha2-asm =
        (f.sha2."0.8.0".sha2-asm or false) ||
        (f.sha2."0.8.0".asm or false) ||
        (sha2."0.8.0"."asm" or false); }
      { "0.8.0".std =
        (f.sha2."0.8.0".std or false) ||
        (f.sha2."0.8.0".default or false) ||
        (sha2."0.8.0"."default" or false); }
    ];
  }) [
    (features_.block_buffer."${deps."sha2"."0.8.0"."block_buffer"}" deps)
    (features_.digest."${deps."sha2"."0.8.0"."digest"}" deps)
    (features_.fake_simd."${deps."sha2"."0.8.0"."fake_simd"}" deps)
    (features_.opaque_debug."${deps."sha2"."0.8.0"."opaque_debug"}" deps)
  ];


# end
# shlex-0.1.1

  crates.shlex."0.1.1" = deps: { features?(features_.shlex."0.1.1" deps {}) }: buildRustCrate {
    crateName = "shlex";
    version = "0.1.1";
    authors = [ "comex <comexk@gmail.com>" ];
    sha256 = "18vqycq8apg10pg5na57wff8z957d1q05yhvkddqbqflw98xj0rv";
  };
  features_.shlex."0.1.1" = deps: f: updateFeatures f (rec {
    shlex."0.1.1".default = (f.shlex."0.1.1".default or true);
  }) [];


# end
# siphasher-0.2.3

  crates.siphasher."0.2.3" = deps: { features?(features_.siphasher."0.2.3" deps {}) }: buildRustCrate {
    crateName = "siphasher";
    version = "0.2.3";
    authors = [ "Frank Denis <github@pureftpd.org>" ];
    sha256 = "1ganj1grxqnkvv4ds3vby039bm999jrr58nfq2x3kjhzkw2bnqkw";
  };
  features_.siphasher."0.2.3" = deps: f: updateFeatures f (rec {
    siphasher."0.2.3".default = (f.siphasher."0.2.3".default or true);
  }) [];


# end
# slab-0.4.2

  crates.slab."0.4.2" = deps: { features?(features_.slab."0.4.2" deps {}) }: buildRustCrate {
    crateName = "slab";
    version = "0.4.2";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0h1l2z7qy6207kv0v3iigdf2xfk9yrhbwj1svlxk6wxjmdxvgdl7";
  };
  features_.slab."0.4.2" = deps: f: updateFeatures f (rec {
    slab."0.4.2".default = (f.slab."0.4.2".default or true);
  }) [];


# end
# smallvec-0.6.10

  crates.smallvec."0.6.10" = deps: { features?(features_.smallvec."0.6.10" deps {}) }: buildRustCrate {
    crateName = "smallvec";
    version = "0.6.10";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "01w7xd79q0bwn683gk4ryw50ad1zzxkny10f7gkbaaj1ax6f4q4h";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."smallvec"."0.6.10" or {});
  };
  features_.smallvec."0.6.10" = deps: f: updateFeatures f (rec {
    smallvec = fold recursiveUpdate {} [
      { "0.6.10".default = (f.smallvec."0.6.10".default or true); }
      { "0.6.10".std =
        (f.smallvec."0.6.10".std or false) ||
        (f.smallvec."0.6.10".default or false) ||
        (smallvec."0.6.10"."default" or false); }
    ];
  }) [];


# end
# spin-0.5.0

  crates.spin."0.5.0" = deps: { features?(features_.spin."0.5.0" deps {}) }: buildRustCrate {
    crateName = "spin";
    version = "0.5.0";
    authors = [ "Mathijs van de Nes <git@mathijs.vd-nes.nl>" "John Ericson <git@JohnEricson.me>" ];
    sha256 = "1yln8vy2z7nkwn7s7fdzmqrwk77cwmfgcp89kzxm2ljdrf5vccar";
  };
  features_.spin."0.5.0" = deps: f: updateFeatures f (rec {
    spin."0.5.0".default = (f.spin."0.5.0".default or true);
  }) [];


# end
# stable_deref_trait-1.1.1

  crates.stable_deref_trait."1.1.1" = deps: { features?(features_.stable_deref_trait."1.1.1" deps {}) }: buildRustCrate {
    crateName = "stable_deref_trait";
    version = "1.1.1";
    authors = [ "Robert Grosse <n210241048576@gmail.com>" ];
    sha256 = "1xy9slzslrzr31nlnw52sl1d820b09y61b7f13lqgsn8n7y0l4g8";
    features = mkFeatures (features."stable_deref_trait"."1.1.1" or {});
  };
  features_.stable_deref_trait."1.1.1" = deps: f: updateFeatures f (rec {
    stable_deref_trait = fold recursiveUpdate {} [
      { "1.1.1".default = (f.stable_deref_trait."1.1.1".default or true); }
      { "1.1.1".std =
        (f.stable_deref_trait."1.1.1".std or false) ||
        (f.stable_deref_trait."1.1.1".default or false) ||
        (stable_deref_trait."1.1.1"."default" or false); }
    ];
  }) [];


# end
# string-0.2.1

  crates.string."0.2.1" = deps: { features?(features_.string."0.2.1" deps {}) }: buildRustCrate {
    crateName = "string";
    version = "0.2.1";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "066vpc33qik0f8hpa1841hdzwcwj6ai3vdwsd34k1s2w9p3n7jqk";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.string."0.2.1".bytes or false then [ (crates.bytes."${deps."string"."0.2.1".bytes}" deps) ] else []));
    features = mkFeatures (features."string"."0.2.1" or {});
  };
  features_.string."0.2.1" = deps: f: updateFeatures f (rec {
    bytes."${deps.string."0.2.1".bytes}".default = true;
    string = fold recursiveUpdate {} [
      { "0.2.1".bytes =
        (f.string."0.2.1".bytes or false) ||
        (f.string."0.2.1".default or false) ||
        (string."0.2.1"."default" or false); }
      { "0.2.1".default = (f.string."0.2.1".default or true); }
    ];
  }) [
    (features_.bytes."${deps."string"."0.2.1"."bytes"}" deps)
  ];


# end
# strsim-0.8.0

  crates.strsim."0.8.0" = deps: { features?(features_.strsim."0.8.0" deps {}) }: buildRustCrate {
    crateName = "strsim";
    version = "0.8.0";
    authors = [ "Danny Guo <dannyguo91@gmail.com>" ];
    sha256 = "0d3jsdz22wgjyxdakqnvdgmwjdvkximz50d9zfk4qlalw635qcvy";
  };
  features_.strsim."0.8.0" = deps: f: updateFeatures f (rec {
    strsim."0.8.0".default = (f.strsim."0.8.0".default or true);
  }) [];


# end
# structopt-0.2.18

  crates.structopt."0.2.18" = deps: { features?(features_.structopt."0.2.18" deps {}) }: buildRustCrate {
    crateName = "structopt";
    version = "0.2.18";
    authors = [ "Guillaume Pinot <texitoi@texitoi.eu>" "others" ];
    sha256 = "096mzwn2d5qsa0k5kxvd1ag38fm5rfrr262fnacfrq5k13ldl9j2";
    dependencies = mapFeatures features ([
      (crates."clap"."${deps."structopt"."0.2.18"."clap"}" deps)
      (crates."structopt_derive"."${deps."structopt"."0.2.18"."structopt_derive"}" deps)
    ]);
    features = mkFeatures (features."structopt"."0.2.18" or {});
  };
  features_.structopt."0.2.18" = deps: f: updateFeatures f (rec {
    clap = fold recursiveUpdate {} [
      { "${deps.structopt."0.2.18".clap}"."color" =
        (f.clap."${deps.structopt."0.2.18".clap}"."color" or false) ||
        (structopt."0.2.18"."color" or false) ||
        (f."structopt"."0.2.18"."color" or false); }
      { "${deps.structopt."0.2.18".clap}"."debug" =
        (f.clap."${deps.structopt."0.2.18".clap}"."debug" or false) ||
        (structopt."0.2.18"."debug" or false) ||
        (f."structopt"."0.2.18"."debug" or false); }
      { "${deps.structopt."0.2.18".clap}"."default" =
        (f.clap."${deps.structopt."0.2.18".clap}"."default" or false) ||
        (structopt."0.2.18"."default" or false) ||
        (f."structopt"."0.2.18"."default" or false); }
      { "${deps.structopt."0.2.18".clap}"."doc" =
        (f.clap."${deps.structopt."0.2.18".clap}"."doc" or false) ||
        (structopt."0.2.18"."doc" or false) ||
        (f."structopt"."0.2.18"."doc" or false); }
      { "${deps.structopt."0.2.18".clap}"."lints" =
        (f.clap."${deps.structopt."0.2.18".clap}"."lints" or false) ||
        (structopt."0.2.18"."lints" or false) ||
        (f."structopt"."0.2.18"."lints" or false); }
      { "${deps.structopt."0.2.18".clap}"."no_cargo" =
        (f.clap."${deps.structopt."0.2.18".clap}"."no_cargo" or false) ||
        (structopt."0.2.18"."no_cargo" or false) ||
        (f."structopt"."0.2.18"."no_cargo" or false); }
      { "${deps.structopt."0.2.18".clap}"."suggestions" =
        (f.clap."${deps.structopt."0.2.18".clap}"."suggestions" or false) ||
        (structopt."0.2.18"."suggestions" or false) ||
        (f."structopt"."0.2.18"."suggestions" or false); }
      { "${deps.structopt."0.2.18".clap}"."wrap_help" =
        (f.clap."${deps.structopt."0.2.18".clap}"."wrap_help" or false) ||
        (structopt."0.2.18"."wrap_help" or false) ||
        (f."structopt"."0.2.18"."wrap_help" or false); }
      { "${deps.structopt."0.2.18".clap}"."yaml" =
        (f.clap."${deps.structopt."0.2.18".clap}"."yaml" or false) ||
        (structopt."0.2.18"."yaml" or false) ||
        (f."structopt"."0.2.18"."yaml" or false); }
      { "${deps.structopt."0.2.18".clap}".default = (f.clap."${deps.structopt."0.2.18".clap}".default or false); }
    ];
    structopt."0.2.18".default = (f.structopt."0.2.18".default or true);
    structopt_derive = fold recursiveUpdate {} [
      { "${deps.structopt."0.2.18".structopt_derive}"."nightly" =
        (f.structopt_derive."${deps.structopt."0.2.18".structopt_derive}"."nightly" or false) ||
        (structopt."0.2.18"."nightly" or false) ||
        (f."structopt"."0.2.18"."nightly" or false); }
      { "${deps.structopt."0.2.18".structopt_derive}"."paw" =
        (f.structopt_derive."${deps.structopt."0.2.18".structopt_derive}"."paw" or false) ||
        (structopt."0.2.18"."paw" or false) ||
        (f."structopt"."0.2.18"."paw" or false); }
      { "${deps.structopt."0.2.18".structopt_derive}".default = true; }
    ];
  }) [
    (features_.clap."${deps."structopt"."0.2.18"."clap"}" deps)
    (features_.structopt_derive."${deps."structopt"."0.2.18"."structopt_derive"}" deps)
  ];


# end
# structopt-derive-0.2.18

  crates.structopt_derive."0.2.18" = deps: { features?(features_.structopt_derive."0.2.18" deps {}) }: buildRustCrate {
    crateName = "structopt-derive";
    version = "0.2.18";
    authors = [ "Guillaume Pinot <texitoi@texitoi.eu>" ];
    sha256 = "0wrhvq92psxa62jx6ypyhld7d5l3l7va0s0qwy1mq7c863wnhp7p";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."heck"."${deps."structopt_derive"."0.2.18"."heck"}" deps)
      (crates."proc_macro2"."${deps."structopt_derive"."0.2.18"."proc_macro2"}" deps)
      (crates."quote"."${deps."structopt_derive"."0.2.18"."quote"}" deps)
      (crates."syn"."${deps."structopt_derive"."0.2.18"."syn"}" deps)
    ]);
    features = mkFeatures (features."structopt_derive"."0.2.18" or {});
  };
  features_.structopt_derive."0.2.18" = deps: f: updateFeatures f (rec {
    heck."${deps.structopt_derive."0.2.18".heck}".default = true;
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.structopt_derive."0.2.18".proc_macro2}"."nightly" =
        (f.proc_macro2."${deps.structopt_derive."0.2.18".proc_macro2}"."nightly" or false) ||
        (structopt_derive."0.2.18"."nightly" or false) ||
        (f."structopt_derive"."0.2.18"."nightly" or false); }
      { "${deps.structopt_derive."0.2.18".proc_macro2}".default = true; }
    ];
    quote."${deps.structopt_derive."0.2.18".quote}".default = true;
    structopt_derive."0.2.18".default = (f.structopt_derive."0.2.18".default or true);
    syn."${deps.structopt_derive."0.2.18".syn}".default = true;
  }) [
    (features_.heck."${deps."structopt_derive"."0.2.18"."heck"}" deps)
    (features_.proc_macro2."${deps."structopt_derive"."0.2.18"."proc_macro2"}" deps)
    (features_.quote."${deps."structopt_derive"."0.2.18"."quote"}" deps)
    (features_.syn."${deps."structopt_derive"."0.2.18"."syn"}" deps)
  ];


# end
# syn-0.15.39

  crates.syn."0.15.39" = deps: { features?(features_.syn."0.15.39" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.39";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0n5mv317yghjcgzm0ik9racfjx8srhwfgazm6y80wgmkfpwz8myy";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.39"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.39"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.39".quote or false then [ (crates.quote."${deps."syn"."0.15.39".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.39" or {});
  };
  features_.syn."0.15.39" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.39".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.39".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.39"."proc-macro" or false) ||
        (f."syn"."0.15.39"."proc-macro" or false); }
      { "${deps.syn."0.15.39".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.39".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.39".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.39".quote}"."proc-macro" or false) ||
        (syn."0.15.39"."proc-macro" or false) ||
        (f."syn"."0.15.39"."proc-macro" or false); }
      { "${deps.syn."0.15.39".quote}".default = (f.quote."${deps.syn."0.15.39".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.39".clone-impls =
        (f.syn."0.15.39".clone-impls or false) ||
        (f.syn."0.15.39".default or false) ||
        (syn."0.15.39"."default" or false); }
      { "0.15.39".default = (f.syn."0.15.39".default or true); }
      { "0.15.39".derive =
        (f.syn."0.15.39".derive or false) ||
        (f.syn."0.15.39".default or false) ||
        (syn."0.15.39"."default" or false); }
      { "0.15.39".parsing =
        (f.syn."0.15.39".parsing or false) ||
        (f.syn."0.15.39".default or false) ||
        (syn."0.15.39"."default" or false); }
      { "0.15.39".printing =
        (f.syn."0.15.39".printing or false) ||
        (f.syn."0.15.39".default or false) ||
        (syn."0.15.39"."default" or false); }
      { "0.15.39".proc-macro =
        (f.syn."0.15.39".proc-macro or false) ||
        (f.syn."0.15.39".default or false) ||
        (syn."0.15.39"."default" or false); }
      { "0.15.39".quote =
        (f.syn."0.15.39".quote or false) ||
        (f.syn."0.15.39".printing or false) ||
        (syn."0.15.39"."printing" or false); }
    ];
    unicode_xid."${deps.syn."0.15.39".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.39"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.39"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.39"."unicode_xid"}" deps)
  ];


# end
# synstructure-0.10.2

  crates.synstructure."0.10.2" = deps: { features?(features_.synstructure."0.10.2" deps {}) }: buildRustCrate {
    crateName = "synstructure";
    version = "0.10.2";
    authors = [ "Nika Layzell <nika@thelayzells.com>" ];
    sha256 = "0bp29grjsim99xm1l6h38mbl98gnk47lf82rawlmws5zn4asdpj4";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."synstructure"."0.10.2"."proc_macro2"}" deps)
      (crates."quote"."${deps."synstructure"."0.10.2"."quote"}" deps)
      (crates."syn"."${deps."synstructure"."0.10.2"."syn"}" deps)
      (crates."unicode_xid"."${deps."synstructure"."0.10.2"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."synstructure"."0.10.2" or {});
  };
  features_.synstructure."0.10.2" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.synstructure."0.10.2".proc_macro2}".default = true;
    quote."${deps.synstructure."0.10.2".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.synstructure."0.10.2".syn}"."extra-traits" = true; }
      { "${deps.synstructure."0.10.2".syn}"."visit" = true; }
      { "${deps.synstructure."0.10.2".syn}".default = true; }
    ];
    synstructure."0.10.2".default = (f.synstructure."0.10.2".default or true);
    unicode_xid."${deps.synstructure."0.10.2".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."synstructure"."0.10.2"."proc_macro2"}" deps)
    (features_.quote."${deps."synstructure"."0.10.2"."quote"}" deps)
    (features_.syn."${deps."synstructure"."0.10.2"."syn"}" deps)
    (features_.unicode_xid."${deps."synstructure"."0.10.2"."unicode_xid"}" deps)
  ];


# end
# take_mut-0.2.2

  crates.take_mut."0.2.2" = deps: { features?(features_.take_mut."0.2.2" deps {}) }: buildRustCrate {
    crateName = "take_mut";
    version = "0.2.2";
    authors = [ "Sgeo <sgeoster@gmail.com>" ];
    sha256 = "1jidav4jx1lkz69ixjh37k3m0w46adk798fv7qj6k0zhzkd1kshv";
  };
  features_.take_mut."0.2.2" = deps: f: updateFeatures f (rec {
    take_mut."0.2.2".default = (f.take_mut."0.2.2".default or true);
  }) [];


# end
# tar-0.4.26

  crates.tar."0.4.26" = deps: { features?(features_.tar."0.4.26" deps {}) }: buildRustCrate {
    crateName = "tar";
    version = "0.4.26";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "1rmv889ibi1zllqpib5ywa2gdqsx4qg2l9qxr7skk4j5spcsy7lp";
    dependencies = mapFeatures features ([
      (crates."filetime"."${deps."tar"."0.4.26"."filetime"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tar"."0.4.26"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tar"."0.4.26"."libc"}" deps)
    ]
      ++ (if features.tar."0.4.26".xattr or false then [ (crates.xattr."${deps."tar"."0.4.26".xattr}" deps) ] else [])) else []);
    features = mkFeatures (features."tar"."0.4.26" or {});
  };
  features_.tar."0.4.26" = deps: f: updateFeatures f (rec {
    filetime."${deps.tar."0.4.26".filetime}".default = true;
    libc."${deps.tar."0.4.26".libc}".default = true;
    redox_syscall."${deps.tar."0.4.26".redox_syscall}".default = true;
    tar = fold recursiveUpdate {} [
      { "0.4.26".default = (f.tar."0.4.26".default or true); }
      { "0.4.26".xattr =
        (f.tar."0.4.26".xattr or false) ||
        (f.tar."0.4.26".default or false) ||
        (tar."0.4.26"."default" or false); }
    ];
    xattr."${deps.tar."0.4.26".xattr}".default = true;
  }) [
    (features_.filetime."${deps."tar"."0.4.26"."filetime"}" deps)
    (features_.redox_syscall."${deps."tar"."0.4.26"."redox_syscall"}" deps)
    (features_.libc."${deps."tar"."0.4.26"."libc"}" deps)
    (features_.xattr."${deps."tar"."0.4.26"."xattr"}" deps)
  ];


# end
# target_info-0.1.0

  crates.target_info."0.1.0" = deps: { features?(features_.target_info."0.1.0" deps {}) }: buildRustCrate {
    crateName = "target_info";
    version = "0.1.0";
    authors = [ "Gav Wood <gav@ethcore.io>" ];
    sha256 = "0ns9z7ic2n2k04jrhm79axcs681lbwjgx08xxxdls7wa05kby2q0";
  };
  features_.target_info."0.1.0" = deps: f: updateFeatures f (rec {
    target_info."0.1.0".default = (f.target_info."0.1.0".default or true);
  }) [];


# end
# tempfile-3.1.0

  crates.tempfile."3.1.0" = deps: { features?(features_.tempfile."3.1.0" deps {}) }: buildRustCrate {
    crateName = "tempfile";
    version = "3.1.0";
    authors = [ "Steven Allen <steven@stebalien.com>" "The Rust Project Developers" "Ashley Mannix <ashleymannix@live.com.au>" "Jason White <jasonaw0@gmail.com>" ];
    edition = "2018";
    sha256 = "1r7ykxw90p5hm1g46i8ia33j5iwl3q252kbb6b074qhdav3sqndk";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."tempfile"."3.1.0"."cfg_if"}" deps)
      (crates."rand"."${deps."tempfile"."3.1.0"."rand"}" deps)
      (crates."remove_dir_all"."${deps."tempfile"."3.1.0"."remove_dir_all"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tempfile"."3.1.0"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tempfile"."3.1.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."tempfile"."3.1.0"."winapi"}" deps)
    ]) else []);
  };
  features_.tempfile."3.1.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.tempfile."3.1.0".cfg_if}".default = true;
    libc."${deps.tempfile."3.1.0".libc}".default = true;
    rand."${deps.tempfile."3.1.0".rand}".default = true;
    redox_syscall."${deps.tempfile."3.1.0".redox_syscall}".default = true;
    remove_dir_all."${deps.tempfile."3.1.0".remove_dir_all}".default = true;
    tempfile."3.1.0".default = (f.tempfile."3.1.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.tempfile."3.1.0".winapi}"."fileapi" = true; }
      { "${deps.tempfile."3.1.0".winapi}"."handleapi" = true; }
      { "${deps.tempfile."3.1.0".winapi}"."winbase" = true; }
      { "${deps.tempfile."3.1.0".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."tempfile"."3.1.0"."cfg_if"}" deps)
    (features_.rand."${deps."tempfile"."3.1.0"."rand"}" deps)
    (features_.remove_dir_all."${deps."tempfile"."3.1.0"."remove_dir_all"}" deps)
    (features_.redox_syscall."${deps."tempfile"."3.1.0"."redox_syscall"}" deps)
    (features_.libc."${deps."tempfile"."3.1.0"."libc"}" deps)
    (features_.winapi."${deps."tempfile"."3.1.0"."winapi"}" deps)
  ];


# end
# termcolor-1.0.5

  crates.termcolor."1.0.5" = deps: { features?(features_.termcolor."1.0.5" deps {}) }: buildRustCrate {
    crateName = "termcolor";
    version = "1.0.5";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "16266x431hbkmvyh0pv4yn7wm2kagicqaq6hy4fabn93c08sx0gp";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."wincolor"."${deps."termcolor"."1.0.5"."wincolor"}" deps)
    ]) else []);
  };
  features_.termcolor."1.0.5" = deps: f: updateFeatures f (rec {
    termcolor."1.0.5".default = (f.termcolor."1.0.5".default or true);
    wincolor."${deps.termcolor."1.0.5".wincolor}".default = true;
  }) [
    (features_.wincolor."${deps."termcolor"."1.0.5"."wincolor"}" deps)
  ];


# end
# termion-1.5.3

  crates.termion."1.5.3" = deps: { features?(features_.termion."1.5.3" deps {}) }: buildRustCrate {
    crateName = "termion";
    version = "1.5.3";
    authors = [ "ticki <Ticki@users.noreply.github.com>" "gycos <alexandre.bury@gmail.com>" "IGI-111 <igi-111@protonmail.com>" ];
    sha256 = "0l47ppblj8d97ch100100w9fbv47c3fhnqxbvsajcz2pj7ci414k";
    dependencies = mapFeatures features ([
      (crates."numtoa"."${deps."termion"."1.5.3"."numtoa"}" deps)
    ])
      ++ (if !(kernel == "redox") then mapFeatures features ([
      (crates."libc"."${deps."termion"."1.5.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."termion"."1.5.3"."redox_syscall"}" deps)
      (crates."redox_termios"."${deps."termion"."1.5.3"."redox_termios"}" deps)
    ]) else []);
  };
  features_.termion."1.5.3" = deps: f: updateFeatures f (rec {
    libc."${deps.termion."1.5.3".libc}".default = true;
    numtoa = fold recursiveUpdate {} [
      { "${deps.termion."1.5.3".numtoa}"."std" = true; }
      { "${deps.termion."1.5.3".numtoa}".default = true; }
    ];
    redox_syscall."${deps.termion."1.5.3".redox_syscall}".default = true;
    redox_termios."${deps.termion."1.5.3".redox_termios}".default = true;
    termion."1.5.3".default = (f.termion."1.5.3".default or true);
  }) [
    (features_.numtoa."${deps."termion"."1.5.3"."numtoa"}" deps)
    (features_.libc."${deps."termion"."1.5.3"."libc"}" deps)
    (features_.redox_syscall."${deps."termion"."1.5.3"."redox_syscall"}" deps)
    (features_.redox_termios."${deps."termion"."1.5.3"."redox_termios"}" deps)
  ];


# end
# textwrap-0.11.0

  crates.textwrap."0.11.0" = deps: { features?(features_.textwrap."0.11.0" deps {}) }: buildRustCrate {
    crateName = "textwrap";
    version = "0.11.0";
    authors = [ "Martin Geisler <martin@geisler.net>" ];
    sha256 = "0s25qh49n7kjayrdj4q3v0jk0jc6vy88rdw0bvgfxqlscpqpxi7d";
    dependencies = mapFeatures features ([
      (crates."unicode_width"."${deps."textwrap"."0.11.0"."unicode_width"}" deps)
    ]);
  };
  features_.textwrap."0.11.0" = deps: f: updateFeatures f (rec {
    textwrap."0.11.0".default = (f.textwrap."0.11.0".default or true);
    unicode_width."${deps.textwrap."0.11.0".unicode_width}".default = true;
  }) [
    (features_.unicode_width."${deps."textwrap"."0.11.0"."unicode_width"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# time-0.1.42

  crates.time."0.1.42" = deps: { features?(features_.time."0.1.42" deps {}) }: buildRustCrate {
    crateName = "time";
    version = "0.1.42";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ny809kmdjwd4b478ipc33dz7q6nq7rxk766x8cnrg6zygcksmmx";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."time"."0.1.42"."libc"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."time"."0.1.42"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."time"."0.1.42"."winapi"}" deps)
    ]) else []);
  };
  features_.time."0.1.42" = deps: f: updateFeatures f (rec {
    libc."${deps.time."0.1.42".libc}".default = true;
    redox_syscall."${deps.time."0.1.42".redox_syscall}".default = true;
    time."0.1.42".default = (f.time."0.1.42".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.time."0.1.42".winapi}"."minwinbase" = true; }
      { "${deps.time."0.1.42".winapi}"."minwindef" = true; }
      { "${deps.time."0.1.42".winapi}"."ntdef" = true; }
      { "${deps.time."0.1.42".winapi}"."profileapi" = true; }
      { "${deps.time."0.1.42".winapi}"."std" = true; }
      { "${deps.time."0.1.42".winapi}"."sysinfoapi" = true; }
      { "${deps.time."0.1.42".winapi}"."timezoneapi" = true; }
      { "${deps.time."0.1.42".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."time"."0.1.42"."libc"}" deps)
    (features_.redox_syscall."${deps."time"."0.1.42"."redox_syscall"}" deps)
    (features_.winapi."${deps."time"."0.1.42"."winapi"}" deps)
  ];


# end
# tokio-0.1.22

  crates.tokio."0.1.22" = deps: { features?(features_.tokio."0.1.22" deps {}) }: buildRustCrate {
    crateName = "tokio";
    version = "0.1.22";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1nx8yg8fdwf5nm2ykfza24cx8xy5in6da5va5w76mv347r1irr0b";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio"."0.1.22"."futures"}" deps)
    ]
      ++ (if features.tokio."0.1.22".bytes or false then [ (crates.bytes."${deps."tokio"."0.1.22".bytes}" deps) ] else [])
      ++ (if features.tokio."0.1.22".mio or false then [ (crates.mio."${deps."tokio"."0.1.22".mio}" deps) ] else [])
      ++ (if features.tokio."0.1.22".num_cpus or false then [ (crates.num_cpus."${deps."tokio"."0.1.22".num_cpus}" deps) ] else [])
      ++ (if features.tokio."0.1.22".tokio-current-thread or false then [ (crates.tokio_current_thread."${deps."tokio"."0.1.22".tokio_current_thread}" deps) ] else [])
      ++ (if features.tokio."0.1.22".tokio-executor or false then [ (crates.tokio_executor."${deps."tokio"."0.1.22".tokio_executor}" deps) ] else [])
      ++ (if features.tokio."0.1.22".tokio-io or false then [ (crates.tokio_io."${deps."tokio"."0.1.22".tokio_io}" deps) ] else [])
      ++ (if features.tokio."0.1.22".tokio-reactor or false then [ (crates.tokio_reactor."${deps."tokio"."0.1.22".tokio_reactor}" deps) ] else [])
      ++ (if features.tokio."0.1.22".tokio-tcp or false then [ (crates.tokio_tcp."${deps."tokio"."0.1.22".tokio_tcp}" deps) ] else [])
      ++ (if features.tokio."0.1.22".tokio-threadpool or false then [ (crates.tokio_threadpool."${deps."tokio"."0.1.22".tokio_threadpool}" deps) ] else [])
      ++ (if features.tokio."0.1.22".tokio-timer or false then [ (crates.tokio_timer."${deps."tokio"."0.1.22".tokio_timer}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
]) else []);
    features = mkFeatures (features."tokio"."0.1.22" or {});
  };
  features_.tokio."0.1.22" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio."0.1.22".bytes}".default = true;
    futures."${deps.tokio."0.1.22".futures}".default = true;
    mio."${deps.tokio."0.1.22".mio}".default = true;
    num_cpus."${deps.tokio."0.1.22".num_cpus}".default = true;
    tokio = fold recursiveUpdate {} [
      { "0.1.22".bytes =
        (f.tokio."0.1.22".bytes or false) ||
        (f.tokio."0.1.22".io or false) ||
        (tokio."0.1.22"."io" or false); }
      { "0.1.22".codec =
        (f.tokio."0.1.22".codec or false) ||
        (f.tokio."0.1.22".default or false) ||
        (tokio."0.1.22"."default" or false); }
      { "0.1.22".default = (f.tokio."0.1.22".default or true); }
      { "0.1.22".fs =
        (f.tokio."0.1.22".fs or false) ||
        (f.tokio."0.1.22".default or false) ||
        (tokio."0.1.22"."default" or false); }
      { "0.1.22".io =
        (f.tokio."0.1.22".io or false) ||
        (f.tokio."0.1.22".codec or false) ||
        (tokio."0.1.22"."codec" or false) ||
        (f.tokio."0.1.22".default or false) ||
        (tokio."0.1.22"."default" or false) ||
        (f.tokio."0.1.22".reactor or false) ||
        (tokio."0.1.22"."reactor" or false); }
      { "0.1.22".mio =
        (f.tokio."0.1.22".mio or false) ||
        (f.tokio."0.1.22".reactor or false) ||
        (tokio."0.1.22"."reactor" or false); }
      { "0.1.22".num_cpus =
        (f.tokio."0.1.22".num_cpus or false) ||
        (f.tokio."0.1.22".rt-full or false) ||
        (tokio."0.1.22"."rt-full" or false); }
      { "0.1.22".reactor =
        (f.tokio."0.1.22".reactor or false) ||
        (f.tokio."0.1.22".default or false) ||
        (tokio."0.1.22"."default" or false) ||
        (f.tokio."0.1.22".rt-full or false) ||
        (tokio."0.1.22"."rt-full" or false); }
      { "0.1.22".rt-full =
        (f.tokio."0.1.22".rt-full or false) ||
        (f.tokio."0.1.22".default or false) ||
        (tokio."0.1.22"."default" or false); }
      { "0.1.22".sync =
        (f.tokio."0.1.22".sync or false) ||
        (f.tokio."0.1.22".default or false) ||
        (tokio."0.1.22"."default" or false); }
      { "0.1.22".tcp =
        (f.tokio."0.1.22".tcp or false) ||
        (f.tokio."0.1.22".default or false) ||
        (tokio."0.1.22"."default" or false); }
      { "0.1.22".timer =
        (f.tokio."0.1.22".timer or false) ||
        (f.tokio."0.1.22".default or false) ||
        (tokio."0.1.22"."default" or false) ||
        (f.tokio."0.1.22".rt-full or false) ||
        (tokio."0.1.22"."rt-full" or false); }
      { "0.1.22".tokio-codec =
        (f.tokio."0.1.22".tokio-codec or false) ||
        (f.tokio."0.1.22".codec or false) ||
        (tokio."0.1.22"."codec" or false); }
      { "0.1.22".tokio-current-thread =
        (f.tokio."0.1.22".tokio-current-thread or false) ||
        (f.tokio."0.1.22".rt-full or false) ||
        (tokio."0.1.22"."rt-full" or false); }
      { "0.1.22".tokio-executor =
        (f.tokio."0.1.22".tokio-executor or false) ||
        (f.tokio."0.1.22".rt-full or false) ||
        (tokio."0.1.22"."rt-full" or false); }
      { "0.1.22".tokio-fs =
        (f.tokio."0.1.22".tokio-fs or false) ||
        (f.tokio."0.1.22".fs or false) ||
        (tokio."0.1.22"."fs" or false); }
      { "0.1.22".tokio-io =
        (f.tokio."0.1.22".tokio-io or false) ||
        (f.tokio."0.1.22".io or false) ||
        (tokio."0.1.22"."io" or false); }
      { "0.1.22".tokio-reactor =
        (f.tokio."0.1.22".tokio-reactor or false) ||
        (f.tokio."0.1.22".reactor or false) ||
        (tokio."0.1.22"."reactor" or false); }
      { "0.1.22".tokio-sync =
        (f.tokio."0.1.22".tokio-sync or false) ||
        (f.tokio."0.1.22".sync or false) ||
        (tokio."0.1.22"."sync" or false); }
      { "0.1.22".tokio-tcp =
        (f.tokio."0.1.22".tokio-tcp or false) ||
        (f.tokio."0.1.22".tcp or false) ||
        (tokio."0.1.22"."tcp" or false); }
      { "0.1.22".tokio-threadpool =
        (f.tokio."0.1.22".tokio-threadpool or false) ||
        (f.tokio."0.1.22".rt-full or false) ||
        (tokio."0.1.22"."rt-full" or false); }
      { "0.1.22".tokio-timer =
        (f.tokio."0.1.22".tokio-timer or false) ||
        (f.tokio."0.1.22".timer or false) ||
        (tokio."0.1.22"."timer" or false); }
      { "0.1.22".tokio-udp =
        (f.tokio."0.1.22".tokio-udp or false) ||
        (f.tokio."0.1.22".udp or false) ||
        (tokio."0.1.22"."udp" or false); }
      { "0.1.22".tokio-uds =
        (f.tokio."0.1.22".tokio-uds or false) ||
        (f.tokio."0.1.22".uds or false) ||
        (tokio."0.1.22"."uds" or false); }
      { "0.1.22".tracing-core =
        (f.tokio."0.1.22".tracing-core or false) ||
        (f.tokio."0.1.22".experimental-tracing or false) ||
        (tokio."0.1.22"."experimental-tracing" or false); }
      { "0.1.22".udp =
        (f.tokio."0.1.22".udp or false) ||
        (f.tokio."0.1.22".default or false) ||
        (tokio."0.1.22"."default" or false); }
      { "0.1.22".uds =
        (f.tokio."0.1.22".uds or false) ||
        (f.tokio."0.1.22".default or false) ||
        (tokio."0.1.22"."default" or false); }
    ];
    tokio_current_thread."${deps.tokio."0.1.22".tokio_current_thread}".default = true;
    tokio_executor."${deps.tokio."0.1.22".tokio_executor}".default = true;
    tokio_io."${deps.tokio."0.1.22".tokio_io}".default = true;
    tokio_reactor."${deps.tokio."0.1.22".tokio_reactor}".default = true;
    tokio_tcp."${deps.tokio."0.1.22".tokio_tcp}".default = true;
    tokio_threadpool."${deps.tokio."0.1.22".tokio_threadpool}".default = true;
    tokio_timer."${deps.tokio."0.1.22".tokio_timer}".default = true;
  }) [
    (features_.bytes."${deps."tokio"."0.1.22"."bytes"}" deps)
    (features_.futures."${deps."tokio"."0.1.22"."futures"}" deps)
    (features_.mio."${deps."tokio"."0.1.22"."mio"}" deps)
    (features_.num_cpus."${deps."tokio"."0.1.22"."num_cpus"}" deps)
    (features_.tokio_current_thread."${deps."tokio"."0.1.22"."tokio_current_thread"}" deps)
    (features_.tokio_executor."${deps."tokio"."0.1.22"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."tokio"."0.1.22"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio"."0.1.22"."tokio_reactor"}" deps)
    (features_.tokio_tcp."${deps."tokio"."0.1.22"."tokio_tcp"}" deps)
    (features_.tokio_threadpool."${deps."tokio"."0.1.22"."tokio_threadpool"}" deps)
    (features_.tokio_timer."${deps."tokio"."0.1.22"."tokio_timer"}" deps)
  ];


# end
# tokio-buf-0.1.1

  crates.tokio_buf."0.1.1" = deps: { features?(features_.tokio_buf."0.1.1" deps {}) }: buildRustCrate {
    crateName = "tokio-buf";
    version = "0.1.1";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "11qjcqvhsjwwy66njn2c3nzl0i89a9k06l08s0vz9cswwkjc2427";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_buf"."0.1.1"."bytes"}" deps)
      (crates."futures"."${deps."tokio_buf"."0.1.1"."futures"}" deps)
    ]
      ++ (if features.tokio_buf."0.1.1".either or false then [ (crates.either."${deps."tokio_buf"."0.1.1".either}" deps) ] else []));
    features = mkFeatures (features."tokio_buf"."0.1.1" or {});
  };
  features_.tokio_buf."0.1.1" = deps: f: updateFeatures f (rec {
    bytes = fold recursiveUpdate {} [
      { "${deps.tokio_buf."0.1.1".bytes}"."either" =
        (f.bytes."${deps.tokio_buf."0.1.1".bytes}"."either" or false) ||
        (tokio_buf."0.1.1"."util" or false) ||
        (f."tokio_buf"."0.1.1"."util" or false); }
      { "${deps.tokio_buf."0.1.1".bytes}".default = true; }
    ];
    either."${deps.tokio_buf."0.1.1".either}".default = true;
    futures."${deps.tokio_buf."0.1.1".futures}".default = true;
    tokio_buf = fold recursiveUpdate {} [
      { "0.1.1".default = (f.tokio_buf."0.1.1".default or true); }
      { "0.1.1".either =
        (f.tokio_buf."0.1.1".either or false) ||
        (f.tokio_buf."0.1.1".util or false) ||
        (tokio_buf."0.1.1"."util" or false); }
      { "0.1.1".util =
        (f.tokio_buf."0.1.1".util or false) ||
        (f.tokio_buf."0.1.1".default or false) ||
        (tokio_buf."0.1.1"."default" or false); }
    ];
  }) [
    (features_.bytes."${deps."tokio_buf"."0.1.1"."bytes"}" deps)
    (features_.either."${deps."tokio_buf"."0.1.1"."either"}" deps)
    (features_.futures."${deps."tokio_buf"."0.1.1"."futures"}" deps)
  ];


# end
# tokio-current-thread-0.1.6

  crates.tokio_current_thread."0.1.6" = deps: { features?(features_.tokio_current_thread."0.1.6" deps {}) }: buildRustCrate {
    crateName = "tokio-current-thread";
    version = "0.1.6";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "07dm43svkrpifkcnv8f5w477cd9260pnkvnps39qkhkf5ixi8fzg";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."tokio_current_thread"."0.1.6"."futures"}" deps)
      (crates."tokio_executor"."${deps."tokio_current_thread"."0.1.6"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_current_thread."0.1.6" = deps: f: updateFeatures f (rec {
    futures."${deps.tokio_current_thread."0.1.6".futures}".default = true;
    tokio_current_thread."0.1.6".default = (f.tokio_current_thread."0.1.6".default or true);
    tokio_executor."${deps.tokio_current_thread."0.1.6".tokio_executor}".default = true;
  }) [
    (features_.futures."${deps."tokio_current_thread"."0.1.6"."futures"}" deps)
    (features_.tokio_executor."${deps."tokio_current_thread"."0.1.6"."tokio_executor"}" deps)
  ];


# end
# tokio-executor-0.1.8

  crates.tokio_executor."0.1.8" = deps: { features?(features_.tokio_executor."0.1.8" deps {}) }: buildRustCrate {
    crateName = "tokio-executor";
    version = "0.1.8";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "017pvi6ii0wb1s78vrbjhzwrjlc0mga3x98dz3g19lhylcl50f7r";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_executor"."0.1.8"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_executor"."0.1.8"."futures"}" deps)
    ]);
  };
  features_.tokio_executor."0.1.8" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_executor."0.1.8".crossbeam_utils}".default = true;
    futures."${deps.tokio_executor."0.1.8".futures}".default = true;
    tokio_executor."0.1.8".default = (f.tokio_executor."0.1.8".default or true);
  }) [
    (features_.crossbeam_utils."${deps."tokio_executor"."0.1.8"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_executor"."0.1.8"."futures"}" deps)
  ];


# end
# tokio-io-0.1.12

  crates.tokio_io."0.1.12" = deps: { features?(features_.tokio_io."0.1.12" deps {}) }: buildRustCrate {
    crateName = "tokio-io";
    version = "0.1.12";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0z64yfcm9i5ci2h9h7npa292plia9kb04xbm7cp0bzp1wsddv91r";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_io"."0.1.12"."bytes"}" deps)
      (crates."futures"."${deps."tokio_io"."0.1.12"."futures"}" deps)
      (crates."log"."${deps."tokio_io"."0.1.12"."log"}" deps)
    ]);
  };
  features_.tokio_io."0.1.12" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_io."0.1.12".bytes}".default = true;
    futures."${deps.tokio_io."0.1.12".futures}".default = true;
    log."${deps.tokio_io."0.1.12".log}".default = true;
    tokio_io."0.1.12".default = (f.tokio_io."0.1.12".default or true);
  }) [
    (features_.bytes."${deps."tokio_io"."0.1.12"."bytes"}" deps)
    (features_.futures."${deps."tokio_io"."0.1.12"."futures"}" deps)
    (features_.log."${deps."tokio_io"."0.1.12"."log"}" deps)
  ];


# end
# tokio-reactor-0.1.9

  crates.tokio_reactor."0.1.9" = deps: { features?(features_.tokio_reactor."0.1.9" deps {}) }: buildRustCrate {
    crateName = "tokio-reactor";
    version = "0.1.9";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "11gpxrykd6lbpj9b26dh4fymzawfxgqdx1pbhc771gxbf8qyj1gc";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_reactor"."0.1.9"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_reactor"."0.1.9"."futures"}" deps)
      (crates."lazy_static"."${deps."tokio_reactor"."0.1.9"."lazy_static"}" deps)
      (crates."log"."${deps."tokio_reactor"."0.1.9"."log"}" deps)
      (crates."mio"."${deps."tokio_reactor"."0.1.9"."mio"}" deps)
      (crates."num_cpus"."${deps."tokio_reactor"."0.1.9"."num_cpus"}" deps)
      (crates."parking_lot"."${deps."tokio_reactor"."0.1.9"."parking_lot"}" deps)
      (crates."slab"."${deps."tokio_reactor"."0.1.9"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_reactor"."0.1.9"."tokio_executor"}" deps)
      (crates."tokio_io"."${deps."tokio_reactor"."0.1.9"."tokio_io"}" deps)
      (crates."tokio_sync"."${deps."tokio_reactor"."0.1.9"."tokio_sync"}" deps)
    ]);
  };
  features_.tokio_reactor."0.1.9" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_reactor."0.1.9".crossbeam_utils}".default = true;
    futures."${deps.tokio_reactor."0.1.9".futures}".default = true;
    lazy_static."${deps.tokio_reactor."0.1.9".lazy_static}".default = true;
    log."${deps.tokio_reactor."0.1.9".log}".default = true;
    mio."${deps.tokio_reactor."0.1.9".mio}".default = true;
    num_cpus."${deps.tokio_reactor."0.1.9".num_cpus}".default = true;
    parking_lot."${deps.tokio_reactor."0.1.9".parking_lot}".default = true;
    slab."${deps.tokio_reactor."0.1.9".slab}".default = true;
    tokio_executor."${deps.tokio_reactor."0.1.9".tokio_executor}".default = true;
    tokio_io."${deps.tokio_reactor."0.1.9".tokio_io}".default = true;
    tokio_reactor."0.1.9".default = (f.tokio_reactor."0.1.9".default or true);
    tokio_sync."${deps.tokio_reactor."0.1.9".tokio_sync}".default = true;
  }) [
    (features_.crossbeam_utils."${deps."tokio_reactor"."0.1.9"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_reactor"."0.1.9"."futures"}" deps)
    (features_.lazy_static."${deps."tokio_reactor"."0.1.9"."lazy_static"}" deps)
    (features_.log."${deps."tokio_reactor"."0.1.9"."log"}" deps)
    (features_.mio."${deps."tokio_reactor"."0.1.9"."mio"}" deps)
    (features_.num_cpus."${deps."tokio_reactor"."0.1.9"."num_cpus"}" deps)
    (features_.parking_lot."${deps."tokio_reactor"."0.1.9"."parking_lot"}" deps)
    (features_.slab."${deps."tokio_reactor"."0.1.9"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_reactor"."0.1.9"."tokio_executor"}" deps)
    (features_.tokio_io."${deps."tokio_reactor"."0.1.9"."tokio_io"}" deps)
    (features_.tokio_sync."${deps."tokio_reactor"."0.1.9"."tokio_sync"}" deps)
  ];


# end
# tokio-rustls-0.9.3

  crates.tokio_rustls."0.9.3" = deps: { features?(features_.tokio_rustls."0.9.3" deps {}) }: buildRustCrate {
    crateName = "tokio-rustls";
    version = "0.9.3";
    authors = [ "quininer kel <quininer@live.com>" ];
    sha256 = "1fx0h6m0kp10b2p8z6wzpjpqmsqycnz3jbziif8lc5yka30ciap2";
    dependencies = mapFeatures features ([
      (crates."rustls"."${deps."tokio_rustls"."0.9.3"."rustls"}" deps)
      (crates."webpki"."${deps."tokio_rustls"."0.9.3"."webpki"}" deps)
    ]
      ++ (if features.tokio_rustls."0.9.3".futures or false then [ (crates.futures."${deps."tokio_rustls"."0.9.3".futures}" deps) ] else [])
      ++ (if features.tokio_rustls."0.9.3".tokio-io or false then [ (crates.tokio_io."${deps."tokio_rustls"."0.9.3".tokio_io}" deps) ] else []));
    features = mkFeatures (features."tokio_rustls"."0.9.3" or {});
  };
  features_.tokio_rustls."0.9.3" = deps: f: updateFeatures f (rec {
    futures."${deps.tokio_rustls."0.9.3".futures}".default = true;
    rustls."${deps.tokio_rustls."0.9.3".rustls}".default = true;
    tokio_io."${deps.tokio_rustls."0.9.3".tokio_io}".default = true;
    tokio_rustls = fold recursiveUpdate {} [
      { "0.9.3".bytes =
        (f.tokio_rustls."0.9.3".bytes or false) ||
        (f.tokio_rustls."0.9.3".nightly or false) ||
        (tokio_rustls."0.9.3"."nightly" or false); }
      { "0.9.3".default = (f.tokio_rustls."0.9.3".default or true); }
      { "0.9.3".futures =
        (f.tokio_rustls."0.9.3".futures or false) ||
        (f.tokio_rustls."0.9.3".tokio-support or false) ||
        (tokio_rustls."0.9.3"."tokio-support" or false); }
      { "0.9.3".iovec =
        (f.tokio_rustls."0.9.3".iovec or false) ||
        (f.tokio_rustls."0.9.3".nightly or false) ||
        (tokio_rustls."0.9.3"."nightly" or false); }
      { "0.9.3".tokio-io =
        (f.tokio_rustls."0.9.3".tokio-io or false) ||
        (f.tokio_rustls."0.9.3".tokio-support or false) ||
        (tokio_rustls."0.9.3"."tokio-support" or false); }
      { "0.9.3".tokio-support =
        (f.tokio_rustls."0.9.3".tokio-support or false) ||
        (f.tokio_rustls."0.9.3".default or false) ||
        (tokio_rustls."0.9.3"."default" or false); }
    ];
    webpki."${deps.tokio_rustls."0.9.3".webpki}".default = true;
  }) [
    (features_.futures."${deps."tokio_rustls"."0.9.3"."futures"}" deps)
    (features_.rustls."${deps."tokio_rustls"."0.9.3"."rustls"}" deps)
    (features_.tokio_io."${deps."tokio_rustls"."0.9.3"."tokio_io"}" deps)
    (features_.webpki."${deps."tokio_rustls"."0.9.3"."webpki"}" deps)
  ];


# end
# tokio-sync-0.1.6

  crates.tokio_sync."0.1.6" = deps: { features?(features_.tokio_sync."0.1.6" deps {}) }: buildRustCrate {
    crateName = "tokio-sync";
    version = "0.1.6";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0csjpxf7m088lh3nfkhj5q1zi5hycdk5xqcginw328rnl1srzyl7";
    dependencies = mapFeatures features ([
      (crates."fnv"."${deps."tokio_sync"."0.1.6"."fnv"}" deps)
      (crates."futures"."${deps."tokio_sync"."0.1.6"."futures"}" deps)
    ]);
  };
  features_.tokio_sync."0.1.6" = deps: f: updateFeatures f (rec {
    fnv."${deps.tokio_sync."0.1.6".fnv}".default = true;
    futures."${deps.tokio_sync."0.1.6".futures}".default = true;
    tokio_sync."0.1.6".default = (f.tokio_sync."0.1.6".default or true);
  }) [
    (features_.fnv."${deps."tokio_sync"."0.1.6"."fnv"}" deps)
    (features_.futures."${deps."tokio_sync"."0.1.6"."futures"}" deps)
  ];


# end
# tokio-tcp-0.1.3

  crates.tokio_tcp."0.1.3" = deps: { features?(features_.tokio_tcp."0.1.3" deps {}) }: buildRustCrate {
    crateName = "tokio-tcp";
    version = "0.1.3";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "07v5p339660zjy1w73wddagj3n5wa4v7v5gj7hnvw95ka407zvcz";
    dependencies = mapFeatures features ([
      (crates."bytes"."${deps."tokio_tcp"."0.1.3"."bytes"}" deps)
      (crates."futures"."${deps."tokio_tcp"."0.1.3"."futures"}" deps)
      (crates."iovec"."${deps."tokio_tcp"."0.1.3"."iovec"}" deps)
      (crates."mio"."${deps."tokio_tcp"."0.1.3"."mio"}" deps)
      (crates."tokio_io"."${deps."tokio_tcp"."0.1.3"."tokio_io"}" deps)
      (crates."tokio_reactor"."${deps."tokio_tcp"."0.1.3"."tokio_reactor"}" deps)
    ]);
  };
  features_.tokio_tcp."0.1.3" = deps: f: updateFeatures f (rec {
    bytes."${deps.tokio_tcp."0.1.3".bytes}".default = true;
    futures."${deps.tokio_tcp."0.1.3".futures}".default = true;
    iovec."${deps.tokio_tcp."0.1.3".iovec}".default = true;
    mio."${deps.tokio_tcp."0.1.3".mio}".default = true;
    tokio_io."${deps.tokio_tcp."0.1.3".tokio_io}".default = true;
    tokio_reactor."${deps.tokio_tcp."0.1.3".tokio_reactor}".default = true;
    tokio_tcp."0.1.3".default = (f.tokio_tcp."0.1.3".default or true);
  }) [
    (features_.bytes."${deps."tokio_tcp"."0.1.3"."bytes"}" deps)
    (features_.futures."${deps."tokio_tcp"."0.1.3"."futures"}" deps)
    (features_.iovec."${deps."tokio_tcp"."0.1.3"."iovec"}" deps)
    (features_.mio."${deps."tokio_tcp"."0.1.3"."mio"}" deps)
    (features_.tokio_io."${deps."tokio_tcp"."0.1.3"."tokio_io"}" deps)
    (features_.tokio_reactor."${deps."tokio_tcp"."0.1.3"."tokio_reactor"}" deps)
  ];


# end
# tokio-threadpool-0.1.15

  crates.tokio_threadpool."0.1.15" = deps: { features?(features_.tokio_threadpool."0.1.15" deps {}) }: buildRustCrate {
    crateName = "tokio-threadpool";
    version = "0.1.15";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "07wsanfx01hjz6gr1pfbr8v0b3wwbnckc0z52svrkh5msy74wgrj";
    dependencies = mapFeatures features ([
      (crates."crossbeam_deque"."${deps."tokio_threadpool"."0.1.15"."crossbeam_deque"}" deps)
      (crates."crossbeam_queue"."${deps."tokio_threadpool"."0.1.15"."crossbeam_queue"}" deps)
      (crates."crossbeam_utils"."${deps."tokio_threadpool"."0.1.15"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_threadpool"."0.1.15"."futures"}" deps)
      (crates."log"."${deps."tokio_threadpool"."0.1.15"."log"}" deps)
      (crates."num_cpus"."${deps."tokio_threadpool"."0.1.15"."num_cpus"}" deps)
      (crates."rand"."${deps."tokio_threadpool"."0.1.15"."rand"}" deps)
      (crates."slab"."${deps."tokio_threadpool"."0.1.15"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_threadpool"."0.1.15"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_threadpool."0.1.15" = deps: f: updateFeatures f (rec {
    crossbeam_deque."${deps.tokio_threadpool."0.1.15".crossbeam_deque}".default = true;
    crossbeam_queue."${deps.tokio_threadpool."0.1.15".crossbeam_queue}".default = true;
    crossbeam_utils."${deps.tokio_threadpool."0.1.15".crossbeam_utils}".default = true;
    futures."${deps.tokio_threadpool."0.1.15".futures}".default = true;
    log."${deps.tokio_threadpool."0.1.15".log}".default = true;
    num_cpus."${deps.tokio_threadpool."0.1.15".num_cpus}".default = true;
    rand."${deps.tokio_threadpool."0.1.15".rand}".default = true;
    slab."${deps.tokio_threadpool."0.1.15".slab}".default = true;
    tokio_executor."${deps.tokio_threadpool."0.1.15".tokio_executor}".default = true;
    tokio_threadpool."0.1.15".default = (f.tokio_threadpool."0.1.15".default or true);
  }) [
    (features_.crossbeam_deque."${deps."tokio_threadpool"."0.1.15"."crossbeam_deque"}" deps)
    (features_.crossbeam_queue."${deps."tokio_threadpool"."0.1.15"."crossbeam_queue"}" deps)
    (features_.crossbeam_utils."${deps."tokio_threadpool"."0.1.15"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_threadpool"."0.1.15"."futures"}" deps)
    (features_.log."${deps."tokio_threadpool"."0.1.15"."log"}" deps)
    (features_.num_cpus."${deps."tokio_threadpool"."0.1.15"."num_cpus"}" deps)
    (features_.rand."${deps."tokio_threadpool"."0.1.15"."rand"}" deps)
    (features_.slab."${deps."tokio_threadpool"."0.1.15"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_threadpool"."0.1.15"."tokio_executor"}" deps)
  ];


# end
# tokio-timer-0.2.11

  crates.tokio_timer."0.2.11" = deps: { features?(features_.tokio_timer."0.2.11" deps {}) }: buildRustCrate {
    crateName = "tokio-timer";
    version = "0.2.11";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1g1np0mdhiwl52kxp543q9jdidf9vws403jh2nay3srlpnqhrkx9";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."tokio_timer"."0.2.11"."crossbeam_utils"}" deps)
      (crates."futures"."${deps."tokio_timer"."0.2.11"."futures"}" deps)
      (crates."slab"."${deps."tokio_timer"."0.2.11"."slab"}" deps)
      (crates."tokio_executor"."${deps."tokio_timer"."0.2.11"."tokio_executor"}" deps)
    ]);
  };
  features_.tokio_timer."0.2.11" = deps: f: updateFeatures f (rec {
    crossbeam_utils."${deps.tokio_timer."0.2.11".crossbeam_utils}".default = true;
    futures."${deps.tokio_timer."0.2.11".futures}".default = true;
    slab."${deps.tokio_timer."0.2.11".slab}".default = true;
    tokio_executor."${deps.tokio_timer."0.2.11".tokio_executor}".default = true;
    tokio_timer."0.2.11".default = (f.tokio_timer."0.2.11".default or true);
  }) [
    (features_.crossbeam_utils."${deps."tokio_timer"."0.2.11"."crossbeam_utils"}" deps)
    (features_.futures."${deps."tokio_timer"."0.2.11"."futures"}" deps)
    (features_.slab."${deps."tokio_timer"."0.2.11"."slab"}" deps)
    (features_.tokio_executor."${deps."tokio_timer"."0.2.11"."tokio_executor"}" deps)
  ];


# end
# toml-0.4.10

  crates.toml."0.4.10" = deps: { features?(features_.toml."0.4.10" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.4.10";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0fs4kxl86w3kmgwcgcv23nk79zagayz1spg281r83w0ywf88d6f1";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.4.10"."serde"}" deps)
    ]);
  };
  features_.toml."0.4.10" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.4.10".serde}".default = true;
    toml."0.4.10".default = (f.toml."0.4.10".default or true);
  }) [
    (features_.serde."${deps."toml"."0.4.10"."serde"}" deps)
  ];


# end
# toml-0.5.1

  crates.toml."0.5.1" = deps: { features?(features_.toml."0.5.1" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.5.1";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "1878ifdh576viwqg80vnhm51bng96vhyfi20jk8fv6wcifhgl4dg";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.5.1"."serde"}" deps)
    ]);
    features = mkFeatures (features."toml"."0.5.1" or {});
  };
  features_.toml."0.5.1" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.5.1".serde}".default = true;
    toml = fold recursiveUpdate {} [
      { "0.5.1".default = (f.toml."0.5.1".default or true); }
      { "0.5.1".linked-hash-map =
        (f.toml."0.5.1".linked-hash-map or false) ||
        (f.toml."0.5.1".preserve_order or false) ||
        (toml."0.5.1"."preserve_order" or false); }
    ];
  }) [
    (features_.serde."${deps."toml"."0.5.1"."serde"}" deps)
  ];


# end
# try-lock-0.2.2

  crates.try_lock."0.2.2" = deps: { features?(features_.try_lock."0.2.2" deps {}) }: buildRustCrate {
    crateName = "try-lock";
    version = "0.2.2";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1k8xc0jpbrmzp0fwghdh6pwzjb9xx2p8yy0xxnnb8065smc5fsrv";
  };
  features_.try_lock."0.2.2" = deps: f: updateFeatures f (rec {
    try_lock."0.2.2".default = (f.try_lock."0.2.2".default or true);
  }) [];


# end
# try_from-0.3.2

  crates.try_from."0.3.2" = deps: { features?(features_.try_from."0.3.2" deps {}) }: buildRustCrate {
    crateName = "try_from";
    version = "0.3.2";
    authors = [ "Derek Williams <derek@fyrie.net>" ];
    sha256 = "05jnndmiqz2sf8xsnf7ysaj3fpl3rhgzbfn1jx6casaahakrzald";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."try_from"."0.3.2"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."try_from"."0.3.2" or {});
  };
  features_.try_from."0.3.2" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.try_from."0.3.2".cfg_if}".default = true;
    try_from."0.3.2".default = (f.try_from."0.3.2".default or true);
  }) [
    (features_.cfg_if."${deps."try_from"."0.3.2"."cfg_if"}" deps)
  ];


# end
# typenum-1.10.0

  crates.typenum."1.10.0" = deps: { features?(features_.typenum."1.10.0" deps {}) }: buildRustCrate {
    crateName = "typenum";
    version = "1.10.0";
    authors = [ "Paho Lurie-Gregg <paho@paholg.com>" "Andre Bogus <bogusandre@gmail.com>" ];
    sha256 = "1v2cgg0mlzkg5prs7swysckgk2ay6bpda8m83c2sn3z77dcsx3bc";
    build = "build/main.rs";
    features = mkFeatures (features."typenum"."1.10.0" or {});
  };
  features_.typenum."1.10.0" = deps: f: updateFeatures f (rec {
    typenum."1.10.0".default = (f.typenum."1.10.0".default or true);
  }) [];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicase-1.4.2

  crates.unicase."1.4.2" = deps: { features?(features_.unicase."1.4.2" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "1.4.2";
    authors = [ "Sean McArthur <sean.monstar@gmail.com>" ];
    sha256 = "0rbnhw2mnhcwrij3vczp0sl8zdfmvf2dlh8hly81kj7132kfj0mf";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."unicase"."1.4.2"."version_check"}" deps)
    ]);
    features = mkFeatures (features."unicase"."1.4.2" or {});
  };
  features_.unicase."1.4.2" = deps: f: updateFeatures f (rec {
    unicase = fold recursiveUpdate {} [
      { "1.4.2".default = (f.unicase."1.4.2".default or true); }
      { "1.4.2".heapsize =
        (f.unicase."1.4.2".heapsize or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
      { "1.4.2".heapsize_plugin =
        (f.unicase."1.4.2".heapsize_plugin or false) ||
        (f.unicase."1.4.2".heap_size or false) ||
        (unicase."1.4.2"."heap_size" or false); }
    ];
    version_check."${deps.unicase."1.4.2".version_check}".default = true;
  }) [
    (features_.version_check."${deps."unicase"."1.4.2"."version_check"}" deps)
  ];


# end
# unicase-2.4.0

  crates.unicase."2.4.0" = deps: { features?(features_.unicase."2.4.0" deps {}) }: buildRustCrate {
    crateName = "unicase";
    version = "2.4.0";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "0f4ay81kfrvs0l2frpci367j3dmnd3jx1x3q5fismmr6a4546piz";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."unicase"."2.4.0"."version_check"}" deps)
    ]);
    features = mkFeatures (features."unicase"."2.4.0" or {});
  };
  features_.unicase."2.4.0" = deps: f: updateFeatures f (rec {
    unicase."2.4.0".default = (f.unicase."2.4.0".default or true);
    version_check."${deps.unicase."2.4.0".version_check}".default = true;
  }) [
    (features_.version_check."${deps."unicase"."2.4.0"."version_check"}" deps)
  ];


# end
# unicode-bidi-0.3.4

  crates.unicode_bidi."0.3.4" = deps: { features?(features_.unicode_bidi."0.3.4" deps {}) }: buildRustCrate {
    crateName = "unicode-bidi";
    version = "0.3.4";
    authors = [ "The Servo Project Developers" ];
    sha256 = "0lcd6jasrf8p9p0q20qyf10c6xhvw40m2c4rr105hbk6zy26nj1q";
    libName = "unicode_bidi";
    dependencies = mapFeatures features ([
      (crates."matches"."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
    ]);
    features = mkFeatures (features."unicode_bidi"."0.3.4" or {});
  };
  features_.unicode_bidi."0.3.4" = deps: f: updateFeatures f (rec {
    matches."${deps.unicode_bidi."0.3.4".matches}".default = true;
    unicode_bidi = fold recursiveUpdate {} [
      { "0.3.4".default = (f.unicode_bidi."0.3.4".default or true); }
      { "0.3.4".flame =
        (f.unicode_bidi."0.3.4".flame or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4".flamer =
        (f.unicode_bidi."0.3.4".flamer or false) ||
        (f.unicode_bidi."0.3.4".flame_it or false) ||
        (unicode_bidi."0.3.4"."flame_it" or false); }
      { "0.3.4".serde =
        (f.unicode_bidi."0.3.4".serde or false) ||
        (f.unicode_bidi."0.3.4".with_serde or false) ||
        (unicode_bidi."0.3.4"."with_serde" or false); }
    ];
  }) [
    (features_.matches."${deps."unicode_bidi"."0.3.4"."matches"}" deps)
  ];


# end
# unicode-normalization-0.1.8

  crates.unicode_normalization."0.1.8" = deps: { features?(features_.unicode_normalization."0.1.8" deps {}) }: buildRustCrate {
    crateName = "unicode-normalization";
    version = "0.1.8";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "1pb26i2xd5zz0icabyqahikpca0iwj2jd4145pczc4bb7p641dsz";
    dependencies = mapFeatures features ([
      (crates."smallvec"."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
    ]);
  };
  features_.unicode_normalization."0.1.8" = deps: f: updateFeatures f (rec {
    smallvec."${deps.unicode_normalization."0.1.8".smallvec}".default = true;
    unicode_normalization."0.1.8".default = (f.unicode_normalization."0.1.8".default or true);
  }) [
    (features_.smallvec."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
  ];


# end
# unicode-segmentation-1.3.0

  crates.unicode_segmentation."1.3.0" = deps: { features?(features_.unicode_segmentation."1.3.0" deps {}) }: buildRustCrate {
    crateName = "unicode-segmentation";
    version = "1.3.0";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0jnns99wpjjpqzdn9jiplsr003rr41i95c008jb4inccb3avypp0";
    features = mkFeatures (features."unicode_segmentation"."1.3.0" or {});
  };
  features_.unicode_segmentation."1.3.0" = deps: f: updateFeatures f (rec {
    unicode_segmentation."1.3.0".default = (f.unicode_segmentation."1.3.0".default or true);
  }) [];


# end
# unicode-width-0.1.5

  crates.unicode_width."0.1.5" = deps: { features?(features_.unicode_width."0.1.5" deps {}) }: buildRustCrate {
    crateName = "unicode-width";
    version = "0.1.5";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0886lc2aymwgy0lhavwn6s48ik3c61ykzzd3za6prgnw51j7bi4w";
    features = mkFeatures (features."unicode_width"."0.1.5" or {});
  };
  features_.unicode_width."0.1.5" = deps: f: updateFeatures f (rec {
    unicode_width."0.1.5".default = (f.unicode_width."0.1.5".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# untrusted-0.6.2

  crates.untrusted."0.6.2" = deps: { features?(features_.untrusted."0.6.2" deps {}) }: buildRustCrate {
    crateName = "untrusted";
    version = "0.6.2";
    authors = [ "Brian Smith <brian@briansmith.org>" ];
    sha256 = "189ir1h2xgb290bhjchwczr9ygia1f3ipsydf6pwnnb95lb8fihg";
    libPath = "src/untrusted.rs";
  };
  features_.untrusted."0.6.2" = deps: f: updateFeatures f (rec {
    untrusted."0.6.2".default = (f.untrusted."0.6.2".default or true);
  }) [];


# end
# url-1.7.2

  crates.url."1.7.2" = deps: { features?(features_.url."1.7.2" deps {}) }: buildRustCrate {
    crateName = "url";
    version = "1.7.2";
    authors = [ "The rust-url developers" ];
    sha256 = "0qzrjzd9r1niv7037x4cgnv98fs1vj0k18lpxx890ipc47x5gc09";
    dependencies = mapFeatures features ([
      (crates."idna"."${deps."url"."1.7.2"."idna"}" deps)
      (crates."matches"."${deps."url"."1.7.2"."matches"}" deps)
      (crates."percent_encoding"."${deps."url"."1.7.2"."percent_encoding"}" deps)
    ]);
    features = mkFeatures (features."url"."1.7.2" or {});
  };
  features_.url."1.7.2" = deps: f: updateFeatures f (rec {
    idna."${deps.url."1.7.2".idna}".default = true;
    matches."${deps.url."1.7.2".matches}".default = true;
    percent_encoding."${deps.url."1.7.2".percent_encoding}".default = true;
    url = fold recursiveUpdate {} [
      { "1.7.2".default = (f.url."1.7.2".default or true); }
      { "1.7.2".encoding =
        (f.url."1.7.2".encoding or false) ||
        (f.url."1.7.2".query_encoding or false) ||
        (url."1.7.2"."query_encoding" or false); }
      { "1.7.2".heapsize =
        (f.url."1.7.2".heapsize or false) ||
        (f.url."1.7.2".heap_size or false) ||
        (url."1.7.2"."heap_size" or false); }
    ];
  }) [
    (features_.idna."${deps."url"."1.7.2"."idna"}" deps)
    (features_.matches."${deps."url"."1.7.2"."matches"}" deps)
    (features_.percent_encoding."${deps."url"."1.7.2"."percent_encoding"}" deps)
  ];


# end
# utf8-ranges-1.0.3

  crates.utf8_ranges."1.0.3" = deps: { features?(features_.utf8_ranges."1.0.3" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.3";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0nkh73y241czrxagm77qz20qcfn3h54a6v9cpvc7wjzwkaaqkswp";
  };
  features_.utf8_ranges."1.0.3" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.3".default = (f.utf8_ranges."1.0.3".default or true);
  }) [];


# end
# uuid-0.7.4

  crates.uuid."0.7.4" = deps: { features?(features_.uuid."0.7.4" deps {}) }: buildRustCrate {
    crateName = "uuid";
    version = "0.7.4";
    authors = [ "Ashley Mannix<ashleymannix@live.com.au>" "Christopher Armstrong" "Dylan DPC<dylan.dpc@gmail.com>" "Hunar Roop Kahlon<hunar.roop@gmail.com>" ];
    sha256 = "1kzjah6i8vf51hrla6qnplymaqx2fadhhlnbvgivgld311lqyz9m";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.uuid."0.7.4".rand or false then [ (crates.rand."${deps."uuid"."0.7.4".rand}" deps) ] else []))
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."uuid"."0.7.4" or {});
  };
  features_.uuid."0.7.4" = deps: f: updateFeatures f (rec {
    rand = fold recursiveUpdate {} [
      { "${deps.uuid."0.7.4".rand}"."stdweb" =
        (f.rand."${deps.uuid."0.7.4".rand}"."stdweb" or false) ||
        (uuid."0.7.4"."stdweb" or false) ||
        (f."uuid"."0.7.4"."stdweb" or false); }
      { "${deps.uuid."0.7.4".rand}"."wasm-bindgen" =
        (f.rand."${deps.uuid."0.7.4".rand}"."wasm-bindgen" or false) ||
        (uuid."0.7.4"."wasm-bindgen" or false) ||
        (f."uuid"."0.7.4"."wasm-bindgen" or false); }
      { "${deps.uuid."0.7.4".rand}".default = true; }
    ];
    uuid = fold recursiveUpdate {} [
      { "0.7.4".byteorder =
        (f.uuid."0.7.4".byteorder or false) ||
        (f.uuid."0.7.4".u128 or false) ||
        (uuid."0.7.4"."u128" or false); }
      { "0.7.4".default = (f.uuid."0.7.4".default or true); }
      { "0.7.4".md5 =
        (f.uuid."0.7.4".md5 or false) ||
        (f.uuid."0.7.4".v3 or false) ||
        (uuid."0.7.4"."v3" or false); }
      { "0.7.4".nightly =
        (f.uuid."0.7.4".nightly or false) ||
        (f.uuid."0.7.4".const_fn or false) ||
        (uuid."0.7.4"."const_fn" or false); }
      { "0.7.4".rand =
        (f.uuid."0.7.4".rand or false) ||
        (f.uuid."0.7.4".v4 or false) ||
        (uuid."0.7.4"."v4" or false); }
      { "0.7.4".sha1 =
        (f.uuid."0.7.4".sha1 or false) ||
        (f.uuid."0.7.4".v5 or false) ||
        (uuid."0.7.4"."v5" or false); }
      { "0.7.4".std =
        (f.uuid."0.7.4".std or false) ||
        (f.uuid."0.7.4".default or false) ||
        (uuid."0.7.4"."default" or false); }
      { "0.7.4".winapi =
        (f.uuid."0.7.4".winapi or false) ||
        (f.uuid."0.7.4".guid or false) ||
        (uuid."0.7.4"."guid" or false); }
    ];
  }) [
    (features_.rand."${deps."uuid"."0.7.4"."rand"}" deps)
  ];


# end
# vec_map-0.8.1

  crates.vec_map."0.8.1" = deps: { features?(features_.vec_map."0.8.1" deps {}) }: buildRustCrate {
    crateName = "vec_map";
    version = "0.8.1";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Jorge Aparicio <japaricious@gmail.com>" "Alexis Beingessner <a.beingessner@gmail.com>" "Brian Anderson <>" "tbu- <>" "Manish Goregaokar <>" "Aaron Turon <aturon@mozilla.com>" "Adolfo Ochagavía <>" "Niko Matsakis <>" "Steven Fackler <>" "Chase Southwood <csouth3@illinois.edu>" "Eduard Burtescu <>" "Florian Wilkens <>" "Félix Raimundo <>" "Tibor Benke <>" "Markus Siemens <markus@m-siemens.de>" "Josh Branchaud <jbranchaud@gmail.com>" "Huon Wilson <dbau.pp@gmail.com>" "Corey Farwell <coref@rwell.org>" "Aaron Liblong <>" "Nick Cameron <nrc@ncameron.org>" "Patrick Walton <pcwalton@mimiga.net>" "Felix S Klock II <>" "Andrew Paseltiner <apaseltiner@gmail.com>" "Sean McArthur <sean.monstar@gmail.com>" "Vadim Petrochenkov <>" ];
    sha256 = "1jj2nrg8h3l53d43rwkpkikq5a5x15ms4rf1rw92hp5lrqhi8mpi";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."vec_map"."0.8.1" or {});
  };
  features_.vec_map."0.8.1" = deps: f: updateFeatures f (rec {
    vec_map = fold recursiveUpdate {} [
      { "0.8.1".default = (f.vec_map."0.8.1".default or true); }
      { "0.8.1".serde =
        (f.vec_map."0.8.1".serde or false) ||
        (f.vec_map."0.8.1".eders or false) ||
        (vec_map."0.8.1"."eders" or false); }
    ];
  }) [];


# end
# version_check-0.1.5

  crates.version_check."0.1.5" = deps: { features?(features_.version_check."0.1.5" deps {}) }: buildRustCrate {
    crateName = "version_check";
    version = "0.1.5";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1yrx9xblmwbafw2firxyqbj8f771kkzfd24n3q7xgwiqyhi0y8qd";
  };
  features_.version_check."0.1.5" = deps: f: updateFeatures f (rec {
    version_check."0.1.5".default = (f.version_check."0.1.5".default or true);
  }) [];


# end
# walkdir-2.2.8

  crates.walkdir."2.2.8" = deps: { features?(features_.walkdir."2.2.8" deps {}) }: buildRustCrate {
    crateName = "walkdir";
    version = "2.2.8";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "09p70x6lxcf2n1hq2ay8srdvhixhc08k2jkl9ms9n4vdqbildwfl";
    dependencies = mapFeatures features ([
      (crates."same_file"."${deps."walkdir"."2.2.8"."same_file"}" deps)
    ])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."walkdir"."2.2.8"."winapi"}" deps)
      (crates."winapi_util"."${deps."walkdir"."2.2.8"."winapi_util"}" deps)
    ]) else []);
  };
  features_.walkdir."2.2.8" = deps: f: updateFeatures f (rec {
    same_file."${deps.walkdir."2.2.8".same_file}".default = true;
    walkdir."2.2.8".default = (f.walkdir."2.2.8".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.walkdir."2.2.8".winapi}"."std" = true; }
      { "${deps.walkdir."2.2.8".winapi}"."winnt" = true; }
      { "${deps.walkdir."2.2.8".winapi}".default = true; }
    ];
    winapi_util."${deps.walkdir."2.2.8".winapi_util}".default = true;
  }) [
    (features_.same_file."${deps."walkdir"."2.2.8"."same_file"}" deps)
    (features_.winapi."${deps."walkdir"."2.2.8"."winapi"}" deps)
    (features_.winapi_util."${deps."walkdir"."2.2.8"."winapi_util"}" deps)
  ];


# end
# want-0.2.0

  crates.want."0.2.0" = deps: { features?(features_.want."0.2.0" deps {}) }: buildRustCrate {
    crateName = "want";
    version = "0.2.0";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1qyd7cixai7f58zfbz8v3lg52q7p6805b9vw7vblw1pysg6vnrxb";
    dependencies = mapFeatures features ([
      (crates."futures"."${deps."want"."0.2.0"."futures"}" deps)
      (crates."log"."${deps."want"."0.2.0"."log"}" deps)
      (crates."try_lock"."${deps."want"."0.2.0"."try_lock"}" deps)
    ]);
  };
  features_.want."0.2.0" = deps: f: updateFeatures f (rec {
    futures."${deps.want."0.2.0".futures}".default = true;
    log."${deps.want."0.2.0".log}".default = true;
    try_lock."${deps.want."0.2.0".try_lock}".default = true;
    want."0.2.0".default = (f.want."0.2.0".default or true);
  }) [
    (features_.futures."${deps."want"."0.2.0"."futures"}" deps)
    (features_.log."${deps."want"."0.2.0"."log"}" deps)
    (features_.try_lock."${deps."want"."0.2.0"."try_lock"}" deps)
  ];


# end
# webpki-0.19.1

  crates.webpki."0.19.1" = deps: { features?(features_.webpki."0.19.1" deps {}) }: buildRustCrate {
    crateName = "webpki";
    version = "0.19.1";
    authors = [ "Brian Smith <brian@briansmith.org>" ];
    sha256 = "0wcalza4w141gc76nf7lc6pgz22in6scpgqb5v80lmxray1sx06b";
    libPath = "src/webpki.rs";
    dependencies = mapFeatures features ([
      (crates."ring"."${deps."webpki"."0.19.1"."ring"}" deps)
      (crates."untrusted"."${deps."webpki"."0.19.1"."untrusted"}" deps)
    ]);
    features = mkFeatures (features."webpki"."0.19.1" or {});
  };
  features_.webpki."0.19.1" = deps: f: updateFeatures f (rec {
    ring."${deps.webpki."0.19.1".ring}".default = true;
    untrusted."${deps.webpki."0.19.1".untrusted}".default = true;
    webpki = fold recursiveUpdate {} [
      { "0.19.1".default = (f.webpki."0.19.1".default or true); }
      { "0.19.1".std =
        (f.webpki."0.19.1".std or false) ||
        (f.webpki."0.19.1".default or false) ||
        (webpki."0.19.1"."default" or false) ||
        (f.webpki."0.19.1".trust_anchor_util or false) ||
        (webpki."0.19.1"."trust_anchor_util" or false); }
      { "0.19.1".trust_anchor_util =
        (f.webpki."0.19.1".trust_anchor_util or false) ||
        (f.webpki."0.19.1".default or false) ||
        (webpki."0.19.1"."default" or false); }
    ];
  }) [
    (features_.ring."${deps."webpki"."0.19.1"."ring"}" deps)
    (features_.untrusted."${deps."webpki"."0.19.1"."untrusted"}" deps)
  ];


# end
# webpki-roots-0.16.0

  crates.webpki_roots."0.16.0" = deps: { features?(features_.webpki_roots."0.16.0" deps {}) }: buildRustCrate {
    crateName = "webpki-roots";
    version = "0.16.0";
    authors = [ "Joseph Birr-Pixton <jpixton@gmail.com>" ];
    edition = "2018";
    sha256 = "06qixlbrzzs636h48kv2r018r0hi4cfqkcxnw27vr9vlmpx4cjiw";
    dependencies = mapFeatures features ([
      (crates."untrusted"."${deps."webpki_roots"."0.16.0"."untrusted"}" deps)
      (crates."webpki"."${deps."webpki_roots"."0.16.0"."webpki"}" deps)
    ]);
  };
  features_.webpki_roots."0.16.0" = deps: f: updateFeatures f (rec {
    untrusted."${deps.webpki_roots."0.16.0".untrusted}".default = true;
    webpki."${deps.webpki_roots."0.16.0".webpki}".default = true;
    webpki_roots."0.16.0".default = (f.webpki_roots."0.16.0".default or true);
  }) [
    (features_.untrusted."${deps."webpki_roots"."0.16.0"."untrusted"}" deps)
    (features_.webpki."${deps."webpki_roots"."0.16.0"."webpki"}" deps)
  ];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
  }) [];


# end
# winapi-0.3.7

  crates.winapi."0.3.7" = deps: { features?(features_.winapi."0.3.7" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.7";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1k51gfkp0zqw7nj07y443mscs46icmdhld442s2073niap0kkdr8";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.7" or {});
  };
  features_.winapi."0.3.7" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "0.3.7".default = (f.winapi."0.3.7".default or true); }
      { "0.3.7".impl-debug =
        (f.winapi."0.3.7".impl-debug or false) ||
        (f.winapi."0.3.7".debug or false) ||
        (winapi."0.3.7"."debug" or false); }
    ];
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.7".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.7".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_.winapi_build."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-util-0.1.2

  crates.winapi_util."0.1.2" = deps: { features?(features_.winapi_util."0.1.2" deps {}) }: buildRustCrate {
    crateName = "winapi-util";
    version = "0.1.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "07jj7rg7nndd7bqhjin1xphbv8kb5clvhzpqpxkvm3wl84r3mj1h";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."winapi_util"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.winapi_util."0.1.2" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.winapi_util."0.1.2".winapi}"."consoleapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."errhandlingapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."fileapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."minwindef" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."processenv" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."std" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winbase" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."wincon" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winerror" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winnt" = true; }
      { "${deps.winapi_util."0.1.2".winapi}".default = true; }
    ];
    winapi_util."0.1.2".default = (f.winapi_util."0.1.2".default or true);
  }) [
    (features_.winapi."${deps."winapi_util"."0.1.2"."winapi"}" deps)
  ];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# wincolor-1.0.1

  crates.wincolor."1.0.1" = deps: { features?(features_.wincolor."1.0.1" deps {}) }: buildRustCrate {
    crateName = "wincolor";
    version = "1.0.1";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0gr7v4krmjba7yq16071rfacz42qbapas7mxk5nphjwb042a8gvz";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."wincolor"."1.0.1"."winapi"}" deps)
      (crates."winapi_util"."${deps."wincolor"."1.0.1"."winapi_util"}" deps)
    ]);
  };
  features_.wincolor."1.0.1" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.wincolor."1.0.1".winapi}"."minwindef" = true; }
      { "${deps.wincolor."1.0.1".winapi}"."wincon" = true; }
      { "${deps.wincolor."1.0.1".winapi}".default = true; }
    ];
    winapi_util."${deps.wincolor."1.0.1".winapi_util}".default = true;
    wincolor."1.0.1".default = (f.wincolor."1.0.1".default or true);
  }) [
    (features_.winapi."${deps."wincolor"."1.0.1"."winapi"}" deps)
    (features_.winapi_util."${deps."wincolor"."1.0.1"."winapi_util"}" deps)
  ];


# end
# ws2_32-sys-0.2.1

  crates.ws2_32_sys."0.2.1" = deps: { features?(features_.ws2_32_sys."0.2.1" deps {}) }: buildRustCrate {
    crateName = "ws2_32-sys";
    version = "0.2.1";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1zpy9d9wk11sj17fczfngcj28w4xxjs3b4n036yzpy38dxp4f7kc";
    libName = "ws2_32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
    ]);
  };
  features_.ws2_32_sys."0.2.1" = deps: f: updateFeatures f (rec {
    winapi."${deps.ws2_32_sys."0.2.1".winapi}".default = true;
    winapi_build."${deps.ws2_32_sys."0.2.1".winapi_build}".default = true;
    ws2_32_sys."0.2.1".default = (f.ws2_32_sys."0.2.1".default or true);
  }) [
    (features_.winapi."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    (features_.winapi_build."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
  ];


# end
# xattr-0.2.2

  crates.xattr."0.2.2" = deps: { features?(features_.xattr."0.2.2" deps {}) }: buildRustCrate {
    crateName = "xattr";
    version = "0.2.2";
    authors = [ "Steven Allen <steven@stebalien.com>" ];
    sha256 = "01zqnn6bhrd58hvpj3y1nqnbmlswrvsdapn2zbi7h1bh5lspiyk5";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."xattr"."0.2.2"."libc"}" deps)
    ]);
    features = mkFeatures (features."xattr"."0.2.2" or {});
  };
  features_.xattr."0.2.2" = deps: f: updateFeatures f (rec {
    libc."${deps.xattr."0.2.2".libc}".default = true;
    xattr = fold recursiveUpdate {} [
      { "0.2.2".default = (f.xattr."0.2.2".default or true); }
      { "0.2.2".unsupported =
        (f.xattr."0.2.2".unsupported or false) ||
        (f.xattr."0.2.2".default or false) ||
        (xattr."0.2.2"."default" or false); }
    ];
  }) [
    (features_.libc."${deps."xattr"."0.2.2"."libc"}" deps)
  ];


# end
# zip-0.5.2

  crates.zip."0.5.2" = deps: { features?(features_.zip."0.5.2" deps {}) }: buildRustCrate {
    crateName = "zip";
    version = "0.5.2";
    authors = [ "Mathijs van de Nes <git@mathijs.vd-nes.nl>" ];
    sha256 = "0iizhcihsr44awwsjacrb1qmmdz2dls3zh3iy5gljn726yza5hml";
    dependencies = mapFeatures features ([
      (crates."crc32fast"."${deps."zip"."0.5.2"."crc32fast"}" deps)
      (crates."podio"."${deps."zip"."0.5.2"."podio"}" deps)
    ]
      ++ (if features.zip."0.5.2".bzip2 or false then [ (crates.bzip2."${deps."zip"."0.5.2".bzip2}" deps) ] else [])
      ++ (if features.zip."0.5.2".libflate or false then [ (crates.libflate."${deps."zip"."0.5.2".libflate}" deps) ] else [])
      ++ (if features.zip."0.5.2".time or false then [ (crates.time."${deps."zip"."0.5.2".time}" deps) ] else []));
    features = mkFeatures (features."zip"."0.5.2" or {});
  };
  features_.zip."0.5.2" = deps: f: updateFeatures f (rec {
    bzip2."${deps.zip."0.5.2".bzip2}".default = true;
    crc32fast."${deps.zip."0.5.2".crc32fast}".default = true;
    libflate."${deps.zip."0.5.2".libflate}".default = true;
    podio."${deps.zip."0.5.2".podio}".default = true;
    time."${deps.zip."0.5.2".time}".default = true;
    zip = fold recursiveUpdate {} [
      { "0.5.2".bzip2 =
        (f.zip."0.5.2".bzip2 or false) ||
        (f.zip."0.5.2".default or false) ||
        (zip."0.5.2"."default" or false); }
      { "0.5.2".default = (f.zip."0.5.2".default or true); }
      { "0.5.2".deflate =
        (f.zip."0.5.2".deflate or false) ||
        (f.zip."0.5.2".default or false) ||
        (zip."0.5.2"."default" or false); }
      { "0.5.2".libflate =
        (f.zip."0.5.2".libflate or false) ||
        (f.zip."0.5.2".deflate or false) ||
        (zip."0.5.2"."deflate" or false); }
      { "0.5.2".time =
        (f.zip."0.5.2".time or false) ||
        (f.zip."0.5.2".default or false) ||
        (zip."0.5.2"."default" or false); }
    ];
  }) [
    (features_.bzip2."${deps."zip"."0.5.2"."bzip2"}" deps)
    (features_.crc32fast."${deps."zip"."0.5.2"."crc32fast"}" deps)
    (features_.libflate."${deps."zip"."0.5.2"."libflate"}" deps)
    (features_.podio."${deps."zip"."0.5.2"."podio"}" deps)
    (features_.time."${deps."zip"."0.5.2"."time"}" deps)
  ];


# end
}
