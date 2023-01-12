output "sec_group_id" {
  description = "The ID of the security group created"
  value       = azurerm_network_security_group.allow-ssh.id
}
