
variable "channel_id" {
  type = string
}
variable "workflows" {
  type = map(object({
    name                    = string
    muting_rules_handling   = string
    filter_name             = string
    filter = string
    filter_attribute        = string
    filter_operator         = string
   // filter_values           = list(string)
   // notification_channel_name = string
  }))
}
variable "policy_id" {
  type =string
}