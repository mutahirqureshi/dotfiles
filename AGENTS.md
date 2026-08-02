# AGENTS.md

## Repo type

Dotfiles repo managed by chezmoi with chezmoi external for prezto.

## Setup

```bash
cd ~ && git clone <repo url> dotfiles && cd dotfiles
chezmoi init --apply --refresh-externals --source .
```

- chezmoi config lives at `~/.config/chezmoi/chezmoi.toml` (not in the repo).
- Chezmoi external repos are downloaded during `chezmoi apply --refresh-externals` (see `.chezmoiexternal.toml`).
- vim-plug auto-bootstraps on first vim open — no manual install step needed.

## How chezmoi manages files

This repo IS the chezmoi source directory (`sourceDir` in chezmoi.toml).
Files in the repo map to $HOME paths using chezmoi's `dot_` prefix convention:
- `dot_profile` → `~/.profile`
- `dot_bashrc` → `~/.bashrc`
- `dot_bash_profile` → `~/.bash_profile`
- `dot_aliases` → `~/.aliases`
- `dot_gitconfig.tmpl` → `~/.gitconfig` (Go template for platform-conditional credentials)
- `dot_gitignore_global` → `~/.gitignore_global`
- `dot_vimrc` → `~/.vimrc` (includes vim-plug bootstrap)
- `dot_tmux.conf` → `~/.tmux.conf`
- `dot_zshrc` → `~/.zshrc` (sources prezto, aliases, fzf, direnv)
- `dot_zshenv` → `~/.zshenv`
- `dot_zprofile` → `~/.zprofile` (loads ~/.profile, sets editors/paths)
- `dot_zlogin` → `~/.zlogin`
- `dot_zlogout` → `~/.zlogout`
- `dot_zpreztorc` → `~/.zpreztorc` (prezto module config)
- `dot_config/kitty/kitty.conf` → `~/.config/kitty/kitty.conf`
- `dot_config/sway/config` → `~/.config/sway/config` (Linux only)
- `dot_config/karabiner/assets/complex_modifications/*.json` → `~/.config/karabiner/assets/complex_modifications/*.json` (macOS only)

Platform-specific content is handled via Go templates in `.chezmoiignore` and `run_` scripts at the root of the source directory.

## Platform differences

- **macOS**: karabiner assets (in .config/karabiner), Rectangle config, CapsLock JSON config
- **Linux**: keyd config copied to `/etc/keyd/default.conf` (requires sudo)

## Key subdirectories

| Directory | Purpose | Status |
|-----------|---------|--------|
| `android_studio/` | Android Studio config | Ignored by chezmoi (in `.chezmoiignore`) |
| `rectangle/` | macOS Rectangle window management config | Ignored by chezmoi, not yet wired to a run script |
| `keyd/` | Linux key remapping config | Ignored by chezmoi, installed via `run_pre_keyd.sh` |

## Chezmoi external repos

Prezto is managed as an external repo (`.chezmoiexternal.toml`) and downloaded during `chezmoi apply --refresh-externals`.

## chezmoi run scripts

Files at the root of the source directory with `run_` prefix are executed by chezmoi on applies:

| Script | Runs | Description |
|--------|------|-------------|
| `run_after_update-prezto-submodules.sh` | after apply | Recursively syncs prezto submodules after external is cloned |
| `run_pre_keyd.sh` | before apply | Copies keyd config to `/etc/keyd/` (Linux only, sudo, skips if keyd not installed) |

vim plugin management is handled by vim-plug bootstrap in `.vimrc` — auto-installs all plugins on first vim open. No run script needed.

## Important env vars

- `FZF_DEFAULT_COMMAND` uses `rg --files --no-ignore --hidden --follow` — requires ripgrep
- `JAVA_HOME` auto-detected per platform
- `ANDROID_HOME` set to `$HOME/Library/Android/sdk` (macOS)
- RVM loaded via `~/.rvm/scripts/rvm`
