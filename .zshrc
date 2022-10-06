# ZSH Configuration 

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="half-life"
# HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto      # update automatically without asking
ENABLE_CORRECTION="true"
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# OS Specific configuration
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	alias nvim="~/nvim.appimage"
	alias v="~/nvim.appimage"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	alias v="nvim"	
fi

# Aliases
alias zshconfig="~/.zsh/zshconfig.sh"
alias vimconfig="v ~/.config/nvim"
alias cheatsheet="v ~/cheatsheet.md"
# alias f="cd $(find ~/development -type d -print | fzf)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
touch .zshlocal
source .zshlocal
