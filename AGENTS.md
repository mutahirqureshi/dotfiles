# AGENTS.md

## Repo type

Dotfiles repo managed by chezmoi with git submodules for vim, prezto, and CapsLock.

## Setup

```bash
cd ~ && git clone <repo url> dotfiles && cd dotfiles
git submodule update --init --recursive
chezmoi init
chezmoi apply
```

Or use the Makefile:

```bash
make setup       # full setup (submodules + dotfiles)
make update      # pull + submodules + chezmoi apply
make dry-run     # preview changes
```

- Submodules must be initialized before `chezmoi apply` — some run scripts depend on submodule content.
- chezmoi config lives at `~/.config/chezmoi/chezmoi.toml` (not in the repo).

## How chezmoi manages files

This repo IS the chezmoi source directory (`sourceDir` in chezmoi.toml).
Files in the repo map to $HOME paths directly:
- `.profile` → `~/.profile`
- `.bashrc` → `~/.bashrc`
- `.gitconfig` → `~/.gitconfig`
- `.config/kitty/kitty.conf` → `~/.config/kitty/kitty.conf`
- `.config/sway/config` → `~/.config/sway/config`
- `.config/karabiner/assets/complex_modifications/*.json` → `~/.config/karabiner/assets/complex_modifications/*.json`

Platform-specific content is handled via Go templates and `run_` scripts in `.chezmoi/`.

## Platform differences

- **macOS**: karabiner assets (in .config/karabiner), Rectangle config, iTerm2 theme, CapsLock build
- **Linux**: keyd config copied to `/etc/keyd/default.conf` (requires sudo)

## Key subdirectories

| Directory | Purpose | Status |
|-----------|---------|--------|
| `vim/` | Vim config submodule (mq-vim), plugins managed by vim-plug | Excluded from chezmoi |
| `prezto/` | Zsh framework submodule | Excluded from chezmoi |
| `git/` | Git config (.gitconfig.local is local-only, gitignored in .gitignore) | Mostly empty |
| `android_studio/` | Android Studio config | Managed by chezmoi (if dot-prefixed) |
| `iterm2/` | iTerm2 color profile | Excluded from chezmoi, handled by run script |
| `rectangle/` | macOS window management config | Excluded from chezmoi, handled by run script |
| `keyd/` | Linux key remapping config | Excluded from chezmoi, handled by run script |

## chezmoi run scripts

Files in `.chezmoi/` with `run_` prefix are executed by chezmoi on applies:

| Script | Runs | Description |
|--------|------|-------------|
| `run_onchange_prezto.sh` | on change | Links prezto runcoms and .zprezto, sets zsh as default shell |
| `run_once_vim_plugins.sh` | once | Runs vim-plug upgrade/clean/update |
| `run_pre_rectangle.sh` | on apply | Copies RectangleConfig.json (macOS only) |
| `run_pre_keyd.sh` | on apply | Copies keyd default.conf to /etc/keyd/ (Linux only, sudo) |
| `run_pre_iterm2.sh` | on apply | Imports iTerm2 Solarized-Black theme (macOS only) |

## Important env vars

- `FZF_DEFAULT_COMMAND` uses `rg --files --no-ignore --hidden --follow` — requires ripgrep
- `JAVA_HOME` auto-detected per platform
- `ANDROID_HOME` set to `$HOME/Library/Android/sdk` (macOS)
- RVM loaded via `~/.rvm/scripts/rvm`

## Vim plugin management

`run_once_vim_plugins.sh` runs `vim -E -c PlugUpgrade -c PlugClean! -c PlugUpdate -c qa`. Requires a running Vim/Neovim with plug.vim installed in the vim submodule.

## Submodule note

Submodules (vim, prezto, keyboard/macos/Capslock) are excluded from chezmoi's source state via `.chezmoiignore`. Their own install.sh scripts are removed — chezmoi manages the linking, and run scripts handle submodule-specific setup.
