variable "tag_pipeline_rulesets" {
  description = <<EOT
Map of tag_pipeline_rulesets, attributes below
Required:
    - name
Optional:
    - enabled
    - rules (block):
        - enabled (required)
        - mapping (optional, block):
            - destination_key (optional)
            - if_not_exists (optional)
            - if_tag_exists (optional)
            - source_keys (optional)
        - name (required)
        - query (optional, block):
            - addition (optional, block):
                - key (optional)
                - value (optional)
            - case_insensitivity (optional)
            - if_not_exists (optional)
            - if_tag_exists (optional)
            - query (optional)
        - reference_table (optional, block):
            - case_insensitivity (optional)
            - field_pairs (optional, block):
                - input_column (optional)
                - output_key (optional)
            - if_not_exists (optional)
            - if_tag_exists (optional)
            - source_keys (optional)
            - table_name (optional)
EOT

  type = map(object({
    name    = string
    enabled = optional(bool)
    rules = optional(list(object({
      enabled = bool
      mapping = optional(list(object({
        destination_key = optional(string)
        if_not_exists   = optional(bool)
        if_tag_exists   = optional(string)
        source_keys     = optional(list(string))
      })))
      name = string
      query = optional(list(object({
        addition = optional(list(object({
          key   = optional(string)
          value = optional(string)
        })))
        case_insensitivity = optional(bool)
        if_not_exists      = optional(bool)
        if_tag_exists      = optional(string)
        query              = optional(string)
      })))
      reference_table = optional(list(object({
        case_insensitivity = optional(bool)
        field_pairs = optional(list(object({
          input_column = optional(string)
          output_key   = optional(string)
        })))
        if_not_exists = optional(bool)
        if_tag_exists = optional(string)
        source_keys   = optional(list(string))
        table_name    = optional(string)
      })))
    })))
  }))
}

