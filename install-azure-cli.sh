sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
        sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-get update
sudo apt-get install azure-cli


az connectedmachine remove --name "AzureMonitorLinuxAgent" --location "eastus2" --resource-group "cxlab" --machine-name ubuntu-02 --type "AzureMonitorLinuxAgent" --publisher "Microsoft.Azure.Monitor


try { $env:SUBSCRIPTION_ID = "3f1d5d7b-12bc-41d3-8e4f-f5e5fa515f41"; $env:RESOURCE_GROUP = "cxlab"; $env:TENANT_ID = "72f988bf-86f1-41af-91ab-2d7cd011db47"; $env:LOCATION = "eastus2"; $env:AUTH_TYPE = "token"; $env:CORRELATION_ID = "1bbffd98-c44a-44f7-ae32-5a2c9c2ef333"; $env:CLOUD = "AzureCloud"; [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest -UseBasicParsing -Uri "https://aka.ms/azcmagent-windows" -TimeoutSec 30 -OutFile "$env:TEMP\install_windows_azcmagent.ps1"; & "$env:TEMP\install_windows_azcmagent.ps1"; if ($LASTEXITCODE -ne 0) { exit 1; } & "$env:ProgramW6432\AzureConnectedMachineAgent\azcmagent.exe" connect --resource-group "$env:RESOURCE_GROUP" --tenant-id "$env:TENANT_ID" --location "$env:LOCATION" --subscription-id "$env:SUBSCRIPTION_ID" --cloud "$env:CLOUD" --correlation-id "$env:CORRELATION_ID"; } catch { $logBody = @{subscriptionId="$env:SUBSCRIPTION_ID";resourceGroup="$env:RESOURCE_GROUP";tenantId="$env:TENANT_ID";location="$env:LOCATION";correlationId="$env:CORRELATION_ID";authType="$env:AUTH_TYPE";operation="onboarding";messageType=$_.FullyQualifiedErrorId;message="$_";}; Invoke-WebRequest -UseBasicParsing -Uri "https://gbl.his.arc.azure.com/log" -Method "PUT" -Body ($logBody | ConvertTo-Json) | out-null; Write-Host -ForegroundColor red $_.Exception; }