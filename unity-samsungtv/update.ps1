import-module au

$unity_data = Import-CliXml $PSScriptRoot\..\_unity.xml

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(^[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
        }
        
        ".\unity-samsungtv.nuspec" = @{
            "(\<dependency id=`"unity`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}


function global:au_GetLatest {
  
    $url = $unity_data["url"] + "TargetSupportInstaller/UnitySetup-Samsung-TV-Support-for-Editor-" + $unity_data["version"] + "f" + $unity_data["release"]
    
    
    return @{ URL64 = $url -replace 'http:', 'https:'; Version = $unity_data["version"] }
}

update -ChecksumFor 64
