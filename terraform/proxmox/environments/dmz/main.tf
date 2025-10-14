module "dmz_rss" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox.root }

  # Required variables
  hostname         = "dmz-rss"
  network_vlan_id  = 10
  node_name        = "heimdall"
  template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  vm_id            = 104

  # Secrets from variables
  root_password   = var.root_password
  ssh_public_keys = var.ssh_public_keys

  # Optional variables
  cpu_cores        = 2
  description      = "Production DMZ FreshRSS Server"
  disk_size        = 8
  memory_dedicated = 1024

  mounts = [
    {
      acl    = true
      path   = "/mnt/docker/appdata"
      volume = "/flash/docker/appdata/dmz-rss"
    },
    {
      acl    = true
      path   = "/mnt/docker/stacks"
      volume = "/flash/docker/stacks/dmz-rss"
    },
  ]

  network_mac_address = "BC:24:11:EA:A0:38"
  tags                = ["docker", "dmz", "opentofu"]
}

module "dmz_auth" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox.root }

  # Required variables
  hostname         = "dmz-auth"
  network_vlan_id  = 10
  node_name        = "heimdall"
  template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  vm_id            = 100

  # Secrets from variables
  root_password   = var.root_password
  ssh_public_keys = var.ssh_public_keys

  # Optional variables
  cpu_cores        = 2
  description      = "Production DMZ Authentication Server through Authentik"
  disk_size        = 10
  memory_dedicated = 2048

  mounts = [
    {
      acl    = true
      path   = "/mnt/docker/appdata"
      volume = "/flash/docker/appdata/dmz-auth"
    },
    {
      acl    = true
      path   = "/mnt/docker/stacks"
      volume = "/flash/docker/stacks/dmz-auth"
    },
  ]

  network_mac_address = "BC:24:11:F8:AD:59"
  tags                = ["docker", "dmz", "opentofu"]
}

module "dmz_photos" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox.root }

  # Required variables
  hostname         = "dmz-photos"
  network_vlan_id  = 10
  node_name        = "heimdall"
  template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  vm_id            = 102

  # Secrets from variables
  root_password   = var.root_password
  ssh_public_keys = var.ssh_public_keys

  # Optional variables 
  cpu_cores   = 12
  description = "Production DMZ Photos Server with Immich"

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
  ]

  disk_size        = 20
  memory_dedicated = 8192

  mounts = [
    {
      path   = "/mnt/immich"
      volume = "/tank/immich"
    },
    {
      acl    = true
      path   = "/mnt/docker/appdata"
      volume = "/flash/docker/appdata/dmz-photos"
    },
    {
      acl    = true
      path   = "/mnt/docker/stacks"
      volume = "/flash/docker/stacks/dmz-photos"
    },
  ]

  network_mac_address = "BC:24:11:88:6C:71"
  started             = true
  tags                = ["docker", "dmz", "opentofu"]
}
