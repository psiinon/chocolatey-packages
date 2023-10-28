﻿$ErrorActionPreference = 'Stop';

$url64          = 'https://download.unity3d.com/download_unity/4fe6e059c7ef/TargetSupportInstaller/UnitySetup-Android-Support-for-Editor-2022.3.12f1.exe'
$checksum64     = '947b2fe355a57581b9bb61d7afbb7e8fa8044be397520749ae903aa03cec5a37'

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
