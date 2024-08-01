variable "alert_destination" {
  type = map(object({
    account_id= number
    notification_destination_name= string
    notification_destination_type=string
    key_destination=string
     notification_email =string
  }))
}