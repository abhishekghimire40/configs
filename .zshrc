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

# replaceing ls with eza 
alias ls="eza --icons"
alias sdn="shutdown now"
alias rb="reboot"
#----cd aliases------
alias cdb="cd -"
alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."
alias cd6="cd ../../../../../.."
#---------git aliases----------
alias gis="git status"
alias gl="git log"
alias ga="git add"
alias gaa="git add ."
alias gcm="git commit -m"
alias gpom="git push -u origin main"


alias vim="nvim" 

# go path
export GOPATH=/home/abhishek/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

#zoxide config
eval "$(zoxide init zsh)"

#starship config
eval "$(starship init zsh)"
