function Create-API-Url ($userName,$repo){
    $apiUrl="https://api.github.com/repos/$userName/$repo/releases";
    "$apiUrl"
}

function Remove-Prereleases ($JsonResponse){
    $JsonResponse | Where-Object { $_.prerelease -eq $false } 
}

function Request-Url-Of-Latest-Version-From-Api($apiUrl){
    $webResponse = Invoke-WebRequest -Uri $ApiUrl

    $JsonResponse = ConvertFrom-Json $webResponse

    $releases = Remove-Prereleases $JsonResponse

    $releases[0].zipball_url
}

$apiUrl = Create-API-Url "adobe-fonts" "source-code-pro"

$releaseUrl = Request-Url-Of-Latest-Version-From-Api $apiUrl