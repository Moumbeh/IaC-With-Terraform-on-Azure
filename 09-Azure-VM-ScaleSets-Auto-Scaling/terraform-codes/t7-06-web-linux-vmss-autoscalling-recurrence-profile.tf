/*
# Auto Scaling monitor
resource "azurerm_monitor_autoscale_setting" "web_vmss_autoscale" {
  name = "${local.resource_name_prefix}-web-vmss-profiles"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  target_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
  # Notification block
  notification {
    email {
      send_to_subscription_administrator = true
      send_to_subscription_co_administrator = true
      custom_emails = [ "admin@contoso.com" ]
    }
  }
  # Default Profile
  profile {
    name = "default"
  # Capacity Block
  capacity {
    default = 2
    minimum = 2
    maximum = 6
  }  
  # CPU METRIC RULES
  ## SCALE OUT
  rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Percentage CPU"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 75
    }
  }
  ## Scale In
   rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Percentage CPU"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 25
    }
  }
  ## End of CPU Metric Rule
  ### Start Available Memory Bytes Metric Rules
  ## Scale Out
   rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Available Memory Bytes"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 1073741824
    }
  }
  ## Scale In
   rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Available Memory Bytes"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 2147483648
    }
  }
  ## End of Memory Bytes Rule
  ### Start of LB SYN Count Metric (to test scaleset you can comment it out)
  ## Scale Out
  rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "SYNCount"
      metric_resource_id = azurerm_lb.web_lb.id
      metric_namespace = "Microsoft.Network/loadBalancers"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 10
    }
  }
  ## Scale In
  rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "SYNCount"
      metric_resource_id = azurerm_lb.web_lb.id
      metric_namespace = "Microsoft.Network/loadBalancers"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 10
    }
  }
  ## End of LB SYN Count Metric Rule
  } # End of Profile 1
  #### Profile 2 - Week Days ####
  ## Major Changes in this Block
# 1. Capacity Block Values Change - Week Days (Minimum = 4, default = 4, Maximum = 20)
# 2. Recurrence Block for Week Days
# Profile-2: Recurrence Profile - Week Days
  profile {
    name = "profile-2-weekdays"
  # Capacity Block     
    capacity {
      default = 4
      minimum = 4
      maximum = 20
    }
  # Recurrence Block for Week Days (5 days)
    recurrence {
      timezone = "Eastern Standard Time"
      days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
      hours = [0]
      minutes = [0]      
    }  
     # CPU METRIC RULES
  ## SCALE OUT
  rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Percentage CPU"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 75
    }
  }
  ## Scale In
   rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Percentage CPU"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 25
    }
  }
  ## End of CPU Metric Rule
  ### Start Available Memory Bytes Metric Rules
  ## Scale Out
   rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Available Memory Bytes"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 1073741824
    }
  }
  ## Scale In
   rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Available Memory Bytes"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 2147483648
    }
  }
  ## End of Memory Bytes Rule
  ### Start of LB SYN Count Metric (to test scaleset you can comment it out)
  ## Scale Out
  rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "SYNCount"
      metric_resource_id = azurerm_lb.web_lb.id
      metric_namespace = "Microsoft.Network/loadBalancers"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 10
    }
  }
  ## Scale In
  rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "SYNCount"
      metric_resource_id = azurerm_lb.web_lb.id
      metric_namespace = "Microsoft.Network/loadBalancers"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 10
    }
  }
  ## End of LB SYN Count Metric Rule
  } # End of Profile 2 
  ###  Profile-3: Recurrence Profile  - Weekends ####
  ## Major Changes in this Block
# 1. Capacity Block Values Change - Weekends (Minimum = 3, default = 3, Maximum = 20)
# 2. Recurrence Block for Weekends
# Profile-3: Recurrence Profile - Weekends
  profile {
    name = "profile-3-weekends"
  # Capacity Block     
    capacity {
      default = 3
      minimum = 3
      maximum = 6
    }
  # Recurrence Block for Weekends (2 days)
    recurrence {
      timezone = "Eastern Standard Time"
      days = ["Saturday", "Sunday"]
      hours = [0]
      minutes = [0]      
    }
    # CPU METRIC RULES
  ## SCALE OUT
  rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Percentage CPU"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 75
    }
  }
  ## Scale In
   rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Percentage CPU"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 25
    }
  }
  ## End of CPU Metric Rule
  ### Start Available Memory Bytes Metric Rules
  ## Scale Out
   rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Available Memory Bytes"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 1073741824
    }
  }
  ## Scale In
   rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Available Memory Bytes"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 2147483648
    }
  }
  ## End of Memory Bytes Rule
  ### Start of LB SYN Count Metric (to test scaleset you can comment it out)
  ## Scale Out
  rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "SYNCount"
      metric_resource_id = azurerm_lb.web_lb.id
      metric_namespace = "Microsoft.Network/loadBalancers"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 10
    }
  }
  ## Scale In
  rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "SYNCount"
      metric_resource_id = azurerm_lb.web_lb.id
      metric_namespace = "Microsoft.Network/loadBalancers"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 10
    }
  }
  ## End of LB SYN Count Metric Rule
  } # End of Profile 3
  ## Major Changes in this Block
# 1. Capacity Block Values Change  (Minimum = 5, default = 5, Maximum = 20)
# 2. Fixed  Block for a specific day
# Profile-4: Fixed Profile for a Specific Day
  profile {
    name = "profile-4-fixed-profile"
  # Capacity Block     
    capacity {
      default = 5
      minimum = 5
      maximum = 20
    }
  # Fixed Block for a specific day
    fixed_date {
      timezone = "Eastern Standard Time"
      start    = "2022-07-05T00:00:00Z"  # CHANGE TO THE DATE YOU ARE TESTING
      end      = "2022-07-05T23:59:59Z"  # CHANGE TO THE DATE YOU ARE TESTING
    }
    # CPU METRIC RULES
  ## SCALE OUT
  rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Percentage CPU"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 75
    }
  }
  ## Scale In
   rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Percentage CPU"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 25
    }
  }
  ## End of CPU Metric Rule
  ### Start Available Memory Bytes Metric Rules
  ## Scale Out
   rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Available Memory Bytes"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 1073741824
    }
  }
  ## Scale In
   rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "Available Memory Bytes"
      metric_resource_id = azurerm_linux_virtual_machine_scale_set.web_vmss.id
      metric_namespace = "microsoft.compute/virtualmachinescalesets"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 2147483648
    }
  }
  ## End of Memory Bytes Rule
  ### Start of LB SYN Count Metric (to test scaleset you can comment it out)
  ## Scale Out
  rule {
    scale_action {
      direction = "Increase"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "SYNCount"
      metric_resource_id = azurerm_lb.web_lb.id
      metric_namespace = "Microsoft.Network/loadBalancers"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "GreaterThan"
      threshold = 10
    }
  }
  ## Scale In
  rule {
    scale_action {
      direction = "Decrease"
      type = "ChangeCount"
      value = 1
      cooldown = "PT5M"
    }
    metric_trigger {
      metric_name = "SYNCount"
      metric_resource_id = azurerm_lb.web_lb.id
      metric_namespace = "Microsoft.Network/loadBalancers"
      time_grain = "PT1M"
      statistic = "Average"
      time_window = "PT5M"
      time_aggregation = "Average"
      operator = "LessThan"
      threshold = 10
    }
  }
  ## End of LB SYN Count Metric Rule
  } # End of Profile 4
}
*/