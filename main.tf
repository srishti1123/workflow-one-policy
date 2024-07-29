module "browser-policy" {
  source = "./alerts"

  alert_policy_name   = "BROWSER-POLICY"
  incident_preference = "PER_CONDITION"
  alert_conditions    = var.browser-policy-conditions
  alert_destination   = var.alert_destination
  alert_channel       = var.alert_channel
  workflows           = var.workflows


}