@minLength(1)
param parContainerRegistryName string = 'crmarjtst'

@allowed([
  'northeurope'
  'westeurope'
])
param parLocation string = 'northeurope'

@allowed([
  'basic'
  'standard'
])
param parContainerRegistrySku string = 'basic'

param parStorageAccountNames array = [
  'stmarjicttst001'
  'stmarjicttst002'
]

@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_GRS'
])
param parStorageAccountSku string = 'Standard_LRS'

@allowed([
  'Hot'
  'Cool'
])
param parStorageAccountAccessTier string = 'Hot'
module cr 'modules/containerRegistry.bicep' = {
  params: {
    name: parContainerRegistryName
    location: parLocation
    sku: parContainerRegistrySku
  }
}

module st 'br:crmarjtst.azurecr.io/bicepmodules/storageaccount:v1.0.1' = [for storageAccountName in parStorageAccountNames: {
  params: {
    name: storageAccountName
    sku:parStorageAccountSku
    accessTier: parStorageAccountAccessTier
  }
}]

output storageAccounts array = [for (name, i) in parStorageAccountNames: {
  name: st[i].outputs.outStorageAccountName
  id: st[i].outputs.outStorageAccountId
}]
