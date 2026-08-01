# AGENTS.md

## Repo type

Dotfiles repo managed by chezmoi with chezmoi external for prezto.

## Setup

```bash
cd ~ && git clone <repo url> dotfiles && cd dotfiles
chezmoi apply
```

Or use the Makefile:

```bash
make setup       # full setup (submodules + dotfiles)
make update      # pull + chezmoi apply
make dry-run     # preview changes
```

- chezmoi config lives at `~/.config/chezmoi/chezmoi.toml` (not in the repo).
- Chezmoi external repos are downloaded during `chezmoi apply` (see `.chezmoiexternal.toml`).
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

- **macOS**: karabiner assets (in .config/karabiner), Rectangle config, iTerm2 theme, CapsLock JSON config
- **Linux**: keyd config copied to `/etc/keyd/default.conf` (requires sudo)

## Key subdirectories

| Directory | Purpose | Status |
|-----------|---------|--------|
| `git/` | Git config (.gitconfig.local is local-only, gitignored in .gitignore) | Mostly empty |
| `android_studio/` | Android Studio config | Managed by chezmoi (if dot-prefixed) |
| `iterm2/` | iTerm2 color profile | Excluded from chezmoi, handled by run script |
| `rectangle/` | macOS window management config | Excluded from chezmoi, handled by run script |
| `keyd/` | Linux key remapping config | Excluded from chezmoi, handled by run script |

## Chezmoi external repos

Prezto is managed as an external repo (`.chezmoiexternal.toml`) and downloaded during `chezmoi apply`. The `run_onchange_prezto.sh` script handles linking runcoms, `.zprezto`, and setting zsh as the default shell.

## chezmoi run scripts

Files at the root of the source directory with `run_` prefix are executed by chezmoi on applies:

| Script | Runs | Description |
|--------|------|-------------|
| `run_onchange_prezto.sh` | on change | Links prezto runcoms and .zprezto, sets zsh as default shell |
| `run_pre_rectangle.sh` | on apply | Copies RectangleConfig.json (macOS only) |
| `run_pre_keyd.sh` | on apply | Copies keyd default.conf to /etc/keyd/ (Linux only, sudo) |
| `run_pre_iterm2.sh` | on apply | Imports iTerm2 Solarized-Black theme (macOS only) |

vim plugin management is handled by vim-plug bootstrap in `.vimrc` — auto-installs all plugins on first vim open. No run script needed.

## Important env vars

- `FZF_DEFAULT_COMMAND` uses `rg --files --no-ignore --hidden --follow` — requires ripgrep
- `JAVA_HOME` auto-detected per platform
- `ANDROID_HOME` set to `$HOME/Library/Android/sdk` (macOS)
- RVM loaded via `~/.rvm/scripts/rvm`
