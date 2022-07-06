
# Title: Azure Virtual Machine Scale Sets Autoscaling with Terraform
t7-05-web-linux-vmss-autoscaling-default-profile contains the default profile (1 scalling Rule)
t7-06-web-linux-vmss-autoscalling-recurrence-profile has been commented out contains 4 profiles (4 scalling Rules) You can run either of the them.

## Pre-requisite: Learn VMSS Autoscaling Concept using Azure Portal
1. Create VMSS
2. Create Autoscaling Default Profile
  - Percentage CPU Rule
  - Available Memory Bytes Rule
  - LB SYN Count Rule
3. Create Autoscaling Recurrence Profile - Weekdays
4. Create Autoscaling Recurrence Profile - Weekends
5. Create Autoscaling Fixed Profile

# Resources 
1. azurerm_monitor_autoscale_setting
- Notification Block
- Profile Block-1: Default Profile
2. Capacity Block
3. Percentage CPU Metric Rules
    1. Scale-Up Rule: Increase VMs by 1 when CPU usage is greater than 75%
    2. Scale-In Rule: Decrease VMs by 1when CPU usage is lower than 25%
4. Available Memory Bytes Metric Rules
    1. Scale-Up Rule: Increase VMs by 1 when Available Memory Bytes is less than 1GB in bytes
    2. Scale-In Rule: Decrease VMs by 1 when Available Memory Bytes is greater than 2GB in bytes
5. LB SYN Count Metric Rules (JUST FOR firing Scale-Up and Scale-In Events for Testing and also knowing in addition to current VMSS Resource, we can also create Autoscaling rules for VMSS based on other Resource usage like Load Balancer)
    1. Scale-Up Rule: Increase VMs by 1 when LB SYN Count is greater than 10 Connections (Average)
    2. Scale-Up Rule: Decrease VMs by 1 when LB SYN Count is less than 10 Connections (Average)    

## Concepts
- VMSS Autoscaling
1. Default Profile
2. Recurrence Profile
3. Fixed Profile
- Each Profile will have following Rules
1. `Percentage CPU` Increase and Decrease Rule
2. `Available Memory Bytes` Increase and Decrease Rule
3. LB `SYN Count` Increase and Decrease Rule