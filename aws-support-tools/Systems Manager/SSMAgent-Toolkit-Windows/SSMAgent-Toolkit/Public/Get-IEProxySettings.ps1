<#
  .Synopsis
    Check the value of Internet Explorer proxy value configured under registry.
  .Description
    This is a public function used to check the value of Internet Explorer proxy value configured under registry path "KEY_USERS\S-1-5-18\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings".
  .Example
    Get-IEProxySettings
  .INPUTS
    Key = The path for the Internet Explorer proxy in the registry. Default value: "Registry::HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings".
    Skip = Switch to skip this function if the agent is not installed.
  .OUTPUTS                                                                            
    New-PSObjectResponse -Check "$check" -Status "$value" -Note "$note"
#>
Function Get-IEProxySettings {
  [CmdletBinding()]
  param (
    [String]$Key = "Registry::HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings",
    [Switch]$Skip
  )
  
  $check = "LocalSystem account user Internet Explorer proxy"
  Write-Log -Message "New check....."
  Write-Log -Message "$check"

  Write-Log -Message "Checking IE proxy settings settings from registry location $Key."
  Write-Log -Message "For more information check - https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/security-identifiers-in-windows."
  Write-Log -Message "IE proxy settings mainly used to enable PowerShell to have access to the internet (not Windows Update service)"

  if (-not ($Skip)) {
    If (((Get-Item -Path $Key).GetValue("ProxyEnable") -eq 0) -Or (-not (Test-RegistryValue -Path $Key -Value 'ProxyEnable'))) {
      $value = "N/A"
      $note = "There is no ProxyServer configured"
      Write-Log -Message "There is noProxyServer configured for $check."
      Write-Log -Message "Note: If the instance behind a proxy and PowerShell via run command has a command which needs access to the internet would fail if there are no Internet Explorer proxy settings"
    }
    else {
      $value = "ProxyServer = " + (Get-Item -Path $Key).GetValue("ProxyServer") + ". ProxyOverride list = " + (Get-Item -Path $Key).GetValue("ProxyOverride")
      $note = "Current IE proxy settings for LocalSystem account is " + (Get-Item -Path $Key).GetValue("ProxyServer") + " ProxyServer, and " + (Get-Item -Path $Key).GetValue("ProxyOverride") + " as ProxyOverride list. PowerShell would use these settings"
      Write-Log -Message $note -LogLevel "WARN"
    }
  }
  else {
    $value = "Skip"
    $note = "This test skipped since the service is not available"
    Write-Log -Message "The $check check skipped since the service is not available" -LogLevel "WARN"
  }
  return New-PSObjectResponse -Check "$check" -Status "$value" -Note "$note"
}