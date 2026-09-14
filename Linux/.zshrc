# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Completions configuration
fpath=("$HOME/.oh-my-zsh/custom/completions" $fpath)
autoload -Uz compinit
compinit

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "arrow" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# LESS pager configuration
export LESS=-JMQRiFX

# FZF integration
alias rgf="rg --files | fzf"

rfv() {
  vim $(rg --files -j1 | fzf)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Go development environment
export GOROOT=/usr/local/go
export GOBIN=$HOME/code/bin
export GOPATH=$HOME/golib
export GOPATH=$GOPATH:$HOME/code
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/usr/local/go/bin

# Additional PATH additions
export PATH=$PATH:$HOME/miniforge3/bin
export PATH=$PATH:$HOME/.local/bin

# Java environment
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/

# Kubernetes configuration
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# OpenSpec telemetry
export OPENSPEC_TELEMETRY=0

# Aliases
alias k="kubectl"
alias python="python3"
alias devin-d="~/devin-desktop-launcher.sh ."
alias wf="~/windsurf-launcher.sh ."

# Fun commands
fastfetch
fortune | cowsay -f bird | lolcat

# Go coverage function
cover () {
  t="/tmp/go-cover.$$-tmp"
  go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}

# Git PR functions
gitPR () {
    if git show-ref --verify --quiet refs/heads/pull$1; then
        echo "Pulling updates from pull/$1..."
        git checkout pull$1 -q
        git pull origin pull/$1/head
    else
        echo "Getting pull/$1..."
        git fetch origin pull/$1/head:pull$1 -q
        git checkout pull$1 -q
    fi
    git show --stat | grep "Author"
}

gitPRDelete () {
    git reset --hard
    git clean -f -x -d
    git checkout main
    echo "Deleting branch pull/$1..."
    git branch -D pull$1
}

# Docker cleanup function
dockerClean () {
    docker container rm -f $(docker container ls -aq) 2> /dev/null
    docker rmi -f $(docker images -aq) 2> /dev/null
    docker system prune -a --volume -f
}

# Certificate decoding functions
alias dspc='decodeSinglePEMCert'
decodeSinglePEMCert () {
    openssl x509 -in $1 -text -noout
}
alias dsbc='decodeSingleBase64Cert'
decodeSingleBase64Cert () {
    echo $1 | base64 -d | openssl x509 -text -noout
}
alias dmbc='decodeMultiBase64Cert'
decodeMultiBase64Cert () {
    echo $1 | base64 -d | openssl storeutl -noout -text -certs -uri file:/dev/stdin 
}

# Base64 encode/decode functions
b64e () {
    if [[ -f "$1" ]]; then
        perl -pe 'chomp if eof' "$1" | base64 -w0
    else
        echo -n "$1" | base64 -w0
    fi
}
b64d () {
    if [[ -f "$1" ]]; then 
        base64 -d < "$1"
    else
        echo "$1" | base64 -d
    fi
}

# Safe rm function
rm_safe() {
  local args=("$@")
  local has_r=false
  local has_f=false
  local target=""
  for arg in "${args[@]}"; do
    if [[ "$arg" != -* ]]; then
      target="$arg"
      continue
    fi
    if [[ "$arg" == *"r"* ]] || [[ "$arg" == *"-recursive"* ]] || [[ "$arg" == *"-R"* ]]; then
      has_r=true
    fi
    if [[ "$arg" == *"f"* ]] || [[ "$arg" == *"-force"* ]]; then
      has_f=true
    fi
  done
  if $has_r && $has_f; then
    echo "DANGER: You're about to recursively delete!"
    echo "Current directory: $(pwd)"
    echo "Target: $target"
    echo -n "Are you absolutely sure? (type 'yes'): "
    read confirm
    if [[ "$confirm" != "yes" ]]; then
      echo "Cancelled"
      return 1
    fi
  fi
  /bin/rm "$@"
}
alias rm='rm_safe'

# Shell options
setopt histignorespace
