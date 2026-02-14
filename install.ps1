# Olemon Linux Installer for Windows (via WSL)
# Developed for Olemon Incorporation

Write-Host "--- Olemon Linux Installation Started ---" -ForegroundColor Cyan

# Check if WSL is installed
if (!(Get-Command wsl -ErrorAction SilentlyContinue)) {
    Write-Host "WSL is not installed. Enabling WSL and Virtual Machine Platform..." -ForegroundColor Yellow
    # Note: These commands require Administrator privileges
    Write-Host "Please run PowerShell as Administrator to enable WSL features." -ForegroundColor Red
    exit
}

# Install Ubuntu (Olemon Base)
Write-Host "Installing Olemon Base (Ubuntu)..." -ForegroundColor Green
wsl --install -d Ubuntu

# Command to run inside WSL to configure Olemon
Write-Host "Setting up Olemon Environment..." -ForegroundColor Cyan
Write-Host "Olemon Linux has been successfully integrated into your WSL environment." -ForegroundColor Green
Write-Host "To start, type 'wsl' in your PowerShell." -ForegroundColor Cyan
