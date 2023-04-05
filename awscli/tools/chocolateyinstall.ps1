﻿$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://s3.amazonaws.com/aws-cli/AWSCLI32PY3-1.27.106.msi'
$checksum   = '73acf0568bdaf8cce72d2ac4e02e245e8ba341a427bb265aee3a859801d844f8'
$url64      = 'https://s3.amazonaws.com/aws-cli/AWSCLI64PY3-1.27.106.msi'
$checksum64 = '9ac627ecd0ddef90b8d29a60acd9702479fd0dc0c4fa38ccc42d1c3914654f62'
 
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64
  softwareName  = 'AWS Command Line Interface*'
  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
