module "browser-policy" {
  source = "./alerts"

  alert_policy_name   = "BROWSER-POLICY"
  incident_preference = "PER_CONDITION"
  alert_conditions    = var.browser-policy-conditions
  # alert_destination   = var.alert_destination
  # alert_channel       = var.alert_channel
  # workflows           = var.workflows
}

module "destination" {
  source = "./destination"
  alert_destination = var.alert_destination

}
module "channel" {
  source = "./channel"
  destination_id = module.destination.destination_id
  alert_channel = var.alert_channel

}
module "workflow" {
  source = "./workflow"
  channel_id = module.channel.channel_id
  workflows= var.workflows
}