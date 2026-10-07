$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$appDir = Join-Path $toolsDir 'Diver'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $appDir
  url64bit       = 'https://github.com/SaaS-To-Bentley/homebrew-diver/releases/download/v1.0.0-315/Diver-1.0.0-315-windows-x64.zip'
  checksum64     = 'a71e0fe00804424db3816ab821055f767a1deb420349af933fdc67f4a6f5e671'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

# The shim Chocolatey puts on the PATH starts Diver and returns, rather than
# holding a console open for as long as the window is.
New-Item -ItemType File -Force -Path (Join-Path $appDir 'Diver.exe.gui') | Out-Null

$programs = [Environment]::GetFolderPath('CommonPrograms')
Install-ChocolateyShortcut -ShortcutFilePath (Join-Path $programs 'Diver.lnk') `
  -TargetPath (Join-Path $appDir 'Diver.exe') -WorkingDirectory $appDir
