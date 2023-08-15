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
           $HOME/bin \
           $HOME/bin/scripts \
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
zinit light  "zdharma-continuum/fast-syntax-highlighting"
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
zinit snippet OMZ::plugins/docker/docker.plugin.zsh
zinit snippet OMZ::plugins/helm/helm.plugin.zsh
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
zinit snippet OMZ::plugins/terraform/terraform.plugin.zsh
zinit snippet OMZ::plugins/zoxide/zoxide.plugin.zsh
zinit snippet OMZ::plugins/rust/rust.plugin.zsh

export FZF_BASE="/home/peregrinus/.sources/fzf/bin/fzf"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s ~/.sources/fzf/shell/key-bindings.zsh ]] && source ~/.sources/fzf/shell/key-bindings.zsh

##################################################################

# junegunn/fzf-bin
#zinit ice from"gh-r" as"program"
#zinit light junegunn/fzf-bin

zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit load atuinsh/atuin

#zinit ice from"gh-r" as"program" mv"docker* -> docker-compose"
#zinit light docker/compose

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
# alias
##################################################################

alias stosou="systemctl --user stop pipewire pipewire-pulse wireplumber"
alias stasou="systemctl --user start pipewire pipewire-pulse wireplumber"
alias restasou="systemctl --user restart pipewire pipewire-pulse wireplumber"

alias cjb="source ~/.anaconda/bin/activate  && conda activate jupyterlab-env && jupyter-lab"

alias ls="ls --color"

[ -x "$(command -v /usr/bin/bat)" ] && {
  alias bat="bat"
  alias cat="bat"
} 

[ -x "$(command -v /usr/bin/batcat)" ] && {
  alias bat="batcat"
  alias cat="batcat"
} 

alias zrc="nvim ~/.zshrc"

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
  autossh -M 0 -XY $USER@$1 -t "tmux new-session -A -s $1"
}

function autossh_t_idx () {
  autossh -M 0 -XY $USER@$1 -t "tmux new-session -A -s $2"
}

function kitty-ssh () {
  infocmp xterm-kitty | ssh $1 tic -x -o \~/.terminfo /dev/stdin
}

function print_log () {
  # tail -f /var/log/pacman.log | bat --paging=never -l log
  tail -f $1 | bat --paging=never -l log
}

function rm-submodule () {
  submodule=$1
  git rm -f "$submodule"
  rm -rf ".git/modules/$submodule"
  git config -f ".git/config" --remove-section "submodule.$submodule" 2> /dev/null

  # commit the change
  git commit -m "remove submodule $submodule"
}

alias bathelp='batcat --plain --language=help'
function help() {
    "$@" --help 2>&1 | bathelp
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
export WORKON_HOME=$HOME/.virt_envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv

[[ -s $HOME/.local/bin/virtualenvwrapper.sh ]] && source $HOME/.local/bin/virtualenvwrapper.sh

##################################################################


# stop ranger from load default rc
export RANGER_LOAD_DEFAULT_RC=False

# bat man
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

##################################################################

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

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

[ -x "$(command -v kubectl)" ] && source <(kubectl completion zsh)
export KUBECONFIG=$KUBECONFIG:~/.kube/config

##################################################################

source ~/.zprofile

##################################################################

alias luamake=/home/peregrinus/.sources/lua-language-server/3rd/luamake/luamake

##################################################################

eval "$(zoxide init zsh)"

##################################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/peregrinus/.p_dotfiles/roles/dotfiles-gruvbox/files/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/peregrinus/.micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/peregrinus/.micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/peregrinus/.micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/peregrinus/.micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<
