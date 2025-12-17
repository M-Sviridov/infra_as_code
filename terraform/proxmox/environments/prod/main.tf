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
  tags                = ["opentofu", "prod", "tailscale"]
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
      gid  = 992
      path = "/dev/dri/renderD128"
    },
    {
      gid  = 44
      path = "/dev/dri/card2"
    },
    {
      gid  = 46
      path = "/dev/bus/usb/002/004"
    },
  ]

  disk_size        = 20
  memory_dedicated = 8192

  mounts = [
    {
      path   = "/mnt/frigate"
      volume = "/nvr/frigate"
    },
    {
      acl    = true
      path   = "/mnt/docker/appdata"
      volume = "/flash/docker/appdata/prod-frigate"
    },
    {
      acl    = true
      path   = "/mnt/docker/stacks"
      volume = "/flash/docker/stacks/prod-frigate"
    },
  ]

  network_mac_address = "BC:24:11:3D:FF:66"
  started             = true
  tags                = ["docker", "opentofu", "prod", "tailscale"]
}

module "prod_docker" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox.root }

  # Required variables
  hostname         = "prod-docker"
  network_vlan_id  = 20
  node_name        = "heimdall"
  template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  vm_id            = 203

  # Secrets from variables
  root_password   = var.root_password
  ssh_public_keys = var.ssh_public_keys

  # Optional variables 
  cpu_cores   = 12
  description = "Production Docker Server"

  devices = [
    { path = "/dev/nvidia0" },
    { path = "/dev/nvidiactl" },
    { path = "/dev/nvidia-uvm" },
    { path = "/dev/nvidia-uvm-tools" },
    { path = "/dev/nvidia-caps/nvidia-cap1" },
    { path = "/dev/nvidia-caps/nvidia-cap2" },
    { path = "/dev/nvram" },
  ]

  disk_size        = 80
  memory_dedicated = 32768

  mounts = [
    {
      acl    = true
      path   = "/mnt/docker/appdata"
      volume = "/flash/docker/appdata/prod-docker"
    },
    {
      acl    = true
      path   = "/mnt/docker/stacks"
      volume = "/flash/docker/stacks/prod-docker"
    },
    {
      path   = "/mnt/data"
      volume = "/tank/data"
    },
    {
      path   = "/mnt/private"
      volume = "/mnt/samsung-1tb/private"
    },
  ]

  network_mac_address = "BC:24:11:6A:F8:86"
  started             = true
  tags                = ["docker", "opentofu", "prod"]
}

module "prod_control" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox.root }

  # Required variables
  hostname         = "prod-control"
  network_vlan_id  = 20
  node_name        = "heimdall"
  template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  vm_id            = 201

  # Secrets from variables
  root_password   = var.root_password
  ssh_public_keys = var.ssh_public_keys

  # Optional variables 
  cpu_cores           = 2
  description         = "Production Control Server for Centralized Management and Monitoring"
  disk_size           = 10
  memory_dedicated    = 2048
  network_mac_address = "BC:24:11:AE:7A:E8"
  started             = true
  tags                = ["docker", "opentofu", "prod"]
}

module "prod_pms" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox.root }

  # Required variables
  hostname         = "prod-pms"
  network_vlan_id  = 20
  node_name        = "heimdall"
  template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  vm_id            = 200

  # Secrets from variables
  root_password   = var.root_password
  ssh_public_keys = var.ssh_public_keys

  # Optional variables
  cpu_cores   = 6
  description = "Production Perfect Media Server"

  devices = [
    {
      gid  = 992
      path = "/dev/dri/renderD128"
    },
    {
      gid  = 44
      path = "/dev/dri/card2"
    },
  ]

  disk_size        = 20
  memory_dedicated = 16384

  mounts = [
    {
      acl    = true
      path   = "/mnt/docker/appdata"
      volume = "/flash/docker/appdata/prod-pms"
    },
    {
      acl    = true
      path   = "/mnt/docker/stacks"
      volume = "/flash/docker/stacks/prod-pms"
    },
    {
      acl    = true
      path   = "/mnt/data"
      volume = "/tank/data"
    },
    {
      path   = "/mnt/private"
      volume = "/mnt/samsung-1tb/private"
    },
  ]

  network_mac_address = "BC:24:11:F0:FA:BD"
  started             = true
  tags                = ["docker", "opentofu", "prod"]
}

module "prod_jellyfin" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox.root }

  # Required variables
  hostname         = "prod-jellyfin"
  network_vlan_id  = 20
  node_name        = "heimdall"
  template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  vm_id            = 204

  # Secrets from variables
  root_password   = var.root_password
  ssh_public_keys = var.ssh_public_keys

  # Optional variables 
  cpu_cores   = 6
  description = "Production Jellyfin Media Server"

  devices = [
    {
      gid  = 992
      path = "/dev/dri/renderD128"
    },
    {
      gid  = 44
      path = "/dev/dri/card2"
    },
  ]

  disk_size        = 10
  memory_dedicated = 4096

  mounts = [
    {
      path   = "/mnt/data"
      volume = "/tank/data"
    },
    {
      acl    = true
      path   = "/mnt/docker/appdata"
      volume = "/flash/docker/appdata/prod-jellyfin"
    },
    {
      acl    = true
      path   = "/mnt/docker/stacks"
      volume = "/flash/docker/stacks/prod-jellyfin"
    },
  ]

  network_mac_address = "BC:24:11:86:25:8F"
  started             = true
  tags                = ["docker", "opentofu", "prod", "tailscale"]
}
