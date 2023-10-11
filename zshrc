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

#############################################################################
# Various paths and variables to keep homebrew installed software happy

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# XML2
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

# CURL
export PATH="/usr/local/opt/curl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/curl/lib"
export CPPFLAGS="-I/usr/local/opt/curl/include"
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"

# Java
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"


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
