function Set-JavlibraryOwned {
    param (
        [object]$AjaxId,
        [object]$JavlibraryUrl,
        [object]$Settings
    )

    try {
        Write-Debug "[$(Get-TimeStamp)][$($MyInvocation.MyCommand.Name)] Function started"
        Write-Debug "[$(Get-TimeStamp)][$($MyInvocation.MyCommand.Name)] AjaxId: $AjaxId"
        Write-Debug "[$(Get-TimeStamp)][$($MyInvocation.MyCommand.Name)] Url: $JavlibraryUrl"
        Invoke-WebRequest -Uri "https://www.javlibrary.com/ajax/ajax_cv_favoriteadd.php" `
            -Method "POST" `
            -Headers @{
            "method"           = "POST"
            "authority"        = "www.javlibrary.com"
            "scheme"           = "https"
            "path"             = "/ajax/ajax_cv_favoriteadd.php"
            "accept"           = "application/json, text/javascript, */*; q=0.01"
            "x-requested-with" = "XMLHttpRequest"
            "user-agent"       = $session.UserAgent
            "origin"           = "https://www.javlibrary.com"
            "sec-fetch-site"   = "same-origin"
            "sec-fetch-mode"   = "cors"
            "sec-fetch-dest"   = "empty"
            "referer"          = $JavlibraryUrl
            "accept-encoding"  = "gzip, deflate, br"
            "accept-language"  = "en-US,en;q=0.9"
            "cookie"           = "timezone=420; over18=18; __cfduid=$SessionCFUID; userid=$($Settings.JavLibrary.username); session=$($Settings.JavLibrary.'session-cookie')"
        } `
            -ContentType "application/x-www-form-urlencoded; charset=UTF-8" `
            -Body "type=2&targetid=$AjaxId" `
            -Verbose:$false
    } catch {
        Write-Error "Error setting owned status for [$JavlibraryUrl]: $PSItem"
    }
}
