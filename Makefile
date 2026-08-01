.PHONY: setup full-setup update dry-run clean chezmoi-init

setup:
	chezmoi apply

full-setup:
	chezmoi apply --verbose

update:
	git pull
	chezmoi apply

dry-run:
	chezmoi apply --dry-run --verbose

clean:
	chezmoi forget

chezmoi-init:
	chezmoi init --source=$(shell pwd)
