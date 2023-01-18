# PowerShell and Azure CLI deployments

## AVD Accelerator Baseline

### Azure CLI

```bash
az deployment create \
  --template-file workload/bicep/deploy-baseline.bicep \
  --parameters @workload/bicep/parameters/deploy-baseline-parameters-example.json \
  --parameters avdWorkloadSubsId=<subscriptionId> \
  --parameters deploymentPrefix=<deploymentPrefix> \
  --parameters avdVmLocalUserName=<localUserName> \
  --parameters avdVmLocalUserPassword=<LocalUserPassword> \
  --parameters avdIdentityServiceProvider="<IdentityServiceProvider>" \
  --parameters avdIdentityDomainName=<DomainJoinUserName> \
  --parameters avdDomainJoinUserName=<domainName>  \
  --parameters avdDomainJoinUserPassword=<DomainJoinUserPassword \
  --parameters existingHubVnetResourceId=<hubVnetResourceId>  \
  --parameters customDnsIps=<customDNSservers>  \
  --parameters avdEnterpriseAppObjectId=<wvdAppObjectId> \
  --parameters avdVnetPrivateDnsZone=true \
  --parameters avdVnetPrivateDnsZoneFilesId="<PrivateDnsZoneFilesId>" \
  --parameters avdVnetPrivateDnsZoneKeyvaultId="<PrivateDnsZoneKeyvaultId>" \
  --avdDeployMonitoring=true \
  --deployAlaWorkspace=true \
  --location "eastus"
```

### PowerShell

```powershell
$avdVmLocalUserPassword = Read-Host -Prompt "Local user password" -AsSecureString
$avdDomainJoinUserPassword = Read-Host -Prompt "Domain join password" -AsSecureString
New-AzSubscriptionDeployment `
  -TemplateFile workload/bicep/deploy-baseline.bicep `
  -TemplateParameterFile workload/bicep/parameters/deploy-baseline-parameters-example.json `
  -avdWorkloadSubsId "<subscriptionId>" `
  -deploymentPrefix "<deploymentPrefix>" `
  -avdVmLocalUserName "<localUserName>" `
  -avdVmLocalUserPassword $avdVmLocalUserPassword `
  -avdIdentityServiceProvider "<IdentityServiceProvider>" `
  -avdIdentityDomainName "<domainJoinUserName>" `
  -avdDomainJoinUserName "<domainJoinUserName>"  `
  -avdDomainJoinUserPassword $avdDomainJoinUserPassword `
  -existingHubVnetResourceId "<hubVnetResourceId>"  `
  -customDnsIps "<customDNSservers>"  `
  -avdEnterpriseAppObjectId "<wvdAppObjectId>" `
  -avdVnetPrivateDnsZone $true `
  -avdVnetPrivateDnsZoneFilesId "<PrivateDnsZoneFilesId>" `
  -avdVnetPrivateDnsZoneKeyvaultId "<PrivateDnsZoneKeyvaultId>" `
  -avdDeployMonitoring $true `
  -deployAlaWorkspace $true `
  -Location "eastus2"
```

## Optional: Custom Image Build deployment

### Azure CLI

```bash
az deployment create \
  --template-file workload/bicep/deploy-custom-image.bicep \
  --parameters @workload/bicep/parameters/deploy-custom-image-parameters-example.json \
  --parameters sharedServicesSubId="<subscriptionId>" \
  --Location "eastus"
```

### PowerShell

```powershell
New-AzSubscriptionDeployment `
  -TemplateFile workload/bicep/deploy-custom-image.bicep `
  -TemplateParameterFile workload/bicep/parameters/deploy-custom-image-parameters-example.json `
  -sharedServicesSubId "<subscriptionId>" `
  -Location "eastus2"
```

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit [https://cla.opensource.microsoft.com](https://cla.opensource.microsoft.com).

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft
trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/legal/intellectualproperty/trademarks).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.

## Reporting issues

Microsoft Support is not yet handling issues for any published tools in this repository. However, we would like to welcome you to open issues using GitHub [issues](https://github.com/Azure/avdaccelerator/issues) to collaborate and improve these tools.