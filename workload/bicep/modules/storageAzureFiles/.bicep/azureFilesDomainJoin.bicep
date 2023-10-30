// ========== //
// Parameters //
// ========== //

@sys.description('Extension deployment name.')
param name string

@sys.description('Location where to deploy compute services.')
param location string

@sys.description('Location for the AVD agent installation package.')
param baseScriptUri string

param file string

@sys.description('Arguments for domain join script.')
param scriptArguments string

@secure()
@sys.description('Domain join user password.')
param domainJoinUserPassword string

// =========== //
// Variable declaration //
// =========== //

// Convert the secret from KeyVault to a SecureString. This should be possible because the CSE and the DSC are running on the same computer.
// Need to escape (by doubling up) any single quotes from the password to avoid the password string from being terminated prematurely.
var varscriptArgumentsWithPassword = '${scriptArguments} -DomainAdminUserPassword (ConvertTo-SecureString -AsPlainText -Force \'${replace(domainJoinUserPassword, '\'', '\'\'')}\') -Verbose'

// =========== //
// Deployments //
// =========== //

// Add Azure Files to AD DS domain.
resource dscStorageScript 'Microsoft.Compute/virtualMachines/extensions@2022-08-01' = {
  name: '${name}/AzureFilesDomainJoin'
  location: location
  properties: {
    publisher: 'Microsoft.Compute'
    type: 'CustomScriptExtension'
    typeHandlerVersion: '1.10'
    autoUpgradeMinorVersion: true
    settings: {}
    protectedSettings: {
      fileUris: array(baseScriptUri)
      commandToExecute: 'powershell -ExecutionPolicy Unrestricted -File ${file} ${varscriptArgumentsWithPassword}'
    }
  }
}
