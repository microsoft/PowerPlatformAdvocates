param location string 
param storageAccountName string 

resource serengetiDataLake 'Microsoft.Storage/storageAccounts@2022-09-01'= {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'storageV2'
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    isHnsEnabled: true
  }

}

  output accountUrl string = serengetiDataLake.properties.primaryEndpoints.dfs
  output resourceId string = serengetiDataLake.id
  output storageAccountName string = serengetiDataLake.name

  // todo: fix secret output
#disable-next-line outputs-should-not-contain-secrets
  output storageAccountKey string = serengetiDataLake.listKeys().keys[0].value

