variable "virtual_environment_endpoint" {
  type        = string
  description = "Proxmox Server URL (https://ip:port/api2/json)"
}

variable "virtual_environment_api_token" {
  type        = string
  sensitive   = true
  description = "Proxmox API Token (user@realm!provider=UUID)"
}

variable "virtual_environment_root_password" {
  type        = string
  sensitive   = true
  description = "Proxmox root user password"
}

variable "virtual_environment_root_username" {
  type        = string
  default     = "root@pam"
  description = "Proxmox root user"
}

variable "ssh_public_keys" {
  type        = list(string)
  description = "List of SSH public keys for root user"
}

variable "root_password" {
  type        = string
  sensitive   = true
  description = "Root user password"
}
