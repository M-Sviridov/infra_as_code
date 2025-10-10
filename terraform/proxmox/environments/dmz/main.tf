module "dmz_freshrss" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox.root }

  # Required variables
  hostname         = "dmz-freshrss"
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
      volume = "/flash/docker/appdata/dmz-freshrss"
    },
    {
      acl    = true
      path   = "/mnt/docker/stacks"
      volume = "/flash/docker/stacks/dmz-freshrss"
    },
  ]

  network_mac_address = "BC:24:11:EA:A0:38"
  tags                = ["docker", "dmz", "opentofu"]
}
