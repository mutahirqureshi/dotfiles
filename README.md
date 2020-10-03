# dotfiles

### Dependencies
```brew install git```
```brew install hub```
```brew cask install iterm2```
```brew cask install kitty```
```brew install fzf```
```brew install ripgrep```
```brew install fd```
```brew tap homebrew/cask-fonts && brew cask install font-fira-code```
```brew install reattach-to-user-namespace``` OR ```sudo pacman -S xsel```
## X Server
```sudo pacman -S xsel```
## Wayland
```sudo pacman -S wl-clipboard```
```yay -S wl-clipboard-x11```

### Setup
1. ```cd ~```
2. ```git clone <repo url> dotfiles```
3. ```cd dotfiles```
4. ```git submodule update --init --recursive```
5. ```./install.sh```
