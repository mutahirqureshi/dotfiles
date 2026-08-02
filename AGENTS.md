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
Files in the repo map to $HOME paths directly:
- `.profile` → `~/.profile`
- `.bashrc` → `~/.bashrc`
- `.gitconfig` → `~/.gitconfig`
- `.vimrc` → `~/.vimrc` (includes vim-plug bootstrap)
- `.config/kitty/kitty.conf` → `~/.config/kitty/kitty.conf`
- `.config/sway/config` → `~/.config/sway/config`
- `.config/karabiner/assets/complex_modifications/*.json` → `~/.config/karabiner/assets/complex_modifications/*.json`

Platform-specific content is handled via Go templates and `run_` scripts in `.chezmoi/`.

## Platform differences

- **macOS**: karabiner assets (in .config/karabiner), Rectangle config, CapsLock JSON config
- **Linux**: keyd config copied to `/etc/keyd/default.conf` (requires sudo)

## Key subdirectories

| Directory | Purpose | Status |
|-----------|---------|--------|
| `android_studio/` | Android Studio config | Managed by chezmoi (if dot-prefixed) |
| `rectangle/` | macOS window management config | Excluded from chezmoi, handled by run script |
| `keyd/` | Linux key remapping config | Excluded from chezmoi, handled by run script |

## Chezmoi external repos

Prezto is managed as an external repo (`.chezmoiexternal.toml`) and downloaded during `chezmoi apply --refresh-externals`.

## chezmoi run scripts

Files at the root of the source directory with `run_` prefix are executed by chezmoi on applies:

| Script | Runs | Description |
|--------|------|-------------|
| `run_after_update-prezto-submodules.sh` | after update | Recursively syncs prezto submodules |

vim plugin management is handled by vim-plug bootstrap in `.vimrc` — auto-installs all plugins on first vim open. No run script needed.

## Important env vars

- `FZF_DEFAULT_COMMAND` uses `rg --files --no-ignore --hidden --follow` — requires ripgrep
- `JAVA_HOME` auto-detected per platform
- `ANDROID_HOME` set to `$HOME/Library/Android/sdk` (macOS)
- RVM loaded via `~/.rvm/scripts/rvm`
