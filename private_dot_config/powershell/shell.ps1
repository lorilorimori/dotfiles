# Set default shell options and initialize Starship prompt
# UTF-8 output encoding for compatibility with PowerShell < 7
$OutputEncoding = [System.Text.Encoding]::UTF8

try {
    # tab completion from history
    # PSReadLine may not be avaibale as a directive in non-interracatble sessiobns
    Set-PSReadlineOption -PredictionSource HistoryAndPlugin
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -EditMode Windows
    # zsh-like еab completion
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
} catch {
    Write-Warning "PSReadLine configuration failed: $_"
}

# Starship prompt init (lazy check — avoids startup cost if not installed)
if ($null -ne (Get-Command starship -ErrorAction SilentlyContinue)) {
    try { Invoke-Expression (&starship init powershell) } catch {}
}
