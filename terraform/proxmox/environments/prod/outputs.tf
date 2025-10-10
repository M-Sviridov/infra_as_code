output "fileserver_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.prod_fileserver.vm_id
    hostname = module.prod_fileserver.hostname
    vlan     = module.prod_fileserver.network_vlan_id
    node     = module.prod_fileserver.node_name
    tags     = module.prod_fileserver.tags
  }
}

output "frigate_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.prod_frigate.vm_id
    hostname = module.prod_frigate.hostname
    vlan     = module.prod_frigate.network_vlan_id
    node     = module.prod_frigate.node_name
    tags     = module.prod_frigate.tags
  }
}
