param name string = 'maja3fifty'

module keyVault 'modules/keyvault.bicep' = {
  params: {
    name: name
  }
}
