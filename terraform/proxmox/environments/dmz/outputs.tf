output "freshrss_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.dmz_freshrss.vm_id
    hostname = module.dmz_freshrss.hostname
    vlan     = module.dmz_freshrss.network_vlan_id
    node     = module.dmz_freshrss.node_name
    tags     = module.dmz_freshrss.tags
  }
}

output "auth_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.dmz_auth.vm_id
    hostname = module.dmz_auth.hostname
    vlan     = module.dmz_auth.network_vlan_id
    node     = module.dmz_auth.node_name
    tags     = module.dmz_auth.tags
  }
}

output "photos_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.dmz_photos.vm_id
    hostname = module.dmz_photos.hostname
    vlan     = module.dmz_photos.network_vlan_id
    node     = module.dmz_photos.node_name
    tags     = module.dmz_photos.tags
  }
}
