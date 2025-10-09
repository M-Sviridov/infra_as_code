output "vm_id" {
  description = "The Proxmox resource ID of the container"
  value       = var.vm_id
}

output "hostname" {
  description = "The hostname of the container"
  value       = var.hostname
}

output "network_vlan_id" {
  description = "The VLAN ID of the network interface"
  value       = var.network_vlan_id
}

output "tags" {
  description = "Tags applied to the container"
  value       = var.tags
}

output "node_name" {
  description = "Proxmox node name where the container is deployed"
  value       = var.node_name
}
