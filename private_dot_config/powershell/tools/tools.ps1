$toolsPath = "$env:PATH_PS_CONFIG_DIR/tools"

Get-ChildItem -LiteralPath $toolsPath -Filter "tools.*.ps1" | ForEach-Object {
    . $_.FullName
}
