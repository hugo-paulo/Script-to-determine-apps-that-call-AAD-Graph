Connect-MgGraph -Scopes "Application.Read.All"

Get-MgApplication -Filter "requiredResourceAccess/Any(x: x/resourceAppId eq '00000002-0000-0000-c000-000000000000')" -CountVariable appCount -ConsistencyLevel "eventual" -All -debug

$AadGraphApps = Get-MgApplication -Filter "requiredResourceAccess/Any(x: x/resourceAppId eq '00000002-0000-0000-c000-000000000000')" -CountVariable appCount -ConsistencyLevel "eventual" -All | Format-List DisplayName, AppId, CreatedDateTime 


# $AadGraphApps | Export-Csv -Path "C:\<path to file>\AADGraphAppList.csv" 

$AadGraphApps | Out-File "C:\<path to file>\AADGraphAppList.csv"

Disconnect-MgGraph