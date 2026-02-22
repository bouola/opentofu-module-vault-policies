variable "vault_hcl_policies_directory_path" {
  type        = string
  description = "The absolute or relative path to the directory containing Vault policy files in HCL format (.hcl)."
}

variable "vault_policies" {
  type = list(object({
    name    = string
    content = string
  }))
  description = "List of Vault policies to create with their content."
  default     = []
}
