#!/bin/bash

# 1. Setup vim-key for bashrc/zshrc
cd $HOME
case `echo $SHELL` in
	*bash)
		bash_vim_key_plugin="set -o vi
bind -m vi-insert 'Control-l: clear-screen'"
		if grep -FxqU "$bash_vim_key_plugin" ~/.bashrc; then
			echo "Vim key enabled for bash"
		else
			echo "$bash_vim_key_plugin" > ~/.bashrc
			source ~/.bashrc
		fi
		;;
	*zsh)
		zsh_vim_key_plugin="set -o vi
bindkey -v
set editing-mode vi
set keymap vi
bindkey '^R' history-incremental-search-backward
KEYTIMEOUT=1"
		if grep -FxqU "$zsh_vim_key_plugin" ~/.zshrc; then
			echo "Vim key enabled for zsh"
		else
			echo "$zsh_vim_key_plugin" > ~/.zshrc
			source ~/.zshrc
		fi
		;;
esac
###############################################################################

# 2. Link vim with nvim command
command -v nvim &>/dev/null || \
	([ -n "$(command -v yum)" ] && sudo yum install neovim -y) || \
	([ -n "$(command -v apt-get)" ] &&  (sudo apt-get update -y; sudo apt-get install neovim -y))
###############################################################################

# 3. Install tailscale
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
###############################################################################
