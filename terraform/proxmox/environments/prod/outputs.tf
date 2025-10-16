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

output "docker_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.prod_docker.vm_id
    hostname = module.prod_docker.hostname
    vlan     = module.prod_docker.network_vlan_id
    node     = module.prod_docker.node_name
    tags     = module.prod_docker.tags
  }
}

output "control_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.prod_control.vm_id
    hostname = module.prod_control.hostname
    vlan     = module.prod_control.network_vlan_id
    node     = module.prod_control.node_name
    tags     = module.prod_control.tags
  }
}

output "pms_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.prod_pms.vm_id
    hostname = module.prod_pms.hostname
    vlan     = module.prod_pms.network_vlan_id
    node     = module.prod_pms.node_name
    tags     = module.prod_pms.tags
  }
}

output "jellyfin_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.prod_jellyfin.vm_id
    hostname = module.prod_jellyfin.hostname
    vlan     = module.prod_jellyfin.network_vlan_id
    node     = module.prod_jellyfin.node_name
    tags     = module.prod_jellyfin.tags
  }
}
