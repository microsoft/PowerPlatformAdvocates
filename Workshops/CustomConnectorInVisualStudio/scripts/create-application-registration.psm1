<#
.SYNOPSIS
Creates the Power Fx to create an environment variable in Dataverse.

.DESCRIPTION
Used to create the Power Fx (that can be executed using pac pfx) to create an envrionment variable with a specific schema name, display name, type, and value.

.PARAMETER schemaName
The solution prefix for the environment variable.

.PARAMETER displayName
The display name of the environment variable.

.PARAMETER type
The type - either String or Secret.

.PARAMETER value
The value of the environment variable.

.EXAMPLE
Create-ApplicationRegistration -schemaName "ppa" -displayName "App1" -type "Srring" -value "Value1"
#>
function GetUpsertEnvironmentVariablePfx($schemaName,$displayName,$type,$value) {
    Write-Host "Environment Variable '$schemaName' with value '$value'"
    $envVarCreateScript = @"
    // ----------------------------------------------------
    // Environment Variable ${$displayName}
    // ----------------------------------------------------

    // Create if it doesn't exist
    If(IsBlank(LookUp('Environment Variable Definitions','Schema Name'="${schemaName}")),
        Collect('Environment Variable Definitions',
            {
                'Schema Name':"${schemaName}",
                'Display Name':"${displayName}",
                'Is Required':'Is Required (Environment Variable Definitions)'.No,
                Type:'Type (Environment Variable Definitions)'.${type}
            }
        );
    );

    // Delete the current value
    If(!IsBlank(LookUp('Environment Variable Values', ThisRecord.'Environment Variable Definition'.'Environment Variable Definition' = LookUp('Environment Variable Definitions','Schema Name'="${schemaName}").'Environment Variable Definition')),
        Remove(
            'Environment Variable Values',
                LookUp('Environment Variable Values',
                ThisRecord.'Environment Variable Definition'.'Environment Variable Definition' = LookUp('Environment Variable Definitions','Schema Name'="${schemaName}").'Environment Variable Definition'
            )
        );
    );

    // Add the value
    Collect('Environment Variable Values',
        {
            'Environment Variable Definition':LookUp('Environment Variable Definitions','Schema Name'="${schemaName}"),
            'Schema Name':GUID(),
            'Value':"${value}",
            Owner:LookUp('Environment Variable Definitions','Schema Name'="${schemaName}").'Created By'
        }
    );
"@;
    return $envVarCreateScript;
}

<#
.SYNOPSIS
Adds a redirect URL to an application registration in Azure Active Directory.

.DESCRIPTION
The AddRedirectUrlToApp function is used to register a redirect URL for an application in Azure Active Directory. It checks if the user is logged in to Azure CLI, retrieves the object ID of the application, and updates the redirect URL list with the new URL.

.PARAMETER appId
The ID of the application registration.

.PARAMETER redirectUrl
The redirect URL to be added.

.EXAMPLE
AddRedirectUrlToApp -appId "12345678-1234-5678-1234-567890abcdef" -redirectUrl "https://example.com/redirect"

This example adds the redirect URL "https://example.com/redirect" to the application registration with the specified ID.

.NOTES
This function requires the Azure CLI to be installed and the user to be logged in. Run 'az login' to log in to Azure CLI.
#>
function AddRedirectUrlToApp {
    param(
        [Parameter(Mandatory=$true)]
        [string]$appId,
        [Parameter(Mandatory=$true)]
        [string]$redirectUrl
    )

    # Check if the user has logged in
    $user = az account show --query user.name -o tsv
    if ($? -eq $false) {
        Write-Error "You must be logged in to Azure CLI to run this script. Run 'az login' to log in."
        return
    }

    # Get the object id of the application
    $objectid=$(az ad app show --id $appId --query id --output tsv)
    $redirecttype="web"
    $graphurl="https://graph.microsoft.com/v1.0/applications/$objectid"
    Write-Host  "Registering Redirect Url ${redirectUrl}"
    $currentRedirectUrls = az rest --method GET --uri $graphurl --query "$redirecttype.redirectUris" | ConvertFrom-Json
    if ($null -eq $currentRedirectUrls) {
        $currentRedirectUrls = @()
    }
    $currentRedirectUrls += $redirectUrl
    $newRedirectUrls =($currentRedirectUrls | ConvertTo-Json -Compress) -replace '"', "'"
    if ($currentRedirectUrls.Count -le 1) {
        $newRedirectUrls = "[$newRedirectUrls]"
    }
    az rest --method PATCH --uri $graphurl --headers "Content-Type=application/json" --body "{'$redirecttype':{'redirectUris':$newRedirectUrls}}"
}

<#
.SYNOPSIS
Registers a new application and secret in Azure Active Directory (AAD) and creates environment variables in Dataverse.

.DESCRIPTION
The RegisterApplicationAndSecret function is used to automate the process of registering a new application and secret in Azure Active Directory (AAD) and creating environment variables in Dataverse.
This function performs the following steps:
1. Checks if the user is logged in to Azure CLI and Power Apps CLI.
2. Prompts the user to confirm the current environment and subscription.
3. Creates a new application registration in AAD.
4. Registers a Postman redirect URL for the application.
5. Creates a new client secret and stores it in a specified key vault.
6. Adds API permissions to the application.
7. Retrieves the necessary information (Tenant ID, Application ID, OAuth 2.0 endpoints) for creating environment variables in Dataverse.
8. Creates environment variables in Dataverse using the Power Apps CLI.
9. Grants admin consent for the delegated scope permission.
10. Returns the details of the new application.

.PARAMETER newAppName
The display name of the new application.

.PARAMETER apiAppName
The display name of the API application that the application will access.

.PARAMETER apiUserAccessScope
The scope of the API access.

.PARAMETER keyVaultName
The name of the key vault where the client secret will be stored.

.PARAMETER solutionPrefix
The solution prefix used for naming the environment variables.

.EXAMPLE
RegisterApplicationAndSecret -newAppName "MyApp" -apiAppName "MyAPI" -apiUserAccessScope "access_scope" -keyVaultName "MyKeyVault" -solutionPrefix "ppa"

This example registers a new application with the display name "MyApp", API application with the display name "MyAPI", and access scope "access_scope". The client secret is stored in the "MyKeyVault" key vault, and the environment variables in Dataverse are prefixed with "MySolution".

.NOTES
This function requires the Azure CLI and Power Apps CLI to be installed and logged in.

.LINK
https://docs.microsoft.com/en-us/cli/azure/
https://docs.microsoft.com/en-us/powerapps/developer/data-platform/powerapps-cli
#>
function RegisterApplicationAndSecret {
    param(
        [Parameter(Mandatory=$true)]
        [string]$newAppName,
        [Parameter(Mandatory=$true)]
        [string]$apiAppName,
        [Parameter(Mandatory=$true)]
        [string]$apiUserAccessScope,
        [Parameter(Mandatory=$true)]
        [string]$keyVaultName,
        [Parameter(Mandatory=$true)]
        [string]$solutionPrefix
    )

    $ErrorActionPreference = "Stop";
    $WarningPreference = "SilentlyContinue";

    try {

        Write-Host "Checking Access"

        # Check if the user has logged in
        $user = az account show --query user.name -o tsv
        if ($? -eq $false) {
            Write-Error "You must be logged in to Azure CLI to run this script. Run 'az login' to log in."
            return
        }


        # Check if the user is authorized with the pac cli
        $user = pac org who
        if ($? -eq $false) {
            Write-Error "You must be logged in to Power Apps CLI to run this script. Run 'pac auth' to log in."
            return
        }

        # Get the environment name that the user is currentl authenticated for the Power Apps CLI and check that they are happy with this
        $environment = pac env who --json | ConvertFrom-Json
        $environmentName = $environment.FriendlyName
        $subscriptionName = az account show --query name --output tsv
        Write-Host @"
You are currently authenticated to the Power Apps CLI for the environment '${environmentName}' in the subscription '${subscriptionName}'

Do you want to continue? (Y/N)
"@ -ForegroundColor Yellow

        $confirm = Read-Host 

        if ($confirm.ToUpper() -ne 'Y') {
            Write-Host "Exiting"
            return
        }

        # Check that the application does not already exist
        $existingApp = az ad app list --query "[?displayName=='$newAppName']" | ConvertFrom-Json
        if ($null -ne $existingApp)
        {
            throw "An application with the name '$newAppName' already exists"
        }

        # Check that the API application exists
        $apiApp = az ad app list --query "[?displayName=='$apiAppName']" | ConvertFrom-Json
        if ($null -eq $apiApp)
        {
            throw "The API application '$apiAppName' does not exist. Please check you have run all the steps before this script"
        }

        # Create the application registration
        Write-Host  "Registering Application '$newAppName'"
        $subscriptionId = az account show --query id -o tsv
        # Check that there is an active subscription
        if ($null -eq $subscriptionId)
        {
            throw "No active subscription found. Please run 'az account set --subscription <subscription name or id>' to set the active subscription"
        }

        $app = az ad app create --display-name $newAppName --query appId -o tsv 
        if ($? -eq $false) {
            throw $_.Exception
        }

        $redirectUrl = "https://oauth.pstmn.io/v1/callback";
        Write-Host  "Registering Postman Redirect Url ${redirecturl}"
        AddRedirectUrlToApp -appId:$app -redirectUrl:$redirectUrl
        if ($? -eq $false) {
            throw $_.Exception
        }

        # Create a new client secret and store it
        Write-Host  "Creating Client Secret"
        $secret = az ad app credential reset --id $app --query password -o tsv
        if ($? -eq $false) {
            throw $_.Exception
        }

        $keyVaultResourceGroup = az keyvault show --name $keyVaultName --query "resourceGroup" -o tsv
        $vaultSecretName = "${apiAppName}-${app}-secret"
        
        Write-Host  "Adding Client Secret to key vault '$keyVaultName'"
        az keyvault secret set --name $vaultSecretName --vault-name $keyVaultName --value $secret >> $null
        if ($? -eq $false) {
            throw $_.Exception
        }

        # Add the API permission to the application
        Write-Host  "Adding API access to '${apiAppName}'"
        $apiApp = az ad app list --query "[?displayName=='$apiAppName']" | ConvertFrom-Json
        if ($? -eq $false) {
            throw $_.Exception
        }
        if ($null -eq $apiApp)
        {
            throw "Could not find the API application '$apiAppName'"
        }

        $apiId = $apiApp.appId
        $scope = $apiApp.api.oauth2PermissionScopes | Where-Object { $_.value -eq "$apiUserAccessScope" } | Select-Object -First 1
        $scopeId = $scope.id  

        Write-Host  "Adding Permissions to the application scope '${apiUserAccessScope}"
        az ad app permission add --id $app --api $apiId --api-permissions "$scopeId=Scope"  >> $null
        if ($? -eq $false) {
            throw $_.Exception
        }


        # Get Tenant ID, Application ID, OAuth 2.0 authorization endpoint (v2), OAuth 2.0 token endpoint (v2)
        $tenantId = az account show --query tenantId -o tsv
        $authEndpoint = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/authorize"
        $tokenEndpoint = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"

       
        $tenantIdEnvVarName = "${solutionPrefix}_${apiAppName}_TenantId";
        $appIdEnvVarName = "${solutionPrefix}_${apiAppName}_AppId";
        $secretEnvVarName = "${solutionPrefix}_${apiAppName}_Secret";
        $resourceUrlEnvVarName = "${solutionPrefix}_${apiAppName}_ResourceUrl";
        $scopeEnvVarName = "${solutionPrefix}_${apiAppName}_Scope";
        $hostEnvVarName = "${solutionPrefix}_${apiAppName}_Host";

        $pfxScript = "";

        $pfxScript += GetUpsertEnvironmentVariablePfx `
            -schemaName:$tenantIdEnvVarName  `
            -displayName:"${apiAppName} Tenant Id" `
            -type:"String" `
            -value:$tenantId
            
        $pfxScript += GetUpsertEnvironmentVariablePfx `
            -schemaName:$appIdEnvVarName `
            -displayName:"${apiAppName} AppId" `
            -type:"String" `
            -value:$app

        $pfxScript += GetUpsertEnvironmentVariablePfx `
            -schemaName:$secretEnvVarName `
            -displayName:"${apiAppName} Secret" `
            -type:"Secret" `
            -value:"/subscriptions/${subscriptionId}/resourceGroups/${keyVaultResourceGroup}/providers/Microsoft.KeyVault/vaults/${keyVaultName}/secrets/${vaultSecretName}"

        $pfxScript += GetUpsertEnvironmentVariablePfx `
            -schemaName:$resourceUrlEnvVarName `
            -displayName:"${apiAppName} Resource Url"`
            -type:"String" `
            -value:"api://${apiId}"

        $pfxScript += GetUpsertEnvironmentVariablePfx `
            -schemaName:$scopeEnvVarName `
            -displayName:"${apiAppName} Scope" `
            -type:"String" `
            -value:"api://${apiId}/${apiUserAccessScope}"

        $pfxScript += GetUpsertEnvironmentVariablePfx `
            -schemaName:$hostEnvVarName `
            -displayName:"${apiAppName} Host" `
            -type:"String" `
            -value:""
        
        Write-Host "Creating Environment Variables in Dataverse"
        Set-Content -Path .\create-env-vars.pfx -Value $pfxScript
        pac pfx run --file "create-env-vars.pfx" >> $null
        if ($? -eq $false) {
            throw $_.Exception
        }

        # Grant admin consent for all users in the tenant to use this delegated scope permission
        # Do this here so that the api has time to register
        Write-Host  "Granting Admin Permissions to the application scope '${apiUserAccessScope}"
        az ad app permission admin-consent --id $app
        if ($? -eq $false) {
            throw $_.Exception
        }

        # return the new application details
        Write-Host  @"
----------------------------------------------------
Connector Auth
----------------------------------------------------
Client ID: @environmentVariables("${appIdEnvVarName}")
Client Secret: @environmentVariables("${secretEnvVarName}")
Authorization URL: https://login.microsoftonline.com
Tenant ID: @environmentVariables("${tenantIdEnvVarName}")
Resource URL: @environmentVariables("${resourceUrlEnvVarName}")
Scope: @environmentVariables("${scopeEnvVarName}")
----------------------------------------------------
Postman Auth
----------------------------------------------------
Header Prefix: Bearer
Grant type: Authorization Code
Auth URL: ${authEndpoint}
Access Token URL: ${tokenEndpoint}
Client ID: ${app}
Client Secret: ${secret}
Scope: api://${apiId}/${apiUserAccessScope}
----------------------------------------------------
Tenant: ${tenantId}
Auth Url: ${authEndpoint}
Token Url: ${tokenEndpoint}
----------------------------------------------------
"@ -ForegroundColor Green

        return $app;
    }
    catch {
        Write-Error  "Error: $_";
        Write-Host @"
        Do you want to delete the application registration '$app' and key vault secret? (Y/N)
"@ -ForegroundColor Yellow
        
        $confirm = Read-Host 
        if ($confirm.ToUpper() -ne 'Y') {
            Write-Error "Deleting Application Reigistration and Key Vault Secret";
            DeleteApplicationRegistrationAndSecret -apiAppName:$apiAppName -app:$app  -keyVaultName:$keyVaultName
        }

        return $_.Exception
    }
    $ErrorActionPreference = "Continue"
}





<#
.SYNOPSIS
Deletes an application registration and its associated secret from Azure Active Directory and Azure Key Vault.

.DESCRIPTION
The DeleteApplicationRegistrationAndSecret function deletes an application registration and its associated secret from Azure Active Directory and Azure Key Vault that was created using RegisterApplicationAndSecret.
It takes the API app name, application ID, and Key Vault name as input parameters.

.PARAMETER apiAppName
The name of the API app.

.PARAMETER appId
The ID of the application registration.

.PARAMETER keyVaultName
The name of the Azure Key Vault.

.EXAMPLE
DeleteApplicationRegistrationAndSecret -apiAppName "MyApiApp" -appId "12345678-1234-1234-1234-1234567890AB" -keyVaultName "MyKeyVault"

This example demonstrates how to delete an application registration and its associated secret from Azure Active Directory and Azure Key Vault.

#>
Function DeleteApplicationRegistrationAndSecret {
    param(
        [Parameter(Mandatory=$true)]
        [string]$apiAppName,
        [Parameter(Mandatory=$true)]
        [string]$appId,
        [Parameter(Mandatory=$true)]
        [string]$keyVaultName
    )

    $vaultSecretName = "${apiAppName}-${appId}-secret"

    # Delete the application registration and Key Vault secret
    Write-Host  "Deleting Application Registration '$appId'"
    az ad app delete --id $appId >> $null

    Write-Host  "Deleting secret '$vaultSecretName' from key vault '$keyVaultName'"
    az keyvault secret delete --name $vaultSecretName --vault-name $keyVaultName >> $null
}
