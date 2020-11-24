# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##################################################################

list_path=($HOME/.cargo/bin
           $HOME/go/bin \
           $HOME/.local/bin \
           /usr/local/bin)

for i in ${list_path[@]}
do
  if [[ ":$PATH:" != *":$i:"* ]]; then
    export PATH=$i:$PATH
  fi
done

##################################################################

source ~/.zinit/bin/zinit.zsh

##################################################################

zinit light  "zsh-users/zsh-completions"
zinit light  "zdharma/fast-syntax-highlighting"
zinit light  "zsh-users/zsh-autosuggestions"

##################################################################

zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit snippet OMZ::plugins/compleat/compleat.plugin.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/extract/extract.plugin.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/history/history.plugin.zsh
zinit snippet OMZ::plugins/last-working-dir/last-working-dir.plugin.zsh
zinit snippet OMZ::plugins/npm/npm.plugin.zsh
zinit snippet OMZ::plugins/pip/pip.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh
zinit snippet OMZ::plugins/vagrant/vagrant.plugin.zsh
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
zinit snippet OMZ::plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh
zinit snippet OMZ::plugins/wakeonlan/wakeonlan.plugin.zsh
zinit snippet OMZ::plugins/ansible/ansible.plugin.zsh
zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

##################################################################

# junegunn/fzf-bin
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf-bin

# sharkdp/bat
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# ogham/exa, replacement for ls
zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* exa"
zinit light ogham/exa

# ripgrep
zinit ice wait"2" lucid from"gh-r" as"program" mv"ripgrep* ripgrep" pick"ripgrep/rg"
zinit light  BurntSushi/ripgrep

# dust
zinit ice wait"2" lucid from"gh-r" as"program" mv"dust* dust" pick"dust/dust"
zinit light bootandy/dust

# procs
zinit ice wait"2" lucid from"gh-r" as"program" mv"procs* procs" pick"usr/bin/procs"
zinit light dalance/procs

# broot
zinit ice wait"2" lucid from"gh-r" as"program" mv"broot* broot" pick"build/x86_64-unknown-linux-musl/broot"
zinit light Canop/broot

zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit ice from"gh-r" as"program" mv"docker* -> docker-compose"
zinit light docker/compose

##################################################################

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history          # Define history path

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

##################################################################

# You may need to manually set your language environment
export LANG=pt_BR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

####################### Colors for ls ############################

if [ -f ~/.dircolors ]; then
  eval $(dircolors ~/.dircolors)
fi

##################################################################

alias ls="ls --color"

alias zshconfig="nvim ~/.zshrc"

alias fsync='rsync -aAXHhivu --progress'

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

function rm-submodule () {
  submodule=$1
  git rm "$submodule"
  rm -rf ".git/modules/$submodule"
  git config -f ".git/config" --remove-section "submodule.$submodule" 2> /dev/null

  # commit the change
  git commit -m "remove submodule $submodule"
}

##################################################################

# Completion for kitty
[ -x "$(command -v kitty)" ] && kitty + complete setup zsh | source /dev/stdin

##################################################################

# Config npm global packges
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$NPM_PACKAGES/bin:$PATH"
export MANPATH="$NPM_PACKAGES/share/man:$MANPATH"

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

fpath+=~/.zfunc

##################################################################

zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

##################################################################

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

##################################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize

#source /home/peregrinus/.config/broot/launcher/bash/br
