﻿$ErrorActionPreference = 'Stop';

$url64          = 'https://download.unity3d.com/download_unity/ca3ffb99bcc6/TargetSupportInstaller/UnitySetup-Mac-Server-Support-for-Editor-2021.3.27f1.exe'
$checksum64     = '8a635da66a031770ada145859b89aa77186d66fe94f95f4a3c01d34134e63d49'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
