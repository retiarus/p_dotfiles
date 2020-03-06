# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=powerlevel10k/powerlevel10k

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  command-not-found
  compleat
  colored-man-page
  colorize
  debian
  dir-history
  docker
  extract
  git
  history
  last-working-dir
  npm
  pass
  pip
  sudo
  systemd
  tmux
  vagrant
  vi-mode
  virtualenvwrapper
  wakeonlan
  ansible
  docker-compose
  docker
  extract
  zsh-syntax-highlighting
  zsh-autosuggestions
  autojump
  ranger_autojump
)

# TMUX variables
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOSTART_ONCE=false
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false

# User configuration
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=pt_BR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

##################################################################

# Sets the Mail Environment Variable
# MAIL=/var/spool/mail/$USER && export MAIL

####################### Colors for ls ############################

if [ -f "$userdircolorsrc" ]; then
  eval "`dircolors -b $userdircolorsrc`"
fi

##################################################################

alias zshconfig="vim ~/.zshrc"

alias fsync='rsync -aAXHhivu --progress'

alias hfalco03='/mnt/falco03/home'

alias mountS='sshfs -o reconnect,transform_symlinks,ssh_command="autossh -M 0"'

################ Auto-completar para o comando 'kill' ############

zstyle ':completion:*:processes' command 'ps x -o pid,command'
zstyle ':completion:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

##################################################################

DIRCONDA="/var/lib/jupyterhub/anaconda"
alias conda_env=${DIRCONDA}/bin/activate

##################################################################

function autossh_t () {
  echo $1
  autossh -M 0 -XY $USER@$1 -t "tmux new-session -A -s $1"
}

function kitty-ssh () {
  infocmp xterm-kitty | ssh $1 tic -x -o \~/.terminfo /dev/stdin
}

##################################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##################################################################

autoload -Uz compinit
compinit
# Completion for kitty
[ -x "$(command -v kitty)" ] && kitty + complete setup zsh | source /dev/stdin

##################################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

##################################################################

# Config npm global packges
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$NPM_PACKAGES/bin:$PATH"

##################################################################

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

##################################################################

# activate virtualenvwrapper
export WORKON_HOME=~/Envs
source $HOME/.local/bin/virtualenvwrapper.sh

##################################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##################################################################

# stop ranger from load default rc
export RANGER_LOAD_DEFAULT_RC=False

##################################################################

# load alias for cat if ccat exists
if command -v ccat >> /dev/null; then
  alias cat=ccat
fi

##################################################################

[[ -s /home/peregrinus/.autojump/etc/profile.d/autojump.sh ]] && source /home/peregrinus/.autojump/etc/profile.d/autojump.sh

##################################################################

autoload -U compinit && compinit -u

list_path=($HOME/go/bin \
           $HOME/bin \
           /usr/local/bin)

for i in ${list_path[@]}
do
  if [[ ":$PATH:" != *":$i:"* ]]; then
    export PATH=$i:$PATH
  fi
done
