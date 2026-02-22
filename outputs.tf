output "policy_names" {
  value       = [for p in vault_policy.policies : p.name]
  description = "List of names of the created Vault policies."
}
