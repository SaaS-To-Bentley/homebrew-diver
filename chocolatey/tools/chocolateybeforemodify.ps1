# Windows will not replace a running executable, so an upgrade or uninstall
# closes this package's copy of Diver first.
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Get-Process -Name 'Diver' -ErrorAction SilentlyContinue |
  Where-Object { $_.Path -and $_.Path.StartsWith($toolsDir, [StringComparison]::OrdinalIgnoreCase) } |
  Stop-Process -Force
