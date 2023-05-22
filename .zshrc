export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="smt"

plugins=(git common-aliases zsh-autosuggestions history-substring-search zsh-syntax-highlighting fzf fzf-tab)

export ZSH_HIGHLIGHT_MAXLENGTH=60
export FZF_BASE=/usr/bin/fzf

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export BROWSER=
export TERM=xterm-256color

# Vim binding
bindkey -v

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

eval "$(fasd --init auto)"

# bindings
# open Code in current directory
bindkey -s "\C-e" "code .\C-m"


### alias ###
# prevent ghostscript
alias gs='git status'
alias ys='yarn start'

alias gmc='git merge --continue'
alias gcd='git clone --depth=1'

# gloga, but ONLY local & show all stash
alias glogl='git log --exclude="refs/remotes/*" --oneline --graph --decorate --boundary $(git reflog show --format="%h" stash)'

alias gst="git stash push -u -m"

# --no-ff "merge with.."
alias gmw="git merge --no-ff"

# >>> dev works >>>
alias gdf='git difftool'

# ranger/examples/shell_automatic_cd.sh
ranger_cd() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

alias tmux="env TERM=screen-256color tmux"

# This binds Ctrl-O to ranger_cd:
bindkey -s "\C-o" "ranger_cd\C-m"
bindkey -s "\C-t" "tmux\C-m"

bindkey -s "\C-g" "gloga\C-m"

