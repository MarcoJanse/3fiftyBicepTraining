@metadata({
  name: 'storageAccount.bicep'
  description: 'A module for deploying an Azure storage account'
  version: '1.0.1'
})

@minLength(1)
@maxLength(22)
param name string

@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_GRS'
]
)
param sku string

@allowed([
  'Hot'
  'Cool'
])
param accessTier string

@allowed([
  'Enabled'
  'Disabled'
])
param publicNetworkAccess string = 'Disabled'

resource storageAccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: 'st${name}'
  location: resourceGroup().location
  sku: {
    name: sku
  }
  kind: 'StorageV2'
  properties:{
    accessTier: accessTier
    publicNetworkAccess: publicNetworkAccess
    minimumTlsVersion: 'TLS1_2'
  }
}

output outStorageAccountName string = storageAccount.name
output outStorageAccountId string = storageAccount.id
