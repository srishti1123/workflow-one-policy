output "destination_id" {
  value=newrelic_notification_destination.destination["browser-alert-destination"].id
}