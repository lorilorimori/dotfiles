export PATH_ZSH_CONFIG_DIR="$HOME/.config/zsh"

# zinit plugin manager
source "$PATH_ZSH_CONFIG_DIR/zinit.zsh"

# system configuration
source "$PATH_ZSH_CONFIG_DIR/shell.zsh"
source "$PATH_ZSH_CONFIG_DIR/input.zsh"
source "$PATH_ZSH_CONFIG_DIR/path.sh"

source "$PATH_ZSH_CONFIG_DIR/aliases/aliases.sh"
source "$PATH_ZSH_CONFIG_DIR/tools/tools.sh"

# comptibility configs, etc.
source "$PATH_ZSH_CONFIG_DIR/_private/init.sh"
