<#
.SYNOPSIS
    This script restricts anonymous enumeration of shares.

.NOTES
    Author          : Kolton Brockhouse
    LinkedIn        : https://www.linkedin.com/in/kolton-brockhouse-08b552158/
    GitHub          : https://github.com/koltonbrockhouse
    Date Created    : 2025-09-25
    Last Modified   : 2025-09-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000150

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-SO-000150.ps1

# Define the registry path, value name, and the value to enable the setting
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$regName = "RestrictAnonymous"
$regValue = 1

try {
    # The 'Lsa' registry key is a standard system path.
    # We'll set the value directly. A value of '1' enables the restriction.
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord -Force

    # Output a success message to confirm the action
    Write-Host "✅ Successfully restricted anonymous enumeration of SAM accounts and shares." -ForegroundColor Green
}
catch {
    # If an error occurs, display it and suggest a common solution
    Write-Error "❌ Failed to set the registry value. Please ensure you are running PowerShell as an Administrator. Error: $_"
}
