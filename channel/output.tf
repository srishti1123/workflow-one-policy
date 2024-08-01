output "channel_id" {
  value = newrelic_notification_channel.channel["browser-alert-channel"].id
}