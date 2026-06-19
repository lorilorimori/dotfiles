# PowerShell configuration initializer

$env:PATH_PS_CONFIG_DIR = "$HOME/.config/powershell"

. "$env:PATH_PS_CONFIG_DIR/shell.ps1"
. "$env:PATH_PS_CONFIG_DIR/aliases/aliases.ps1"
. "$env:PATH_PS_CONFIG_DIR/tools/tools.ps1"
