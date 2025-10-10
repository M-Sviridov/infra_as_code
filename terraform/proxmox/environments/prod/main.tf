module "prod_fileserver" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox }

  # Required variables
  hostname         = "prod-fileserver"
  network_vlan_id  = 20
  node_name        = "heimdall"
  template_file_id = "local:vztmpl/debian-12-standard_12.12-1_amd64.tar.zst"
  vm_id            = 206

  # Secrets from variables
  root_password   = var.root_password
  ssh_public_keys = var.ssh_public_keys

  # Optional variables 
  cpu_cores           = 2
  description         = "Production File Server with 45Drives Cockpit Modules"
  memory_dedicated    = 512
  network_mac_address = "bc:24:11:1f:72:b4"
  tags                = ["opentofu", "prod"]
}

module "prod_frigate" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox.root }

  # Required variables
  hostname         = "prod-frigate"
  network_vlan_id  = 20
  node_name        = "heimdall"
  template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  vm_id            = 207

  # Secrets from variables
  root_password   = var.root_password
  ssh_public_keys = var.ssh_public_keys

  # Optional variables 
  cpu_cores   = 6
  description = "Production Frigate NVR Server"

  devices = [
    { path = "/dev/nvidia0" },
    { path = "/dev/nvidiactl" },
    { path = "/dev/nvidia-uvm" },
    { path = "/dev/nvidia-uvm-tools" },
    { path = "/dev/nvidia-caps/nvidia-cap1" },
    { path = "/dev/nvidia-caps/nvidia-cap2" },
    { path = "/dev/nvram" },
    {
      gid  = 104
      path = "/dev/dri/renderD128"
    },
    {
      gid  = 44
      path = "/dev/dri/card2"
    },
    {
      gid  = 46
      path = "/dev/bus/usb/002/002"
    },
  ]

  mounts = [
    {
      path   = "/mnt/frigate"
      volume = "/nvr/frigate"
    }
  ]


  disk_size           = 20
  memory_dedicated    = 8192
  network_mac_address = "BC:24:11:3D:FF:66"
  started             = true
  tags                = ["opentofu", "prod"]
}
