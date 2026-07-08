# PSCompletions
#
# https://github.com/abgox/PSCompletions

try {
    Import-Module PSCompletions
} catch {
    Write-Warning "PSCompletions load failed: $_"
}
