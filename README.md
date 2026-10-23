# WakeUpPc
This program can handle the daily routine of powering on a large fleet of computers on a local network by using the devices MAC addresses.
## Setup instructions
### 1. How to find the MAC address in Windows
To find a device's address within a local network, you need to enter a simple command into the CMD or PowerShell shell in Windows.
```powershell
arp -a 
```
### 2. Address format
* A MAC address is represented as a sequence of numbers(bytes), for example: 11-22-33-44-55-66.
* It should be inserted into the code in place of the comment, enclosed in double quotation marks. If there are multiple MAC addresses, each one should be enclosed in double quotation marks and separated by commas.
```powershell
# Example of inserting multiple addresses into code
$MacList = @(
    "11-22-33-44-55-66",
    "AA-BB-CC-DD-EE-FF"
)
```
## Converting a script into an .exe file
If you want to convert a PowerShell script (`.ps1`) into a standalone executable file (`.exe`), the easiest way is to use the popular **PS2EXE** module.
### Step 1. Install the PS2EXE Module

1. Open **PowerShell** as an Administrator.
2. Run the following command to install the module from the PowerShell Gallery repository:
   ```powershell
   Install-Module -Name PS2EXE
   ```
3. If prompted to install the NuGet provider or trust the repository, press `Y` (Yes) and hit `Enter`.
4. Allow script execution on your system (if you haven't done so already):
   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```

### Step 2. Convert the Script to EXE

To perform the conversion, use the `Invoke-PS2EXE` command (or its shorthand `ps2exe`), specifying the path to your source file and the name of the future executable:

```powershell
Invoke-PS2EXE .\script.ps1 .\script.exe
```

#### Useful Compilation Parameters:
* `-noConsole` — Hides the black console window (ideal for scripts with a graphical user interface / GUI).
* `-requireAdmin` — Forces the resulting `.exe` to request Administrator privileges upon launch.
* `-iconFile .\icon.ico` — Adds a custom icon to your EXE file.
* `-x64` — Compiles a 64-bit version of the executable.

*Example command using advanced parameters:*
```powershell
Invoke-PS2EXE .\script.ps1 .\script.exe -noConsole -requireAdmin -iconFile .\icon.ico -x64
```
