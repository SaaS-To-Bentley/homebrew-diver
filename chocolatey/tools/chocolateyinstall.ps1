$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$appDir = Join-Path $toolsDir 'Diver'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $appDir
  url64bit       = 'https://github.com/SaaS-To-Bentley/homebrew-diver/releases/download/v1.0.0-333/Diver-1.0.0-333-windows-x64.zip'
  checksum64     = 'd4d7eb2d5898ba3489fbeac7dde6265e2fefbf3264a889a3a9e516cda5b8e450'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

# The shim Chocolatey puts on the PATH starts Diver and returns, rather than
# holding a console open for as long as the window is.
New-Item -ItemType File -Force -Path (Join-Path $appDir 'Diver.exe.gui') | Out-Null

$programs = [Environment]::GetFolderPath('CommonPrograms')
Install-ChocolateyShortcut -ShortcutFilePath (Join-Path $programs 'Diver.lnk') `
  -TargetPath (Join-Path $appDir 'Diver.exe') -WorkingDirectory $appDir
