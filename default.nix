let
pkgs = let
  hostPkgs = import <nixpkgs> {};
  pinnedPkgs = hostPkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs-channels";
    rev = "00335098a5cde0b221db83e555019a251d3d40f9";
    sha256 = "0nsrp0ardrimac64qsqy5rymvychzzkwripgrw8g9gvfa5kgv3xr";
  };
in import pinnedPkgs {};

envname = "luispedro_org";
jenv = pkgs.bundlerEnv {
  name = "jekyll_rbst_env";
  gemset = ./gemset.nix;
  gemfile = ./Gemfile;
  lockfile = ./Gemfile.lock;
 };

py27 = pkgs.python27.withPackages (pp: [
      pp.docutils
      pp.pygments
      pp.awscli
      ]);

in
pkgs.stdenv.mkDerivation {
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

