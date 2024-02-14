Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Scope AllUsers
Install-Module -Name Microsoft.PowerApps.PowerShell -AllowClobber -Scope AllUsers

# Replace these with the values from your environment
$environmentID = "750120dc-071f-ebd0-953d-d08ec4ca5508"
$connectorSearch = "*orderadmin-5fconnector*"

# Delete all connections for a specific connector so that it can too be deleted
Get-AdminPowerAppConnection -EnvironmentName $environmentID |
Where-Object { $_.ConnectorName -like $connectorSearch } |
ForEach-Object { 
    Remove-AdminPowerAppConnection -EnvironmentName $environmentID -ConnectorName $_.ConnectorName -ConnectionName $_.ConnectionName
}