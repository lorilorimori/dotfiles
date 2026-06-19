# PowerShell configuration initializer

$env:PATH_PS_CONFIG_DIR = "$HOME/.config/powershell"

# misc configuration
. "$env:PATH_PS_CONFIG_DIR/settings.ps1"

# aliases
. "$env:PATH_PS_CONFIG_DIR/aliases/aliases.ps1"

# tools
. "$env:PATH_PS_CONFIG_DIR/tools/tools.ps1"
