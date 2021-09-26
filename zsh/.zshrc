export EDITOR="nvim"
export STARSHIP_CONFIG=~/.config/starship/starship.toml



eval "$(/opt/homebrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/neilsabde/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/neilsabde/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/neilsabde/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/neilsabde/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /opt/homebrew/etc/profile.d/z.sh

alias ls="exa -a --color=always --icons --group-directories-first"
alias ll="exa -la --color=always --icons --group-directories-first"
alias tree="exa -a --color=always --icons --group-directories-first -T"
alias lz="lazygit"
alias v="nvim"
alias python3="python3.9"
alias pip3="pip3.9"

function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

autoload -U compinit && compinit

# eval "$(starship init zsh)"
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '  %b'
setopt PROMPT_SUBST
# PS1=$'\E[34m%1~\E[33m${vcs_info_msg_0_} \E[32m \E[0m'
PS1=$'\E[34m%1~\E[33m${vcs_info_msg_0_} \E[32m \E[0m'
# PS1=$'\E[34m%1~\E[33m${vcs_info_msg_0_} \E[32m>\E[33m>\E[35m> \E[0m'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias luamake=/Users/neilsabde/.config/nvim/ls/lua-language-server/3rd/luamake/luamake

export PATH="$HOME/.local/bin:$PATH"
