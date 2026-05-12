Connect-MgGraph -Scopes "Device.Read.All"

$devices = Get-MgDeviceManagementManagedDevice -All
$noncompliant = $devices | Where-Object { $_.ComplianceState -ne "compliant" }

$noncompliant | Export-Csv "./noncompliant-devices.csv" -NoTypeInformation
Write-Host "Export complete."
