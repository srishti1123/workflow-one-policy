browser-policy-conditions = {
  first_input_delay = {
    type                         = "static"
    name                         = "first_input_delay_alert"
    enabled                      = "true"
    violation_time_limit_seconds = 259200
    query                        = "SELECT average(firstInputDelay) AS 'FID (ms)' FROM PageViewTiming WHERE appName = 'relicstaurants/browser2'"
    operator                     = "above"
    threshold                    = 200
    threshold_duration           = 300
    threshold_occurrences        = "all"
    aggregation_window           = 60
    aggregation_method           = "event_flow"
    aggregation_delay            = 120
  }
  cumulative_layout_shift = {
    type                         = "static"
    name                         = "cumulative_layout_shift_alert"
    enabled                      = "true"
    violation_time_limit_seconds = 259200
    query                        = "SELECT average(cumulativeLayoutShift) AS 'CLS' FROM PageViewTiming WHERE appName = 'relicstaurants/browser2'"
    operator                     = "above"
    threshold                    = 0.1
    threshold_duration           = 300
    threshold_occurrences        = "all"
    aggregation_window           = 60
    aggregation_method           = "event_flow"
    aggregation_delay            = 120
  }
  largest_contentful_paint = {
    type                         = "static"
    name                         = "largest_contentful_paint_alert"
    enabled                      = "true"
    violation_time_limit_seconds = 259200
    query                        = "SELECT average(largestContentfulPaint) AS 'LCP (ms)' FROM PageViewTiming WHERE appName = 'relicstaurants/browser2'"
    operator                     = "above"
    threshold                    = 4.5
    threshold_duration           = 300
    threshold_occurrences        = "all"
    aggregation_window           = 60
    aggregation_method           = "event_flow"
    aggregation_delay            = 120
  }
}

alert_destination = {
  browser-alert-destination = {
    account_id                    = 4438260
    notification_destination_name = "browser-alert-destination"
    notification_destination_type = "EMAIL"
    key_destination               = "email"
    notification_email            = "gsrishti111@gmail.com"
  }
}

alert_channel = {
  browser-alert-channel = {
    account_id                    = 4438260
    notification_channel_name     = "browser-alert-channel"
    notification_channel_type     = "EMAIL"
    product                       = "IINT"
    key_property ="subject"
    notification_subject          = "Browser Alert"
    notification_custom_details   = "Custom details about the alert"
    notification_destination_name = "browser-alert-destination"
  }
}

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
