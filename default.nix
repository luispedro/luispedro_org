with import ../nixpkgs/pkgs/top-level/all-packages.nix {};

let

envname = "luispedro_org";
jenv = bundlerEnv {
  name = "jekyll_rbst_env";
  gemset = ./gemset.nix;
  gemfile = ./Gemfile;
  lockfile = ./Gemfile.lock;
 };

in
stdenv.mkDerivation {
  name = "luispedro_org";

  buildInputs = with pkgs; [
    jenv
    bundler
    zsh
    python
    python27Packages.docutils
    python27Packages.pygments
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

