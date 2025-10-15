output "rss_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.dmz_rss.vm_id
    hostname = module.dmz_rss.hostname
    vlan     = module.dmz_rss.network_vlan_id
    node     = module.dmz_rss.node_name
    tags     = module.dmz_rss.tags
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

output "books_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.dmz_books.vm_id
    hostname = module.dmz_books.hostname
    vlan     = module.dmz_books.network_vlan_id
    node     = module.dmz_books.node_name
    tags     = module.dmz_books.tags
  }
}
