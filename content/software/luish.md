---
title: luish
categories: software rust
meta: luish is a shell for Linux, written in Rust. It runs scripts as fast as dash, is as full-featured as zsh interactively, and has a modern plugin architecture
---

A dedicated page with documentation is available at
[https://luish.rtfd.io](https://luish.readthedocs.io/en/latest/). This page is
just a summary.

# luish: a shell for Linux, written in Rust

luish can replace zsh or bash as your interactive shell, and dash or bash as
the shell that runs scripts. It is fast, and full featured: tab completion,
history, line editing, globbing, and a modern plugin architecture.

## Highlights

- **As fast as dash, with zsh's features.** Scripts run as fast as under dash
  ([benchmarks](https://luish.readthedocs.io/en/latest/performance.html)),
  while interactive use is intended to be as full-featured as zsh.
- **A modern plugin architecture.** Plugins package configuration and shell
  files, and can include an extension written in [Rhai](https://rhai.rs) (a
  small embedded language) for hooks, prompt variables, Tab completion, and
  commands. They can be automatically fetched from github or other git
  repositories and pinned to specific commits.
- **bash's and zsh's scripting extensions.** Arrays and associative arrays,
  `[[ ... ]]`, `${x/pattern/replacement}`, `typeset`, zsh's parameter flags,
  and `pipefail` work in scripts and interactively, without slowing down
  scripts that don't use them.
- **Instant startup through caching.** luish caches the *effect* of your
  startup files, so a new shell starts in under 20ms, even if you are using
  `conda`, `nvm` and the like (which can take several seconds in a normal
  shell).
- **Modern configuration.** Options, aliases, and plugins are set in a
  [TOML](https://toml.io) file (`~/.config/luish/config.toml`), with options
  grouped in meaningful categories.

## Short Example

Start luish with:

    luish                             # an interactive shell
    luish script.sh                   # run a script, as sh script.sh does

and configure it in `~/.config/luish/config.toml`:

    [options.history]
    file = "~/.histfile"
    share = true

    [alias]
    ll = "ls -l"

    [plugins.enabled]
    std.completion = "*"         # completion for common commands, and git

Plugins can also set options, so you can keep a [personal
plugin](https://luish.readthedocs.io/en/latest/personal-plugin.html) on github
with your favorite options, aliases, plugins, and functions, and enable it on
every machine you use.

## Where can I get it?

Releases have binaries for Linux on x86\_64 and aarch64. The install script
picks the right one and puts it in `~/.local/bin`:

    curl -fsSL https://raw.githubusercontent.com/luispedro/luish/main/install.sh | sh

See the [installation
instructions](https://luish.readthedocs.io/en/latest/installation.html) for
other options. The source is on
[github](https://github.com/luispedro/luish).

License: MIT.
