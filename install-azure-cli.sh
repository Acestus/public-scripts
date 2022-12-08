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


az connectedmachine extension create -name "AzureMonitorLinuxAgent" --location "eastus2" --resource-group "cxlab" --machine-name ubuntu-02 --type "AzureMonitorLinuxAgent" --publisher "Microsoft.Azure.Monitor"






# Download the installation package.
wget https://aka.ms/azcmagent -O ~/Install_linux_azcmagent.sh

# Install the Azure Connected Machine agent.
bash ~/Install_linux_azcmagent.sh


