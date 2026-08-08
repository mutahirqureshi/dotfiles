# dotfiles

### Dependencies

```xcode-select --install```

```brew install git```

```brew install curl```

```brew install hub```

```brew install iterm2 --cask```

```brew install kitty --cask```

```brew install fzf```

```brew install ripgrep```

```brew install fd```

```brew install vim```

```brew install zsh```

```brew install tmux```

```brew install yq```

```brew install chezmoi```

```brew install git-delta```

```brew install --cask font-fira-code```

## X Server

```sudo pacman -S xsel```

## Wayland

```sudo pacman -S wl-clipboard```

```yay -S wl-clipboard-x11```

## Linux (Debian/Ubuntu)

```sudo apt install git curl fzf ripgrep fd-find vim zsh tmux```

### Setup

1. ```cd ~```
2. ```git clone <repo url> dotfiles```
3. ```cd dotfiles```
4. ```chezmoi init --apply --refresh-externals --source .```
5. ```chsh -s $(which zsh)```
6. ```$(brew --prefix)/opt/fzf/install```
7. (Linux only) Install keyd from https://github.com/rvaiya/keyd. See config file in keyd/default.conf

`chezmoi init` automatically detects `.chezmoi.toml.tmpl` in the repo and uses it to generate the config file with the correct `sourceDir`.
