---
title: luish
categories: software rust
meta: luish is a shell for Linux, written in Rust. It runs scripts as fast as dash, is as full-featured as zsh interactively, and has a modern plugin architecture
---

A dedicated page with documentation is available at
[https://luish.rtfd.io](https://luish.readthedocs.io/en/latest/). This page is
just a summary.

# luish: a shell for Linux, written in Rust

luish is intended to replace zsh or bash as your interactive shell, while being
very very fast and more modern.


## Highlights

- **As fast as dash, with zsh's features.** Scripts run as fast as under dash
  ([benchmarks](https://luish.readthedocs.io/en/latest/performance.html)),
  while interactive use is intended to be as full-featured as zsh.
- **A modern plugin architecture.** Plugins can include shell scripts and
  extensions written in [Rhai](https://rhai.rs) (a small embedded language) for
  hooks, prompt variables, Tab completion, and commands. They can be
  automatically fetched from github and pinned to specific versions. This is
  builtin functionality.
- **bash's and zsh's scripting extensions.** Arrays and associative arrays,
  `[[ ... ]]`, `${x/pattern/replacement}`, `typeset`, zsh's parameter flags,
  and `pipefail` work in scripts and interactively.
- **Instant startup through caching.** luish caches the *effect* of your
    startup files. A new shell starts instantaneously, even if you are using
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

To configure many machines, you can use a [personal
plugin](https://luish.readthedocs.io/en/latest/personal-plugin.html) posted to
github or on a shared drive (Dropbox, for example). This allows you to keep
your configuration in a single place, and have it automatically fetched and
enabled on every machine you use while having machine-specific configuration
run on top of it.

Since plugins can depend on other plugins, your personal plugin can enable a
set of plugins that you use, and they will be automatically fetched and
enabled.

## Where can I get it?

Releases have binaries for Linux on x86\_64 and aarch64. The install script
picks the right one and puts it in `~/.local/bin`:

    curl -fsSL https://raw.githubusercontent.com/luispedro/luish/main/install.sh | sh

See the [installation
instructions](https://luish.readthedocs.io/en/latest/installation.html) for
other options. The source is on
[github](https://github.com/luispedro/luish).

License: MIT.
