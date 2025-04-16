if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    starship init fish | source
end

# Remove fish greeting message
set -g fish_greeting

export EDITOR=/usr/bin/nano
# export VISUAL=/usr/bin/code

# ----- ALIASES -----
# Shell-related aliases
alias config-fish="nano ~/.config/fish/config.fish" # Open fish config
alias config-starship="nano ~/.config/starship.toml" # Open Starship config
alias config-ghostty="nano ~/.config/ghostty/config"
alias reload='echo -e "\033[0;1;33mReloading ..." &&\
  source ~/.config/fish/config.fish &&\
  echo -e "\033[0;1;33mReloaded !"' # Reload fish config
alias sudo-edit="sudo nano" # Edit files with sudo
alias sudo-exit="sudo -k" # Reset sudo timestamp
alias cls="clear" # Clear the screen using the Windows command
# alias rsync="rsync -razvhP" # Rsync with progress, archive, compress, verbose, and human-readable
alias known-hosts="nano ~/.ssh/known_hosts" # Edit known hosts
alias ssh-config="nano ~/.ssh/config" # Edit SSH config
alias font-reload="fc-cache -fv"

# ----- GIT ALIASES -----
# Shortcuts for common Git commands
alias gs="git status" # Git status
alias gf="git fetch" # Git fetch
alias gp="git pull" # Git pull
alias gl="git log --graph --all" # Git log with graph
alias go="onefetch" # Display repository info
alias gla="git shortlog -sne" # List contributors

# ----- MISC ALIASES -----
# optimus (exec given app with nvidia gpu)
alias prime-run="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"

# ----- Medias -----
# Function to play media with MPV
function play
    mpv $argv[1] &
    pidof mpv | disown
    exit
end

# ----- FILE NAVIGATION & MANAGEMENT -----
# Aliases for file management commands
alias lal="eza -al --icons --git --group-directories-first" # List all files in list format
alias ll="eza -l --icons --git --group-directories-first" # List files in list format
alias ls="eza --icons --git --group-directories-first" # List files
alias lt="eza -TL 3 --icons --group-directories-first" # Tree
alias zz="cd .." # Go up one directory
alias rmd="rm -rfvI" # Remove files/directories with confirmation

# Abbreviations for commonly used commands
abbr -a -g cat bat # Use bat instead of cat
abbr -a -g cd z # Use z for cd
# abbr -a -g grep rg # Use rg instead of grep

# Function to create and change into a new directory
function mkcd
    mkdir $argv[1]
    cd $argv[1]
end

# ----- SYSTEM MANAGEMENT -----
function update
    echo "Updating RPM packages"
    sudo dnf update --refresh
    echo
    echo "Updating Flatpaks"
    flatpak update
end

# ----- NVM -----
function nvm-default # sets the default node version used by nvm.fish
    if test (count $argv) -eq 0
        echo "Usage nvm-default <version>"
        echo "Ex. : nvm-default v22.13.1"
        return 1
    end
    set --universal nvm_default_version $argv
end

# ----- BUN -----
# Set up Bun package manager
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# ----- PNPM ----- 
# pnpm
set -gx PNPM_HOME "/home/eden/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# ---- Path -----
set -Ux fish_user_paths /home/eden/.local/bin $fish_user_paths
