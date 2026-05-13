param name string = 'kv-cloudsec-lab'
param location string = resourceGroup().location
param tags object = {
  environment: 'lab'
  owner: 'isaac-beitler'
}
param logAnalyticsWorkspaceId string
param skuName string = 'standard'
param enablePurgeProtection bool = true
param enableSoftDelete bool = true
