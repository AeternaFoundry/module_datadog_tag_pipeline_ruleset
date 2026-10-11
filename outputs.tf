output "tag_pipeline_rulesets_id" {
  description = "Map of id values across all tag_pipeline_rulesets, keyed the same as var.tag_pipeline_rulesets except keys with no id are omitted"
  value       = { for k, v in datadog_tag_pipeline_ruleset.tag_pipeline_rulesets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "tag_pipeline_rulesets_enabled" {
  description = "Map of enabled values across all tag_pipeline_rulesets, keyed the same as var.tag_pipeline_rulesets except keys with no enabled are omitted"
  value       = { for k, v in datadog_tag_pipeline_ruleset.tag_pipeline_rulesets : k => v.enabled if v.enabled != null }
}
output "tag_pipeline_rulesets_name" {
  description = "Map of name values across all tag_pipeline_rulesets, keyed the same as var.tag_pipeline_rulesets except keys with no name are omitted"
  value       = { for k, v in datadog_tag_pipeline_ruleset.tag_pipeline_rulesets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "tag_pipeline_rulesets_position" {
  description = "Map of position values across all tag_pipeline_rulesets, keyed the same as var.tag_pipeline_rulesets except keys with no position are omitted"
  value       = { for k, v in datadog_tag_pipeline_ruleset.tag_pipeline_rulesets : k => v.position if v.position != null }
}
output "tag_pipeline_rulesets_rules" {
  description = "Map of rules values across all tag_pipeline_rulesets, keyed the same as var.tag_pipeline_rulesets except keys with no rules are omitted"
  value       = { for k, v in datadog_tag_pipeline_ruleset.tag_pipeline_rulesets : k => v.rules if v.rules != null && length(v.rules) > 0 }
}
output "tag_pipeline_rulesets_version" {
  description = "Map of version values across all tag_pipeline_rulesets, keyed the same as var.tag_pipeline_rulesets except keys with no version are omitted"
  value       = { for k, v in datadog_tag_pipeline_ruleset.tag_pipeline_rulesets : k => v.version if v.version != null }
}

