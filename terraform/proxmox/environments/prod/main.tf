module "prod_fileserver" {
  source = "../../modules/lxc"

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
  description         = "Production fileserver using 45Drives Cockpit Modules"
  memory_dedicated    = 512
  network_mac_address = "bc:24:11:1f:72:b4"
  started             = false
  tags                = ["opentofu", "prod"]
}
