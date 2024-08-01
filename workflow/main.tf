resource "newrelic_workflow" "workflow" {
  for_each = var.workflows

  name                 = each.value.name
  muting_rules_handling = each.value.muting_rules_handling

  issues_filter {
    name = each.value.filter_name
    type = each.value.filter      

    predicate {
      attribute = each.value.filter_attribute
      operator  = each.value.filter_operator
      values    = [var.policy_id]
    }
  }

  destination {
    channel_id = var.channel_id
    
  }
}