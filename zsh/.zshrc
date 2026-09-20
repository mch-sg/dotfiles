getBranch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}

export PS1="$PS1 \$(getBranch) "
setopt PROMPT_SUBST;

# Path to ohmyzsh
export ZSH="$HOME/.oh-my-zsh"

# Theme, dont touch 
# (Change starship instead)
ZSH_THEME="fishy"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(
git
themes 
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"


##
## ALIASES
##

alias cat=bat
alias ls='ls -A'
alias cl="clear"
alias nv=nvim

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."


# Eza (ls alternative)
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"

# Git
alias gha="git add ."
alias ghc="git commit -m"
alias ghp="git push origin main"

# Pushing
alias gp="/Users/mhvidtfeldt/scripts/dtu-push.sh"
alias pdtu="/Users/mhvidtfeldt/scripts/dtu-push.sh"

alias depn='pip install -r /Users/mhvidtfeldt/dev/repos/dotfiles/preqs.txt'

alias initp="/Users/mhvidtfeldt/scripts/init.sh"

# course specific aliases
alias pms="/Users/mhvidtfeldt/scripts/02635-make.sh"
alias dex="/Users/mhvidtfeldt/scripts/delexecutables.sh"


zopen() { open -a Zen "$@"; }

##
## Convert .md / .ipynb to custom LaTeX pdf file
##

unalias nbpdf 2>/dev/null
nbpdf() {
    jupyter nbconvert "$1" --to pdf --LatexPreprocessor.style=moegilight 
}

export PATH="$HOME/.local/bin:$PATH"

export LOCAL_NOTEBOOK_DEV=1
source "$HOME/.cargo/env"


##
## CONDA INITIALIZE
##

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mhvidtfeldt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mhvidtfeldt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mhvidtfeldt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mhvidtfeldt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup


## STARSHIP
eval "$(starship init zsh)"

##
## FZF
##
export BAT_THEME="ansi"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --height=75%
  --layout=reverse-list
  --bind="ctrl-/:toggle-preview"
  --bind="ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"

  --color=fg:-1,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=hl:#336088,hl+:#6691b6,info:#C2A86C,marker:#af5fff
  --color=prompt:#C2A86C,spinner:#C2A86C,pointer:#c06d44,header:#909090
  --color=border:#262626,label:#aeaeae,query:#d9d9d9

  --border="sharp" --border-label="" --preview-window="right,50%,border-rounded" --prompt="~"
  --marker="◆" --pointer=">" --separator="─" --scrollbar="│"
  --info="right"'

export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:200 {}'"

alias f="fzf --preview 'bat --color=always {}' --bind 'enter:become(nvim {})'"
