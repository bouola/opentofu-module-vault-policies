# Automatically creates Vault policies from HCL files found in the specified directory.
# This allows for a file-based management of policies, making it easier to track changes via Git.
locals {
  # Policies from HCL files in directory
  file_policies = var.vault_hcl_policies_directory_path != "" ? {
    for file in fileset(var.vault_hcl_policies_directory_path, "**/*.hcl") :
    replace(basename(file), ".hcl", "") => {
      source  = "file"
      content = file("${var.vault_hcl_policies_directory_path}/${file}")
    }
  } : {}

  # Policies from variable
  var_policies = {
    for policy in var.vault_policies :
    policy.name => {
      source  = "variable"
      content = policy.content
    }
  }

  # Merge both sources (file policies take precedence if there's a conflict)
  all_policies = merge(local.var_policies, local.file_policies)
}

resource "vault_policy" "policies" {
  for_each = local.all_policies
  name     = endswith(each.key, "-policy") ? each.key : "${each.key}-policy"
  policy   = each.value.content
}
