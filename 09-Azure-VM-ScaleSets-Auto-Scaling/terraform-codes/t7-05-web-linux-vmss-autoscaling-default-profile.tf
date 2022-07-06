
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
}
