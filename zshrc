# Configuration
# Path to your oh-my-zsh installation.
export ZSH="/$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell" #  2022-03-08
# ZSH_THEME="crunch"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    # aws
    # ansible
    git
    zsh-autosuggestions
    # npm
    # docker
    # zsh-syntax-highlighting
    # kubectl
    # gcloud
    # yarn
    # fzf
    # minikube
)

source $ZSH/oh-my-zsh.sh

##### Vim key binding #######
set -o vi
bindkey -v
set editing-mode vi
set keymap vi
zstyle ':autocomplete:*' default-context history-incremental-search-backward
KEYTIMEOUT=1
# ====================================================

####### PATH & ENV Variable ########
export GOPATH="$HOME/.go"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:/$HOME/.local/bin:$GOPATH/bin:$PYENV_ROOT/bin" # Local binary in USER
export EDITOR="/usr/bin/nvim"
# =====================================================

###### Auto-Compilation #######
# source <(helm completion zsh) # helm
# eval "$(gh copilot alias -- zsh)"
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
###############################

######### Lazy load NVM #########
lazy_load_nvm() {
  unset -f node nvm
  export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
}
node() { lazy_load_nvm; node $@; }
nvm() { lazy_load_nvm; nvm$@; }
#################################

######## ALIAS #########
alias t="/usr/bin/tmux"
alias open="/usr/bin/xdg-open"
alias lg="lazygit"
alias iplocation="timeout 4 speedtest-cli  | timeout 5 grep 'Hosted'"
alias k="/usr/local/bin/kubectl"
alias pbcopy="xclip -sel clip"
alias ls='exa'
alias k="kubectl"
alias cat="PAGER=cat bat --style=plain"
#######################################
