param name string

@allowed([
  'northeurope'
  'westeurope'
])
param location string

@allowed([
  'basic'
  'standard'
])
param sku string

resource cr 'Microsoft.ContainerRegistry/registries@2025-04-01' = {
  name: name
  location: location
  sku: {
    name: sku
  }
}
