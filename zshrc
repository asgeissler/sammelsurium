# My setup includes:
#
# Oh my zsh
# Install with:
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# powerlevel 10k
# Install with:
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#
# Homebrew
# Install with:
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Show a welcome message
#fortune -s | cowthink -e "oO"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# For BAT, which is much nicer that less for viewing code
#export BAT_THEME="Dracula"
export BAT_THEME="OneHalfLight"

##############################################################################
# Helper function to start RStudio from a conda installation
# (I like name name my R env 'arr', rename as needed)
function myr() {
    conda activate arr
    /usr/local/Caskroom/mambaforge/base/envs/arr/bin/rstudio &
    #/usr/local/Caskroom/miniconda/base/envs/arr/bin/rstudio &
}

##############################################################################
# normal stuff

HOMEBREW_GITHUB_API_TOKEN=PRIVATE_USE_YOUR_OWN_HERE

alias ll='ls -l -G -h'
alias iso='date +%Y_%m_%d'

##############################################################################
# SSH setup for university/work 

# open ssh tunnel, local port is 8080
tunnelCMD="ssh -N -f -L 8080:MYURL.com:22 USER@MYURL.com"
alias tunnelCMD="$tunnelCMD"

# SSH connect to server, use tunnel if available
function server() {
    # must be function to work with osascript
    if  pgrep -f -x "$tunnelCMD" > /dev/null 2>&1 ; then
        ssh -Y -p 8080 USER@localhost
    else
        ssh -Y USER@MYURL.com
    fi
}

# helper to connect, setup mounts, etc
# Memo: Setup via MacOS a network location profile 'work' that uses
# localhost:8787 as a SOCKS proxy, then it is easier to access web resource
# from behind the firewall.
function work() {
    # step 1, universal tunnel
    tunnelCMD
    # step 2, start proxy, all over the tunnel
    ssh -D 8787 -p 8080 -f -N USER@localhost
    networksetup -switchtolocation work
    # 2, mount stuff
    sshfs -o volname=project -p 8080 \
        -o uid=$UID -o gid=$GID \
        USER@localhost:/path/on/server/to/projects ~/local-path/projects
    # 4 open a terminal window with an SSH connection to the server
    # and a split in to prevent sleeping of computer (to keep connection open)
    osascript << EOF
tell application "iTerm2"
    create window with default profile command "pmset noidle"
    tell current session of current window
        split horizontally with default profile command "zsh -i -c 'server'"
    end tell
end tell
EOF
    # 5 open finder window for project
    open ~/local-path/projects
}

# helper to close down all connections/mounts, and go to default network layout
function goodbye() {
    umount ~/local-path/projects
    killall ssh
    killall pmset
    networksetup -switchtolocation default

    echo 'Good Bye.'
}


##############################################################################
#############################################################################
# Various paths and variables to keep homebrew installed software happy

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/icu4c/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/icu4c/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/llvm/include:$CPPFLAGS"

# XML2
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/libxml2/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/libxml2/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig:$PKG_CONFIG_PATH"

# CURL
export PATH="/usr/local/opt/curl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/curl/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/curl/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig:$PKG_CONFIG_PATH"

# Java
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include:$CPPFLAGS"


#############################################################################
# Minimal config for ohmyzsh

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##############################################################################
