workflows = {
  browser-alert-workflows = {
    name                      = "browser-alert-workflows"
    muting_rules_handling     = "NOTIFY_ALL_ISSUES"
    filter_name               = " Filter-EXAMPLE"
    filter =               "FILTER"
    filter_attribute          = "labels.policyIds"
    filter_operator           = "EXACTLY_MATCHES"
   // filter_values             = ["critical"]
   // notification_channel_name = "browser-alert-channel"


  }
}