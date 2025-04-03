@minLength(1)
param name string

@allowed([
  'Standard_LRS'
  'Standard_ZRS'
]
)
param sku string

@allowed([
  'Hot'
  'Cool'
  'Cold'
])
param accessTier string

resource storageAccount 'Microsoft.Storage/storageAccounts@2018-11-01' = {
  name: 'st${name}'
  location: resourceGroup().location
  sku: {
    name: sku
  }
  kind: 'StorageV2'
  properties:{
    accessTier: accessTier
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}
