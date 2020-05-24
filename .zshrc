export ZSH="/home/jj/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git common-aliases zsh-autosuggestions history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export TERM=xterm-256color

# Vim binding
bindkey -v

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

eval "$(fasd --init auto)"


# alias

# ghostscript hinders it
alias gs='git status'

alias caps='bash ~/work/work/capsToEsc.sh'
alias vzsh='vim ~/.zshrc'
alias co9='xcalib -alter -co 99'


# >>> dev works >>>

# (temporary)
alias gcp='~/scripts/gcp'

# env & nb 
alias fastai='source ~/scripts/fastai'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jj/Downloads/google-cloud-sdk/google-cloud-sdk/path.zsh.inc' ]; then . '/home/jj/Downloads/google-cloud-sdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jj/Downloads/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/jj/Downloads/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jj/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jj/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jj/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jj/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# <<< dev works <<<


# >>> misc
# TODO: shell hook
function _check_todo {
  if [ $# -lt 1 ]; then
    echo no argument
    return 1
  fi
  cd $@ && { [ -f "todo.txt" ] && echo yes || echo 'no' }
}

#alias cd='_check_todo'

# <<< misc

