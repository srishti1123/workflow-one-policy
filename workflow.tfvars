workflows = {
  browser-alert-workflows = {
    name                      = "Browser Alert Workflow"
    muting_rules_handling     = "NOTIFY_ALL_ISSUES"
    filter_name               = " Filter-EXAMPLE"
    filter =               "FILTER"
    filter_attribute          = "accumulations.tag.team"
    filter_operator           = "IS"
    filter_values             = ["critical"]
    notification_channel_name = "browser-alert-channel"


  }
}