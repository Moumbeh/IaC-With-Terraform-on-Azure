## Title
Azure Bastion Host and Service using Terraform

## Service to be created
1. Azure Bastion Host 
2. Azure Bastion Service 
1. Terraform Input Variables
2. azurerm_public_ip
3. azurerm_network_interface
4. azurerm_linux_virtual_machine
5. Terraform Null Resource `null_resource`
6. Terraform File Provisioner
7. Terraform remote-exec Provisioner
8. azurerm_bastion_host
9. Terraform Output Values


## Pre-requisite Note: Create SSH Keys for Azure Linux VM (already created just run the code)

# Create Folder
cd terraform-codes/
mkdir ssh-keys

# Create SSH Key
cd ssh-ekys
ssh-keygen \
    -m PEM \
    -t rsa \
    -b 4096 \
    -C "azureuser@myserver" \
    -f terraform-azure.pem 
Important Note: Please no passphrase is need 

# List Files
ls -lrt ssh-keys/

# Files Generated after above command 
Public Key: terraform-azure.pem.pub -> Rename as terraform-azure.pub
Private Key: terraform-azure.pem

# Permissions for Pem file
chmod 400 terraform-azure.pem

### Important Note about Azure Bastion Service
- It takes close to 10 to 15 minutes to create this service.

azurerm_bastion_host.bastion_host: Still creating... [10m50s elapsed]
azurerm_bastion_host.bastion_host: Still creating... [11m0s elapsed]
azurerm_bastion_host.bastion_host: Still creating... [11m10s elapsed]
azurerm_bastion_host.bastion_host: Still creating... [11m20s elapsed]
azurerm_bastion_host.bastion_host: Still creating... [11m30s elapsed]
azurerm_bastion_host.bastion_host: Creation complete after 11m35s 