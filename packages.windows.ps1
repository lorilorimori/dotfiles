winget install chezmoi
winget install Task.task

winget install Microsoft.PowerShell
winget install Microsoft.PowerToys

winget install Volta.Volta
winget install astral-sh.uv

Invoke-WebRequest `
    -Uri https://aka.ms/vs/17/release.ltsc.17.8/vs_buildtools.exe `
    -OutFile ~\AppData\Local\Temp\vs_buildtools.exe
Start-Process `
    -Wait `
    -PassThru `
    -FilePath ~\AppData\Local\Temp\vs_buildtools.exe `
    -ArgumentList (
        '--passive',
        '--wait',
        '--norestart',
        '--nocache',
        '--add', 'Microsoft.VisualStudio.Component.Roslyn.Compiler',
        '--add', 'Microsoft.Component.MSBuild',
        '--add', 'Microsoft.VisualStudio.Component.CoreBuildTools',
        '--add', 'Microsoft.VisualStudio.Workload.MSBuildTools',
        '--add', 'Microsoft.VisualStudio.Component.VC.CoreBuildTools',
        '--add', 'Microsoft.VisualStudio.Component.VC.Tools.x86.x64',
        '--add', 'Microsoft.VisualStudio.Component.VC.Redist.14.Latest',
        '--add', 'Microsoft.VisualStudio.Component.VC.CMake.Project',
        '--add', 'Microsoft.VisualStudio.Component.VC.ATL',
        '--add', 'Microsoft.VisualStudio.Component.VC.ASAN',
        '--add', 'Microsoft.VisualStudio.Component.TextTemplating',
        '--add', 'Microsoft.VisualStudio.Component.VC.CoreIde',
        '--add', 'Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Core',
        '--add', 'Microsoft.VisualStudio.Component.VC.Llvm.ClangToolset',
        '--add', 'Microsoft.VisualStudio.Component.VC.Llvm.Clang',
        '--add', 'Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Llvm.Clang',
        '--add', 'Microsoft.VisualStudio.Component.Windows10SDK.20348',
        '--add', 'Microsoft.VisualStudio.Workload.VCTools'
    )

Invoke-WebRequest `
    -Uri https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe `
    -OutFile ~\AppData\Local\Temp\rustup-init.exe

~\AppData\Local\Temp\rustup-init.exe `
    --quiet `
    --profile minimal `
    --default-host x86_64-pc-windows-msvc `
    -y

cargo install ripgrep fd-find --locked


# SSH Server
try {
    Add-WindowsCapability -Online -Name OpenSSh.Server -ErrorAction Stop
    Set-Service -Name sshd -StartupType Automatic
    Start-Service -Name sshd
    New-NetFirewallRule -Name sshd -DisplayName "OpenSSH Server (sshd)" -Service sshd -Enabled True -Direction Inbound -Protocol TCP -Action Allow -Profile Any
} catch {
    Write-Warning "OpenSSH Server setup failed: $_"
}

# SSH agent
try {
    Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
    Start-Service ssh-agent
} catch {
    Write-Warning "SSH Agent setup failed: $_"
}
