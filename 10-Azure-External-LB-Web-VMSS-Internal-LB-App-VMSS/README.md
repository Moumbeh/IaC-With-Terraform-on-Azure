# Title: Azure Internal Load Balancer using Terraform
description: Create Azure Internal Load Balancer using Terraform
---

## Concepts
1. Azure Storage Account with Azure File Share to copy Apache Config Files to Web VMs from local desktop Terraform Working Directory
2. Azure NAT Gateway for Outbound Connectivity from App VMs when associated to Internal LB (App LB)
3. App Linux VMs placed in App Subnets
4. Internal Standard Load Balancer (App LB)
### Azure Resources
1. azurerm_storage_account
2. azurerm_storage_container
3. azurerm_storage_blob
4. Terraform Input Variables
5. Terraform locals block
6. azurerm_public_ip
7. azurerm_nat_gateway
8. azurerm_subnet_nat_gateway_association
9. azurerm_network_interface
10. azurerm_linux_virtual_machine
11. Terraform Output Values
12. azurerm_lb
13. azurerm_lb_backend_address_pool
14. azurerm_lb_probe
15. azurerm_lb_rule
16. azurerm_network_interface_backend_address_pool_association
17. terraform.tfvars

### Update to Files
1. t7-03-web-linux-vmss-resource.tf: Update locals block custom data

### New Files: Storage Account
- Total 3 uses in this usecase demo
1. Copy app1.conf to Web VMSS Linux VMs where in that app1.conf file will be used by Web VMSS Linux VMs to proxy to App Internal LB
2. When building end to end SSL using Azure Application Gateways and Azure VMSS (Internet -> AGLB(SSL) -> VMSS (SSL)) this container helps to push SSL Certificates, Private Keys to VMSS Apache.
3. When using Azure Application Gateways, it needs Error Pages related Static Website on Azure Storage Container, so this will be used for the usecase. 
- Using Terraform Provisioners to push files to VMs which we can access them from our local desktop via internet. 
1. t10-01-storage-account-input-variables.tf
2. t10-02-storage-account.tf
3. t10-03-storage-account-outputs.tf
4. app-scripts/app1.conf

### New Files: NAT Gateway
- As we are creating Internal SLB and Internal App VMs in `appsubnet` the default outbound for that respective subnet provided by Azure default will be overrided and our VM's will not be able to connect to Internet for installing `httpd` binaries using `custom_data`
- We need to deploy the `Azure NAT Gateway` for `appsubnet` to enable outbound connectivity for Virtual Machines in `appsubnet` when associated with Internal LB
1. t11-01-azure-nat-gateway-resource.tf
2. t11-02-azure-nat-gateway-outputs.tf

### New Files: App Linux VMSS
- Create AppTier Linux VM Scale Set
1. t12-01-app-linux-vmss-input-variables.tf
2. t12-02-app-linux-vmss-nsg.tf
3. t12-03-app-linux-vmss-resource.tf
4. t12-04-app-linux-vmss-autoscaling-cpu-usage.tf
5. t12-05-app-linux-vmss-outputs.tf

### New Files: App Load Balancer (Internal Standard Load Balancer)
1. t13-02-app-loadbalancer-resource.tf
2. t13-03-app-loadbalancer-outputs.tf