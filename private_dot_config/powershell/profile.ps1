# PowerShell profile - cross-platform loader
# This file is deployed to the appropriate profile location on each platform
#
# On Windows, copy this file as `profile.ps1` to Documents\PowerShell\
# to apply settings for current user across all sessions

$env:PATH_PS_CONFIG_DIR = "$HOME/.config/powershell"

if (Test-Path "$env:PATH_PS_CONFIG_DIR/powershell.ps1")
{
    . "$env:PATH_PS_CONFIG_DIR/powershell.ps1"
}
