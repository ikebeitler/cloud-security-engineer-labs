Connect-MgGraph -Scopes "User.Read.All","Directory.Read.All"

$users = Get-MgUser -All
$results = @()

foreach ($u in $users) {
    $methods = Get-MgUserAuthenticationMethod -UserId $u.Id
    $hasMfa = $methods | Where-Object { $_.AdditionalProperties['@odata.type'] -like "*authenticationMethod*" }

    $results += [pscustomobject]@{
        UserPrincipalName = $u.UserPrincipalName
        MFAEnabled        = if ($hasMfa) { "Yes" } else { "No" }
    }
}

$results | Export-Csv -Path "./mfa-status.csv" -NoTypeInformation
Write-Host "MFA status exported."
