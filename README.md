# opentofu-module-vault-policies
Vault policies management with opentofu

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 5.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 5.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_policy.policies](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vault_hcl_policies_directory_path"></a> [vault\_hcl\_policies\_directory\_path](#input\_vault\_hcl\_policies\_directory\_path) | The absolute or relative path to the directory containing Vault policy files in HCL format (.hcl). The policy names will be derived from the file names and suffixed with '-policy'. | `string` | `""` | no |
| <a name="input_vault_policies"></a> [vault\_policies](#input\_vault\_policies) | List of Vault policies to create with their content. The policy names will be suffixed with '-policy'. | <pre>list(object({<br/>    name    = string<br/>    content = string<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_names"></a> [policy\_names](#output\_policy\_names) | List of names of the created Vault policies. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
