# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nvm zsh-autosuggestions)
# zstyle ':omz:plugins:nvm' lazy yes

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias nvim="nvim"
alias valac="nvim ~/.config/alacritty/alacritty.yml"
alias vz="nvim ~/.zshrc"
#alias vconf="cd ~/.config/lvim; nvim init.lua; cd"
alias c="clear"
alias sz="source ~/.zshrc"
alias v="nvim"
alias lv="~/.local/bin/lvim"
alias ls="eza"
alias spotify="LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"
alias sd="cd ~ && cd \$(fd . | fzf)"
alias figma="LD_PRELOAD=/usr/lib/libm.so.6 figma-linux &"
alias lg="lazygit"
alias cat="bat"
alias cd="z"

function vconf() { 
	local a=${PWD}
	cd ~/.config/nvim; # chang root directory.
	nvim init.lua; # open init.lua with nvim
	cd $a # cd into last directory
}

# [C]++ [C]ompiler shortcut
function cc() {
	local a=${1%.*} # will remove ".cpp"
	g++ $1 -o $a;
	./$a
}
#
# I want to use $@ for all arguments but they don't contain space for me
function flutter-watch-mac(){
  tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/flutter.pid" Enter \;\
  split-window -v \;\
  send-keys 'npx -y nodemon -e dart -x "cat /tmp/flutter.pid | xargs kill -USR1"' Enter \;\
  # send-keys 'find lib/ -name '*.dart' | \
  #   entr -p kill -USR1 $(cat /tmp/flutter.pid)'
  resize-pane -y 5 -t 1 \;\
  select-pane -t 0 \;
}
function flutter-watch(){
  tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/flutter.pid" Enter \;\
  split-window -v \;\
  send-keys 'npx -y nodemon -e dart -x "cat /tmp/flutter.pid | xargs kill --signal USR1"' Enter \;\
  # send-keys 'find lib/ -name '*.dart' | \
  #   entr -p kill -USR1 $(cat /tmp/flutter.pid)'
  resize-pane -y 5 -t 1 \;\
  select-pane -t 0 \;
}

function chpwd ()
{
    emulate -L zsh
    ls -a
}

DISABLE_AUTO_UPDATE=true

# NVM
# [ "NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
# source /usr/share/nvm/init-nvm.sh
# source /usr/share/nvm/nvm.sh
# source /usr/share/nvm/bash_completion
# source /usr/share/nvm/install-nvm-exec
#source /usr/share/nvm/init-nvm.sh

# Path and stuff should be on this file
source ~/.zprofile

export EDITOR="nvim"
export BROWSER="/usr/bin/firefox"

# export PATH=$HOME/Android/Sdk/platform-tools:$PATH
export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share/applications:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
# export PATH=$HOME/scripts:$PATH

#
# Flutter Stuff
#
# export PATH=$HOME/fvm/default/bin:$PATH
# export PATH="$PATH":"$HOME/.pub-cache/bin"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
# FNM_PATH="/home/letha/.local/share/fnm"
#if [ -d "$FNM_PATH" ]; then
  #export PATH="/home/letha/.local/share/fnm:$PATH"
  #eval "`fnm env`"
#fi

#export PYENV_ROOT="$HOME/.pyenv"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"


# fnm
# FNM_PATH="/Users/ibkaanharfatcha/Library/Application Support/fnm"
# if [ -d "$FNM_PATH" ]; then
#   export PATH="/Users/ibkaanharfatcha/Library/Application Support/fnm:$PATH"
#   eval "`fnm env`"
# fi
#
#
# eval "$(fnm env --use-on-cd --shell zsh)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
# [[ -f /Users/ibkaanharfatcha/.dart-cli-completion/zsh-config.zsh ]] && . /Users/ibkaanharfatcha/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
# export JAVA_HOME="$HOME/.jenv/shims"

# fnm
FNM_PATH="/Users/ibkaanharfatcha/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/ibkaanharfatcha/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

eval "$(fnm env --use-on-cd --shell zsh)"

[[ -s "/Users/ibkaanharfatcha/.gvm/scripts/gvm" ]] && source "/Users/ibkaanharfatcha/.gvm/scripts/gvm"
