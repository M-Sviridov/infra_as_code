module "test_ansible" {
  source    = "../../modules/lxc"
  providers = { proxmox = proxmox }

  # Required variables
  hostname         = "test-ansible"
  network_vlan_id  = 30
  node_name        = "heimdall"
  template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  vm_id            = 400

  # Secrets from variables
  root_password   = var.root_password
  ssh_public_keys = var.ssh_public_keys

  # Optional variables 
  cpu_cores        = 2
  description      = "Test server for Ansible"
  memory_dedicated = 512
  tags             = ["opentofu", "test"]
}
