function tx { tar --extract --file $args }

# Compare two files or directories
# diff --text --recursive --color
function dt {
    if ($args.Count -lt 2) {
        throw "dt: requires two paths" }
    $f1 = Get-ChildItem -Recurse -File $args[0] | Get-Content
    $f2 = Get-ChildItem -Recurse -File $args[1] | Get-Content
    Compare-Object `
        -ReferenceObject $f1 `
        -DifferenceObject $f2 `
        -SyncWindow 0
}

function wget-any {
    wget `
      --tries 5 `
      --retry-connrefused `
      --timeout 60 `
      --waitretry 60 `
      --read-timeout 360 `
      --max-redirect 10 `
      --protocol-directories `
      $args
}

function curl-any {
    curl `
      -L `
      --retry 5 `
      --retry-connrefused `
      --connect-timeout 60 `
      --max-time 360 `
      --retry-delay 60 `
      --max-redirs 10 `
      -O `
      $args
}

function ll { Get-ChildItem -Force $args }
function la { Get-ChildItem -Force -Hidden $args }
function l { Get-ChildItem -Name $args }

function yt {
    uv tool run yt-dlp --js-runtimes node --remote-components ejs:github $args -x --audio-quality 0 --split-chapters
}
