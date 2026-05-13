```powershell
param(
    [int]$DaysInactive = 90
)

Write-Host "Connecting to Microsoft Graph..."
Connect-MgGraph -Scopes "User.Read.All","Directory.Read.All" | Out-Null

$cutoff = (Get-Date).AddDays(-$DaysInactive)

Write-Host "Retrieving users..."
$users = Get-MgUser -All -Property "id,displayName,userPrincipalName,signInActivity"

$stale = @()

foreach ($u in $users) {
    $lastSignIn = $u.SignInActivity.LastSignInDateTime

    if (-not $lastSignIn) {
        # Never signed in
        $stale += [pscustomobject]@{
            DisplayName        = $u.DisplayName
            UserPrincipalName  = $u.UserPrincipalName
            LastSignIn         = "Never"
            DaysSinceLastSignIn = "N/A"
        }
        continue
    }

    $days = (New-TimeSpan -Start $lastSignIn -End (Get-Date)).Days

    if ($days -ge $DaysInactive) {
        $stale += [pscustomobject]@{
            DisplayName        = $u.DisplayName
            UserPrincipalName  = $u.UserPrincipalName
            LastSignIn         = $lastSignIn
            DaysSinceLastSignIn = $days
        }
    }
}

$reportPath = "./stale-accounts-report.csv"
$stale | Export-Csv -Path $reportPath -NoTypeInformation

Write-Host "Report generated: $reportPath"
Write-Host "Total stale accounts found: $($stale.Count)"
