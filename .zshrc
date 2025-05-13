# fnm
FNM_PATH="/Users/danieljpgo/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/danieljpgo/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

# starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# eza
alias ls="eza --icons=always"

# bat
alias cat="bat"
export BAT_THEME="pmndrs"

# fzf
source <(fzf --zsh)