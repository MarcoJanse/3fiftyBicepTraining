resource storageAccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: 'stmaja3fiftylab001'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties:{
    accessTier: 'Cool'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}
