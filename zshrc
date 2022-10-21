export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"
zstyle ':omz:update' mode reminder
plugins=(git dotenv rust node npm python)

source $ZSH/oh-my-zsh.sh

export PNPM_HOME="/var/home/sboyden/.local/share/pnpm"
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="$PATH:$HOME/.npm-global/bin:/var/lib/flatpak/exports/bin:~/.local/bin"
export PATH="$PNPM_HOME:$PATH"
export CR_PAT="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"

export EDITOR="nvim"

# Base16 Shell
[[ ! "$(hostname)" == "toolbox" ]] && (toolbox run sudo /usr/sbin/sshd &)
[[ "$(hostname)" == "toolbox" ]] && \
    export DISPLAY=:0 && \
    export WAYLAND_DISPLAY="" && \
    . "$HOME/.cargo/env"

function tb () {
    host="$1"
    if [[ -z "$host" ]]; then
        host="toolbox-37"
    fi

    ssh -t $host "cd $PWD; zsh --login"
}

alias gitlog="git log --all --graph --decorate"
alias ls="exa --git --group-directories-first"
alias notes="nvim ~/Nextcloud/Notes/University/index.md"

fpath+=~/.zfunc

if [ -e /var/home/sboyden/.nix-profile/etc/profile.d/nix.sh ]; then . /var/home/sboyden/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export GOROOT=/var/home/sboyden/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/var/home/sboyden/go
export PATH=$GOPATH/bin:$PATH
