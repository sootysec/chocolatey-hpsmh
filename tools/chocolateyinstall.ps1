$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://downloads.hpe.com/pub/softlib2/software1/sc-windows/p1954776237/v143573/cp034023.exe' # download url, HTTPS preferred
$url64      = 'https://downloads.hpe.com/pub/softlib2/software1/sc-windows/p910098843/v143572/cp034022.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64

  softwareName  = 'HPE System Management Homepage*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = '3EB9DA3A928F5594B41DFE60B80DA1882D2ACB55732FBD28FC1D2B6AF5FB9E13'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = 'B0841D7A68B1FF1B76CAA6729169B3DED4769C403807664D01FB82033DCCB678'
  checksumType64= 'sha256' #default is checksumType

  silentArgs   = '/silent' 
}

Install-ChocolateyPackage @packageArgs
