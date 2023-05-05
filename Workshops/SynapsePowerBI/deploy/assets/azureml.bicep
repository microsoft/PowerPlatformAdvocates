param logAnalyticsName string
param appInsightsName string
param location string
param amlWorkspaceName string
param keyVaultId string
param containerRegistryName string
param synapseWorkspaceId string
param synapseSparkPoolId string
param amlStorageName string

resource serengetiLogWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsName
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}

resource serengetiAppInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId:serengetiLogWorkspace.id
    
  }
}

//todo : swelection of sku
resource serengetiContainerRegistry 'Microsoft.ContainerRegistry/registries@2022-12-01' = {
  name: containerRegistryName
  location: location
  sku: {
    name: 'Standard'
  }
}

resource serengetiAmlstorage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: amlStorageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    isHnsEnabled:false
  }
}


resource serengetiAml 'Microsoft.MachineLearningServices/workspaces@2022-10-01' = {
  name: amlWorkspaceName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties:{
    storageAccount: serengetiAmlstorage.id
    keyVault: keyVaultId
    applicationInsights: serengetiAppInsights.id
    containerRegistry: serengetiContainerRegistry.id
  }
}

resource synapseIntegration 'Microsoft.MachineLearningServices/workspaces/linkedServices@2020-09-01-preview' = {
  parent: serengetiAml
  location: location
  name: 'synapseIntegration'
  properties: {
    linkedServiceResourceId: synapseWorkspaceId
    linkType: 'Synapse'
  }

  identity: {
    type: 'SystemAssigned'
  }
}


resource synapseSparkPool 'Microsoft.MachineLearningServices/workspaces/computes@2022-12-01-preview' = {
  name: 'synapsedefpool'
  location: location
  parent: serengetiAml

  identity: {
    type: 'SystemAssigned'
    }
  
  properties: {
    resourceId: synapseSparkPoolId
    computeType: 'SynapseSpark'
    workspaceName: serengetiAml.name
  }
}

