# ZSH Configuration 

export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="half-life"
ZSH_THEME="amuse"
# HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto      # update automatically without asking
ENABLE_CORRECTION="true"
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias v="nvim"
alias zshconfig="~/.zsh/zshconfig.sh"
alias vimconfig="v ~/.config/nvim"
alias cheatsheet="v ~/.cheatsheet.md"
# alias f="cd $(find ~/development -type d -print | fzf)"

gtouch() {
	if [ -z $1 ]; then 
		echo "usage: gtouch <file>";
	else 
		touch $1 & git add $1;
	fi
}

# PATH exports 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source any local configurations
touch ~/.zshlocal
source ~/.zshlocal

export PATH=$PATH:/home/garrettburroughs/.spicetify

export PATH=$PATH:/home/garrett/.spicetify
