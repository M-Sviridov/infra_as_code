terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.93.0"
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

  dynamic "device_passthrough" {
    for_each = var.devices
    content {
      uid  = device_passthrough.value.uid
      gid  = device_passthrough.value.gid
      path = device_passthrough.value.path
    }
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

  dynamic "mount_point" {
    for_each = var.mounts
    content {
      acl       = mount_point.value.acl
      path      = mount_point.value.path
      replicate = mount_point.value.replicate
      volume    = mount_point.value.volume
    }
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
