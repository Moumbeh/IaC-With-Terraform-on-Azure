# Title: Azure Private DNS Zones using Terraform

## Step-00: Introduction
### Concepts
1. Create Azure Private DNS Zone `mydevopsproject.uk`
2. Register the `Internal LB Static IP` to Private DNS name `applb.mydevopsproject.uk`
3. Update the `app1.conf` which deploys on Web VMSS to Internal LB DNS Name instead of IP Address. 

### Azure Resources
1. azurerm_private_dns_zone
2. azurerm_private_dns_a_record

### New Files: Azure Private DNS Zone
1. c14-01-private-dns-zone-input-variables.tf
2. c14-02-private-dns-zone.tf
3. c14-03-private-dns-zone-outputs.tf

### Update to Files
1. app-scripts/app1.conf

# Azure Private DNS, Internal and External load Balancer design
![azure-external-internal-lb](https://user-images.githubusercontent.com/105049520/177650763-039ad988-d2e3-4684-b166-63ca53dd91f8.JPG)
