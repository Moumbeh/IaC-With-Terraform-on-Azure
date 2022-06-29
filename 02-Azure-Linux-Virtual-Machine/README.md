Tittle: Azure Linux VM Using Terraform

# Resource to be created 
1. azurerm_public_ip
2. azurerm_network_interface
3. azurerm_network_security_group
4. azurerm_network_inyterface_security_group_association
5. azurerm_network_security_rule
6. azurerm_linux_virtual_machine
6. Terraform local Block for security Rule Ports
7. Terraform 'for_each' Meta-argument
8. Terraform Local Block for defining custom data to Azure Linux Virtual Machine
9. Terraform Outputs for above resources

# Terraform Concepts
Terraform Functions
- [file](https://www.terraform.io/docs/language/functions/file.html)
- [filebase64](https://www.terraform.io/docs/language/functions/filebase64.html)
- [base64encode](https://www.terraform.io/docs/language/functions/base64encode.html)

## Pre-requisite: Create SSH Keys for Azure Linux VM (it has already been created you can just run the code just demo the process)

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
Important Note: If you give passphrase during generation, during everytime you login to VM, you also need to provide passphrase.

# List Files
ls -lrt ssh-keys/

# Files Generated after above command 
Public Key: terraform-azure.pem.pub -> Rename as terraform-azure.pub
Private Key: terraform-azure.pem

# Permissions for Pem file
chmod 400 terraform-azure.pem
```