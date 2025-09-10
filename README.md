# Windows 10 Cleanup Script

This PowerShell script helps make your Windows 10 laptop faster by cleaning up unnecessary files, caches, and optimizing system performance.  

## ✨ Features
- Clears **Windows Temp** and **User Temp** files  
- Empties **Recycle Bin**  
- Cleans **Windows Update cache**  
- Deletes **Prefetch files**  
- Clears **Edge/IE browser cache**  
- Optionally disables **unnecessary startup apps**  
- Optimizes your drive (**defrag for HDD / trim for SSD**)  
- Flushes **DNS cache**

---

## 📋 Prerequisites
- Windows 10  
- Administrator rights  
- PowerShell  

---

## 🚀 How to Run

### 1. Save the Script
1. Open **Notepad**.  
2. Copy the script from [`cleanup.ps1`](cleanup.ps1).  
3. Save it as `cleanup.ps1` on your **Desktop**.  
   - File name: `cleanup.ps1`  
   - Save as type: **All Files**

### 2. Run PowerShell as Administrator
1. Press `Start`, type `PowerShell`.  
2. Right-click **Windows PowerShell** → **Run as administrator**.

### 3. Allow Script Execution (one-time setup)
Run this command in PowerShell:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

Type Y and press Enter.
```
### 4. Navigate to Desktop and Run
```
cd $HOME\Desktop
.\cleanup.ps1
```

### ⚡ Optional

If you want a double-click .bat file that automatically launches this script, create a new file cleanup.bat with the following content:

```
@echo off
PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0cleanup.ps1"
pause
```
Save `cleanup.bat` in the same folder as `cleanup.ps1` and double-click it anytime for quick cleanup.

🔹 Steps to Use

Place both files (cleanup.ps1 and cleanup.bat) in the same folder (e.g., Desktop).

Right-click cleanup.bat → Run as administrator.

The .bat file will automatically call cleanup.ps1 with the right permissions.

Wait for the script to finish → Restart your PC.