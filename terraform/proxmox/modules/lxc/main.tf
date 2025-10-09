terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.84.1"
    }
  }
}

resource "proxmox_virtual_environment_container" "lxc_container" {
  description  = var.description
  node_name    = var.node_name
  started      = var.started
  tags         = var.tags
  unprivileged = var.unprivileged
  vm_id        = var.vm_id

  cpu {
    cores = var.cpu_cores
  }

  disk {
    datastore_id = var.datastore_id
    size         = var.disk_size
  }

  features {
    nesting = var.features_nesting
  }

  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = var.ipv4_address
      }
      ipv6 {
        address = var.ipv6_address
      }
    }

    user_account {
      keys     = var.ssh_public_keys
      password = var.root_password
    }
  }

  memory {
    dedicated = var.memory_dedicated
    swap      = var.memory_swap
  }

  network_interface {
    bridge      = var.network_bridge
    mac_address = var.network_mac_address
    name        = var.network_interface_name
    vlan_id     = var.network_vlan_id
  }

  operating_system {
    template_file_id = var.template_file_id
    type             = var.os_type
  }
}
