variable "destination_id" {
  type = string
}

variable "alert_channel" {
  type = map(object({
    account_id                   = number
    notification_channel_name   = string
    notification_channel_type   = string
    product                     = string
    key_property = string
    notification_subject        = string
    
  }))
}