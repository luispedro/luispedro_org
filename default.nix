let
pkgs = let
  hostPkgs = import <nixpkgs> {};
  pinnedPkgs = hostPkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs-channels";
    rev = "c9e13806267f7fd3351d52a19cc6db5fa2985ca9";
    sha256 = "0qsa3j4i2ndiw4yxla3y4i5f8r12waj34h2z84xjig4l54cx184q";
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
      ]);

in
pkgs.stdenv.mkDerivation {
  name = "luispedro_org";

  buildInputs = with pkgs; [
    jenv
    bundler
    zsh
    py27
    awscli
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

