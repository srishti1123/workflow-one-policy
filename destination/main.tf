resource "newrelic_notification_destination" "destination" {
  for_each = var.alert_destination

  account_id = each.value.account_id
  name       = each.value.notification_destination_name 
  type       = each.value.notification_destination_type
  
  property {
    key   = each.value.key_destination      
    value = each.value.notification_email
  }
}
