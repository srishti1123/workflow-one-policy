resource "newrelic_notification_channel" "channel" {
  destination_id = var.destination_id
  
  for_each = var.alert_channel

  account_id     = each.value.account_id
  name           = each.value.notification_channel_name
  type           = each.value.notification_channel_type
  //destination_id = newrelic_notification_destination.destination[each.key].id
  product        = each.value.product
  
  property {
    key   = each.value.key_property        
    value = each.value.notification_subject
  }
  
}
