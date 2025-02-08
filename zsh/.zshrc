# ========================
#  Powerlevel10k Instant Prompt
# ========================
# Enable the Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ========================
#  NVM (Node Version Manager) Setup
# ========================
export NVM_DIR="$HOME/.nvm"
# Load nvm and its bash_completion (if available)
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"    # Loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"  # Loads nvm bash_completion

# ========================
#  Theme and Appearance Settings
# ========================
export BAT_THEME="Catppuccin Mocha"

# ========================
#  Aliases
# ========================
alias gst='git status'
alias gcm='git commit -m'
alias zsh='nvim ~/.zshrc'
alias cat="bat"
alias cd="z"
alias ls='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias ll='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --all'

# ========================
#  Powerlevel10k Theme and Configuration
# ========================
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/p10k/.p10k.zsh ]] || source ~/.config/p10k/.p10k.zsh  # Kept original p10k path

# ========================
#  Zsh Plugins
# ========================
# Enable autosuggestions and syntax highlighting.
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ========================
#  FZF (Fuzzy Finder) Setup
# ========================
# Set up fzf key bindings and fuzzy completion.
eval "$(fzf --zsh)"

# ========================
#  Zoxide (Improved 'cd' Functionality)
# ========================
eval "$(zoxide init zsh)"

# ========================
#  Yazi Function for Directory Navigation
# ========================
# Navigate directories using Yazi.
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# ========================
#  Default Editor
# ========================
export EDITOR=nvim
