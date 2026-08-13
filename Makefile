.DEFAULT_GOAL := setup

.PHONY: setup git-setup herdr-setup ghostty-setup

DOTFILES_DIR := $(CURDIR)
HERDR_CONFIG := $(DOTFILES_DIR)/herdr/config.toml
HERDR_CONFIG_DIR := $(HOME)/.config/herdr
HERDR_CONFIG_LINK := $(HERDR_CONFIG_DIR)/config.toml
GHOSTTY_CONFIG := $(DOTFILES_DIR)/ghostty/config.ghostty
GHOSTTY_CONFIG_DIR := $(HOME)/.config/ghostty
GHOSTTY_CONFIG_LINK := $(GHOSTTY_CONFIG_DIR)/config.ghostty

setup: git-setup herdr-setup ghostty-setup
	@echo "dotfiles setup complete"

git-setup:
	@cd "$(DOTFILES_DIR)" && /bin/bash ./git/setup.sh

herdr-setup:
	@set -eu; \
	mkdir -p "$(HERDR_CONFIG_DIR)"; \
	if [ -L "$(HERDR_CONFIG_LINK)" ] && [ "$$(readlink "$(HERDR_CONFIG_LINK)")" = "$(HERDR_CONFIG)" ]; then \
		echo "herdr config symlink already exists"; \
	else \
		if [ -e "$(HERDR_CONFIG_LINK)" ] || [ -L "$(HERDR_CONFIG_LINK)" ]; then \
			backup="$(HERDR_CONFIG_LINK).backup"; \
			if [ -e "$$backup" ] || [ -L "$$backup" ]; then \
				backup="$(HERDR_CONFIG_LINK).backup.$$(date +%Y%m%d%H%M%S)"; \
			fi; \
			mv "$(HERDR_CONFIG_LINK)" "$$backup"; \
			echo "backed up existing herdr config to $$backup"; \
		fi; \
		ln -s "$(HERDR_CONFIG)" "$(HERDR_CONFIG_LINK)"; \
		echo "created herdr config symlink"; \
	fi

ghostty-setup:
	@set -eu; \
	mkdir -p "$(GHOSTTY_CONFIG_DIR)"; \
	if [ -L "$(GHOSTTY_CONFIG_LINK)" ] && [ "$$(readlink "$(GHOSTTY_CONFIG_LINK)")" = "$(GHOSTTY_CONFIG)" ]; then \
		echo "ghostty config symlink already exists"; \
	else \
		if [ -e "$(GHOSTTY_CONFIG_LINK)" ] || [ -L "$(GHOSTTY_CONFIG_LINK)" ]; then \
			backup="$(GHOSTTY_CONFIG_LINK).backup"; \
			if [ -e "$$backup" ] || [ -L "$$backup" ]; then \
				backup="$(GHOSTTY_CONFIG_LINK).backup.$$(date +%Y%m%d%H%M%S)"; \
			fi; \
			mv "$(GHOSTTY_CONFIG_LINK)" "$$backup"; \
			echo "backed up existing ghostty config to $$backup"; \
		fi; \
		ln -s "$(GHOSTTY_CONFIG)" "$(GHOSTTY_CONFIG_LINK)"; \
		echo "created ghostty config symlink"; \
	fi
