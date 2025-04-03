param name string

param location string = resourceGroup().location

@allowed([
  'standard'
  'premium'
])
param skuName string = 'standard'

@allowed([
  'A'
])
param skuFamily string = 'A'

// VARIABLES
var kvname = 'kv-${name}'

resource keyVault 'Microsoft.KeyVault/vaults@2024-11-01' = {
  name: kvname
  location: location
  properties: {
    sku: {
      name: skuName
      family: skuFamily
    }
    tenantId: tenant().tenantId
  }
}
