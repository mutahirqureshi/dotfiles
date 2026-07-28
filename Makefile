.PHONY: setup full-setup update submodules dry-run prezto vim-plugins fzf clean

submodules:
	git submodule update --init --recursive

setup: submodules
	chezmoi apply

full-setup: submodules
	chezmoi apply --verbose

update:
	git pull
	git submodule update --init --recursive
	chezmoi apply

dry-run:
	chezmoi apply --dry-run --verbose

clean:
	chezmoi forget --recurse-submodules

chezmoi-init:
	chezmoi init --source=$(shell pwd)
