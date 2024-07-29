resource "newrelic_alert_policy" "policies" {
  name                = var.alert_policy_name
  incident_preference = var.incident_preference
}
resource "newrelic_nrql_alert_condition" "conditions" {
  for_each = var.alert_conditions
  policy_id                    = newrelic_alert_policy.policies.id
  type                         = each.value.type
  name                         = each.value.name
  enabled                      = each.value.enabled
  violation_time_limit_seconds = each.value.violation_time_limit_seconds  

  nrql {
    query = each.value.query
  }
   critical {
      operator              = each.value.operator
      threshold             = each.value.threshold
      threshold_duration    = each.value.threshold_duration
      threshold_occurrences = each.value.threshold_occurrences
    }
  
  aggregation_window  = each.value.aggregation_window 
  aggregation_method  = each.value.aggregation_method    
  aggregation_delay   = each.value.aggregation_delay 
}
resource "newrelic_notification_destination" "destination" {
  for_each = var.alert_destination

  account_id = each.value.account_id
  name       = each.value.notification_destination_name //email example
  type       = each.value.notification_destination_type
  
  property {
    key   = each.value.key_destination        //email
    value = each.value.notification_email
  }
}

resource "newrelic_notification_channel" "channel" {
  for_each = var.alert_channel

  account_id     = each.value.account_id
  name           = each.value.notification_channel_name
  type           = each.value.notification_channel_type
  destination_id = newrelic_notification_destination.destination.id
  product        = each.value.product
  
  property {
    key   = each.value.key_property        //SUBJEC
    value = each.value.notification_subject
  }
  
}

resource "newrelic_workflow" "workflow" {
  for_each = var.workflows

  name                 = each.value.name
  muting_rules_handling = each.value.muting_rules_handling

  issues_filter {
    name = each.value.filter_name
    type = each.value.filter      //FILTER

    predicate {
      attribute = each.value.filter_attribute
      operator  = each.value.filter_operator
      values    = each.value.filter_values
    }
  }

  destination {
    channel_id = newrelic_notification_channel.channel.id
  }
}
 
 
