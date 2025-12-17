output "ansible_summary" {
  description = "Complete summary"
  value = {
    vm_id    = module.test_ansible.vm_id
    hostname = module.test_ansible.hostname
    vlan     = module.test_ansible.network_vlan_id
    node     = module.test_ansible.node_name
    tags     = module.test_ansible.tags
  }
}
