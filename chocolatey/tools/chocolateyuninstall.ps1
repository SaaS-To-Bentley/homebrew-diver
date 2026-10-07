$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# The app's files go with the package folder. What Diver keeps for each user —
# its history and its settings — is left for a reinstall to pick up.
$shortcut = Join-Path ([Environment]::GetFolderPath('CommonPrograms')) 'Diver.lnk'
if (Test-Path $shortcut) {
  Remove-Item $shortcut -Force
}

# Diver registers diver:// for the current user each time it starts. Left
# behind, the handler would point at an executable that is gone; one written
# by another copy of Diver is not this package's to remove.
$handler = 'HKCU:\Software\Classes\diver'
$command = (Get-ItemProperty -Path "$handler\shell\open\command" -ErrorAction SilentlyContinue).'(default)'
if ($command -and $command.IndexOf($toolsDir, [StringComparison]::OrdinalIgnoreCase) -ge 0) {
  Remove-Item -Path $handler -Recurse -Force
}
