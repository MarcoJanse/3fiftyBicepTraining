param name string = 'stmaja3fiftylab001'

resource existingStorageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' existing = {
  name: 'st${name}'
  scope: resourceGroup('rg-${name}')
}

output existingStorageAccountId string = existingStorageAccount.id
