resource "datadog_tag_pipeline_ruleset" "tag_pipeline_rulesets" {
  for_each = var.tag_pipeline_rulesets

  name    = each.value.name
  enabled = each.value.enabled

  dynamic "rules" {
    for_each = each.value.rules != null ? each.value.rules : []
    content {
      enabled = rules.value.enabled
      dynamic "mapping" {
        for_each = rules.value.mapping != null ? rules.value.mapping : []
        content {
          destination_key = mapping.value.destination_key
          if_not_exists   = mapping.value.if_not_exists
          if_tag_exists   = mapping.value.if_tag_exists
          source_keys     = mapping.value.source_keys
        }
      }
      name = rules.value.name
      dynamic "query" {
        for_each = rules.value.query != null ? rules.value.query : []
        content {
          dynamic "addition" {
            for_each = query.value.addition != null ? query.value.addition : []
            content {
              key   = addition.value.key
              value = addition.value.value
            }
          }
          case_insensitivity = query.value.case_insensitivity
          if_not_exists      = query.value.if_not_exists
          if_tag_exists      = query.value.if_tag_exists
          query              = query.value.query
        }
      }
      dynamic "reference_table" {
        for_each = rules.value.reference_table != null ? rules.value.reference_table : []
        content {
          case_insensitivity = reference_table.value.case_insensitivity
          dynamic "field_pairs" {
            for_each = reference_table.value.field_pairs != null ? reference_table.value.field_pairs : []
            content {
              input_column = field_pairs.value.input_column
              output_key   = field_pairs.value.output_key
            }
          }
          if_not_exists = reference_table.value.if_not_exists
          if_tag_exists = reference_table.value.if_tag_exists
          source_keys   = reference_table.value.source_keys
          table_name    = reference_table.value.table_name
        }
      }
    }
  }
}

