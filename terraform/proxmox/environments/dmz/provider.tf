terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.93.0"
    }
  }
}

# Default provider - uses API token (less privileged)
provider "proxmox" {
  endpoint  = var.virtual_environment_endpoint
  api_token = var.virtual_environment_api_token
  insecure  = true
}

# Privileged provider - uses root@pam credentials
provider "proxmox" {
  alias    = "root"
  endpoint = var.virtual_environment_endpoint
  username = var.virtual_environment_root_username
  password = var.virtual_environment_root_password
  insecure = true
}
