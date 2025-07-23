# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

# Home and end keybind
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
# zsh history substring search keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# Load and initialise completion system
autoload -Uz compinit
compinit

# Created by newuser for 5.9
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# make neovim the default text editor for this user
export EDITOR='nvim'
export VISUAL='nvim'

# Source fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf alias 
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

# replaceing ls with eza 
alias ls="eza --icons"
alias sdn="shutdown now"
alias rb="reboot"
#----cd aliases------
alias cdb="cd -"
alias cd="z"
alias cd1="z .."
alias cd2="z ../.."
alias cd3="z ../../.."
alias cd4="z ../../../.."
alias cd5="z ../../../../.."
alias cd6="z ../../../../../.."
#---------git aliases----------
alias gis="git status"
alias gl="git log"
alias ga="git add"
alias gaa="git add ."
alias gcm="git commit -m"
alias gpom="git push -u origin main"


alias cat="batcat"
alias vim="nvim" 

# go path
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin:$GOBIN:$HOME/anaconda3/bin

# export PATH=$PATH:$GOPATH:$GOBIN:$HOME/anaconda3/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/abhishek-ghimire/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/abhishek-ghimire/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/abhishek-ghimire/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/abhishek-ghimire/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#zoxide config
eval "$(zoxide init zsh)"

#starship config
eval "$(starship init zsh)"


