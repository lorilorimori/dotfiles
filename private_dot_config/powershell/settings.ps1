# Set default shell options
# UTF-8 output encoding for compatibility with PowerShell < 7
$OutputEncoding = [System.Text.Encoding]::UTF8

# tab completion from history
# PSReadLine may not be avaibale as a directive in non-interracatble sessiobns
try {
    Set-PSReadlineOption -PredictionSource History
} catch {}
