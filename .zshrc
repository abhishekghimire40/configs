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

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# fzf alias 
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

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


alias cat="bat"
alias vim="nvim" 

# go path
export GOPATH=/home/abhishekghimire/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

#zoxide config
eval "$(zoxide init zsh)"

#starship config
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/abhishekghimire/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/abhishekghimire/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/abhishekghimire/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/abhishekghimire/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

