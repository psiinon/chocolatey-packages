import-module au

$releases = 'https://github.com/cypress-io/cypress/releases/latest'

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
          "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
      
        ".\tools\chocolateyinstall.ps1" = @{
          "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
          "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $regex = '.zip$'
    $url = $download_page.links | ? href -match $regex | select -First 1 -expand href | % { 'https://github.com' + $_ }

    $version = $url -split '/|.zip$' | select -Last 1 -Skip 1
    
    @{
        URL32 = "https://download.cypress.io/desktop"
        Version = $version.Replace('v','')
        ReleaseNotes = "https://github.com/cypress-io/cypress/releases/tag/${version}"
    }
}

update -ChecksumFor 32
