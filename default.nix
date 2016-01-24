#!/usr/bin/env nix-shell

with import ../nixpkgs/pkgs/top-level/all-packages.nix {};

let
  envname = "luispedro_org";
in

stdenv.mkDerivation { 
  name = "${envname}-env";
  buildInputs = [
    zsh
    ruby
    bundler
    python
    python27Packages.docutils
    python27Packages.pygments
    glibcLocales
  ];
  src = null;
  # When used as `nix-shell --pure`
  shellHook = ''
  export LC_ALL='en_US.UTF-8'
  export GEM_PATH=$HOME/.gem/ruby/2.2.0/:$PWD/jekyll/vendor/bundle/ruby/2.2.0/:$GEM_PATH

  export NIX_ENV="[${envname}] "
  exec zsh
  '';
  # used when building environments
  extraCmds = ''
  export LC_ALL='en_US.UTF-8'
  export GEM_PATH=$HOME/.gem/ruby/2.2.0/:$PWD/jekyll/vendor/bundle/ruby/2.2.0/:$GEM_PATH
  export NIX_ENV="[${envname}] "
  '';
}

