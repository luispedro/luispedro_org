with import <nixpkgs> {};

let

envname = "luispedro_org";
jenv = bundlerEnv {
  name = "jekyll_rbst_env";
  gemset = ./gemset.nix;
  gemfile = ./Gemfile;
  lockfile = ./Gemfile.lock;
 };

py27 = python27.withPackages (pp: [
      pp.docutils
      pp.pygments
      pp.awscli
      ]);

in
stdenv.mkDerivation {
  name = "luispedro_org";

  buildInputs = with pkgs; [
    jenv
    bundler
    zsh
    py27
    python3
    glibcLocales
  ];
  # When used as `nix-shell --pure`
  shellHook = ''
  export LC_ALL='en_US.UTF-8'
  export NIX_ENV="[${envname}] "
  '';
  # used when building environments
  extraCmds = ''
  export LC_ALL='en_US.UTF-8'
  export NIX_ENV="[${envname}] "
  '';

 }

