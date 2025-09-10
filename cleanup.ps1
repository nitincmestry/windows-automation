# Windows 10 Cleanup Script
# Run this as Administrator (Right click -> Run with PowerShell)

Write-Host "Starting cleanup... This may take a few minutes." -ForegroundColor Cyan

# 1. Clear Windows Temp files
Write-Host "Clearing Windows Temp files..." -ForegroundColor Yellow
Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

# 2. Clear User Temp files
Write-Host "Clearing User Temp files..." -ForegroundColor Yellow
Remove-Item -Path "$env:LOCALAPPDATA\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

# 3. Empty Recycle Bin
Write-Host "Emptying Recycle Bin..." -ForegroundColor Yellow
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

# 4. Clear Windows Update cache
Write-Host "Clearing Windows Update cache..." -ForegroundColor Yellow
Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
Start-Service -Name wuauserv -ErrorAction SilentlyContinue

# 5. Clear Prefetch files
Write-Host "Clearing Prefetch files..." -ForegroundColor Yellow
Remove-Item -Path "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue

# 6. Clear Edge/Internet Explorer cache
Write-Host "Clearing Edge/IE cache..." -ForegroundColor Yellow
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

# 7. Disable unnecessary startup apps (optional - edit as needed)
Write-Host "Disabling common unnecessary startup apps..." -ForegroundColor Yellow
Get-CimInstance Win32_StartupCommand | ForEach-Object {
    try {
        Write-Host "Disabling: $($_.Name)" -ForegroundColor Red
        Remove-CimInstance -InputObject $_ -ErrorAction SilentlyContinue
    } catch {}
}

# 8. Optimize drives
Write-Host "Optimizing drives (defrag for HDD / trim for SSD)..." -ForegroundColor Yellow
Optimize-Volume -DriveLetter C -Verbose

# 9. Flush DNS cache
Write-Host "Flushing DNS cache..." -ForegroundColor Yellow
ipconfig /flushdns

Write-Host "Cleanup completed! Restart your PC for best performance." -ForegroundColor Green
