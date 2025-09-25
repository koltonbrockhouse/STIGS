<#
.SYNOPSIS
    This script configures the system to ignore NetBIOS name release requests except from WINS servers.

.NOTES
    Author          : Kolton Brockhouse
    LinkedIn        : https://www.linkedin.com/in/kolton-brockhouse-08b552158/
    GitHub          : https://github.com/koltonbrockhouse
    Date Created    : 2025-09-25
    Last Modified   : 2025-09-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000035.ps1 
#>

# Define the registry path, value name, and the value needed to enable the setting
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netbt\Parameters"
$regName = "NoNameReleaseOnDemand"
$regValue = 1

try {
    # The 'Netbt\Parameters' path should already exist on a standard Windows installation,
    # so we'll proceed directly to setting the value.
    
    # Set the registry value. A value of '1' configures the computer to ignore 
    # NetBIOS name release requests except from WINS servers.
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord -Force

    # Output a success message to confirm the action
    Write-Host "✅ Successfully configured 'NoNameReleaseOnDemand' to protect against NetBIOS DoS attacks." -ForegroundColor Green
}
catch {
    # If an error occurs, display it and suggest a common solution
    Write-Error "❌ Failed to set the registry value. Please ensure you are running PowerShell as an Administrator. Error: $_"
}
