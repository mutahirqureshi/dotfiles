# dotfiles

### Dependencies

```xcode-select --install```

```brew install git```

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

```brew install --cask font-fira-code```

## X Server

```sudo pacman -S xsel```

## Wayland

```sudo pacman -S wl-clipboard```

```yay -S wl-clipboard-x11```

### Setup

1. ```cd ~```
2. ```git clone <repo url> dotfiles```
3. ```cd dotfiles```
4. ```chezmoi apply```
5. ```$(brew --prefix)/opt/fzf/install```
6. (Linux only) Install keyd from https://github.com/rvaiya/keyd. See config file in keyd/default.conf
