# --------- Enable VI mode ---------------

bindkey -v 
export KEYTIMEOUT=1

# --------- Shell colors & prompt ---------

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# --------- Auto-complet & Hist -----------

autoload -U compinit && compinit
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.config/zsh/history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# --------- Zsh Styling -------------------

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# --------- Aliases -----------------------

alias ls="ls --color"
alias erc="nvim ~/.zshrc && source ~/.zshrc"

# --------- Plugins -----------------------

load_plugin() {
    name=$(basename $1)
    _path=~/.config/zsh/plugins/$name

    if [ ! -d $_path ]; then
        git clone $1 $_path --depth 1
    fi

    if [ -f $_path/$name.zsh ]; then
        source $_path/$name.zsh
    elif [ -f $_path/$name.plugin.zsh ]; then
        source $_path/$name.plugin.zsh
    else
        echo "Couldn't load $name, can't find .zsh script"
    fi
}

update_plugin() {
    for plug in $(/bin/ls ~/.config/zsh/plugins); do
        git -C ~/.config/zsh/plugins/$plug pull >/dev/null
    done
}

load_plugin https://github.com/zsh-users/zsh-syntax-highlighting
load_plugin https://github.com/zsh-users/zsh-completions
load_plugin https://github.com/zsh-users/zsh-autosuggestions
load_plugin https://github.com/Aloxaf/fzf-tab

# --------- Keybindings ------------------

goto_dev() {
    cd ~/Developer/$(/bin/ls ~/Developer | fzf)
    zle reset-prompt
}

zle -N goto_dev

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^G' goto_dev

# --------- Integrations -----------------

eval "$(fzf --zsh)"

# --------- Env vars ---------------------

export PATH=$PATH:~/.local/bin
