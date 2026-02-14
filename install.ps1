# Olemon Linux Installer for Windows PowerShell
# Powered by Olemon Incorporation

$ErrorActionPreference = "Stop"

Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "   WELCOME TO OLEMON LINUX INSTALLER" -ForegroundColor Yellow
Write-Host "===============================================" -ForegroundColor Cyan

# Check for Admin Privileges
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "[-] Error: Please run PowerShell as Administrator." -ForegroundColor Red
    exit
}

try {
    # Enable WSL Features
    Write-Host "[+] Enabling WSL and Virtual Machine Platform..." -ForegroundColor Green
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart | Out-Null
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart | Out-Null

    # Install Ubuntu as the base for Olemon
    Write-Host "[+] Installing Olemon Base (Ubuntu)..." -ForegroundColor Green
    wsl --install -d Ubuntu --no-launch

    Write-Host "[+] Configuring Olemon Sandbox Environment..." -ForegroundColor Cyan
    # Instructions for the user
    Write-Host "`nSUCCESS: Olemon Linux is ready to be configured." -ForegroundColor Green
    Write-Host "1. Type 'wsl' to enter the system." -ForegroundColor White
    Write-Host "2. Run 'curl -s https://raw.githubusercontent.com/mohamed-dev-labs/olemon-linux/main/setup.sh | bash' inside WSL." -ForegroundColor White
    
} catch {
    Write-Host "[-] An error occurred during installation: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "===============================================" -ForegroundColor Cyan
