If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
	Exit
}

$filePath = Read-Host "Please input the folder path location for Deploy-Application.ps1: "

Set-Location -LiteralPath $filePath

Powershell.exe -WindowStyle hidden{.\Deploy-Application.ps1}