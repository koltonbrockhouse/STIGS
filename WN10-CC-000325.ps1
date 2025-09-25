<#
.SYNOPSIS
    This PowerShell script disables the automatic signing in of the last interactive user after a system-initiated restart.

.NOTES
    Author          : Kolton Brockhouse
    LinkedIn        : https://www.linkedin.com/in/kolton-brockhouse-08b552158/
    GitHub          : https://github.com/koltonbrockhouse
    Date Created    : 2025-09-25
    Last Modified   : 2025-09-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000325

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000325.ps1 
#>


# Define the registry path, value name, and desired value
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$regName = "DisableAutomaticRestartSignOn"
$regValue = 1

try {
    # Check if the registry path exists. If not, create it.
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set the registry value. This command creates the value if it's missing
    # or updates it if it already exists.
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord -Force

    # Output a success message to confirm the action
    Write-Host "✅ Successfully set '$regName' to '$regValue'." -ForegroundColor Green
}
catch {
    # If an error occurs, display it
    Write-Error "❌ Failed to set the registry value. Please ensure you are running PowerShell as an Administrator. Error: $_"
}
