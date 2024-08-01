variable "browser-policy-conditions" {
  type = map(object({
    type                         = string
    name                         = string
    enabled                      = string
    violation_time_limit_seconds = number
    query                        = string
    operator                     = string
    threshold                    = number
    threshold_duration           = number
    threshold_occurrences        = string
    aggregation_window           = number
    aggregation_method           = string
    aggregation_delay            = number
  }))
}
# va

variable "alert_destination" {
  type = map(object({
    account_id                    = number
    notification_destination_name = string
    notification_destination_type = string
    key_destination               = string
    notification_email            = string
  }))
}
variable "alert_channel" {
  type = map(object({
    account_id                    = number
    notification_channel_name     = string
    notification_channel_type     = string
    product                       = string
    key_property =string
    notification_subject          = string
    //notification_custom_details   = string
    //notification_destination_name = string
  }))
}

variable "workflows" {
  type = map(object({
    name                      = string
    muting_rules_handling     = string
    filter_name               = string
    filter = string
    filter_attribute          = string
    filter_operator           = string
    //notification_channel_name = string
  }))
}

