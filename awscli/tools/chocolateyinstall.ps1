﻿$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://s3.amazonaws.com/aws-cli/AWSCLI32PY3-1.29.67.msi'
$checksum   = 'f5221978d865b8fe80d981cfe760f22ff57a469e1fdc13930d0eb5d5de738f94'
$url64      = 'https://s3.amazonaws.com/aws-cli/AWSCLI64PY3-1.29.67.msi'
$checksum64 = 'd2d8da359c20e7104272ce5af6f3bba6333a6fc45891bad6744ac95e8368d61f'
 
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
