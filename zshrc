export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"
zstyle ':omz:update' mode reminder
plugins=(git dotenv rust node npm python)

source $ZSH/oh-my-zsh.sh

export PNPM_HOME="/var/home/sboyden/.local/share/pnpm"
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
export PATH="$PATH:$HOME/.npm-global/bin:/var/lib/flatpak/exports/bin:~/.local/bin"
export PATH="$PNPM_HOME:$PATH"
export PATH="$PATH:$HOME/.local/share/bin"

DEFAULT_DISTROBOX="fedora-toolbox-37"

export EDITOR="nvim"

# Base16 Shell
[[ ! "$(hostname)" == *"toolbox"* ]] && \
    (distrobox enter $DEFAULT_DISTROBOX -e sudo /usr/sbin/sshd 2>/dev/null &)
[[ "$(hostname)" == *"toolbox"* ]] && \
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

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
    . $HOME/.nix-profile/etc/profile.d/nix.sh # added by Nix installer
fi 

export GOROOT=$HOME/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
