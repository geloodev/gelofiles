fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/geloodev/.zshrc'

#autoload -Uz compinit
#compinit
# End of lines added by compinstall
#source /share/powerlevel10k/powerlevel10k.zsh-theme
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#. /opt/asdf-vm/asdf.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_TIME=pt_BR.UTF-8

export PATH=/home/geloodev/.local/bin:/home/geloodev/.cargo/bin:$PATH
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export XDG_CONFIG_HOME=$HOME/.config
#export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/share/lombok-nightly/lombok.jar"
export PICO_SDK_PATH=~/pico/pico-sdk
export PICO_TOOLCHAIN_PATH=/usr/bin/arm-none-eabi-gcc

alias ls="eza -l -a --icons --group-directories-first"
alias bat="bat --style=auto"
alias clear="clear && fastfetch"
alias gelofiles="nvim ~/gelofiles"

eval "$(starship init zsh)"
eval "$(mise activate zsh)"
