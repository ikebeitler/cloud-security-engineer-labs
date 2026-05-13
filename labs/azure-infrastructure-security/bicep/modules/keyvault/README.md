# Key Vault + Diagnostic Settings (Bicep Module)

This module deploys an Azure Key Vault with:

- RBAC-enabled access control
- Soft delete + purge protection
- Public network disabled
- Azure services bypass enabled
- Diagnostic settings streaming to Log Analytics Workspace

This follows Azure security best practices for cloud security engineering.

---

## Parameters

| Name | Type | Description |
|------|------|-------------|
| `name` | string | Name of the Key Vault |
| `location` | string | Azure region |
| `tags` | object | Resource tags |
| `logAnalyticsWorkspaceId` | string | Workspace to send logs to |
| `skuName` | string | Key Vault SKU (default: standard) |
| `enablePurgeProtection` | bool | Prevents permanent deletion |
| `enableSoftDelete` | bool | Enables soft delete |

---

## Example Deployment

```bash
az deployment group create \
  --resource-group rg-cloudsec-lab \
  --template-file main.bicep \
  --parameters logAnalyticsWorkspaceId="/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace>"
