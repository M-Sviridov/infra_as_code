# Required variables (no defaults)
variable "hostname" {
  type        = string
  description = "Container hostname"
}

variable "network_vlan_id" {
  type        = number
  description = "Network interface VLAN"
}

variable "node_name" {
  type        = string
  description = "Proxmox node name where container will be created"
}

variable "ssh_public_keys" {
  type        = list(string)
  description = "List of SSH public keys for root user"
}

variable "template_file_id" {
  type        = string
  description = "LXC template file ID (e.g., local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst)"
}

variable "vm_id" {
  type        = number
  description = "Unique container ID (100-999999)"
}

variable "root_password" {
  type        = string
  sensitive   = true
  description = "Root user password"
}

# Optional variables (with sensible defaults)
variable "cpu_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores"
}

variable "datastore_id" {
  type        = string
  default     = "flash-lxcs"
  description = "Datastore ID for container disk"
}

variable "description" {
  type        = string
  default     = "Managed by OpenTofu"
  description = "Container description"
}

variable "devices" {
  type = list(object({
    uid  = optional(number, 0)
    gid  = optional(number, 0)
    path = string
  }))
  default     = []
  description = "List of host devices to passthrough to a container (e.g., /dev/dri/renderD128)"
}

variable "disk_size" {
  type        = number
  default     = 10
  description = "Root disk size in GB"
}

variable "features_nesting" {
  type        = bool
  default     = true
  description = "Enable container nesting (for Docker/LXC inside container)"
}

variable "uid" {
  type        = number
  default     = 0
  description = "User ID to be assigned to device node"
}

variable "gid" {
  type        = number
  default     = 0
  description = "Group ID to be assigned to device node"
}

variable "ipv4_address" {
  type        = string
  default     = "dhcp"
  description = "IPv4 static address with CIDR notation (e.g., 192.168.0.10/24) or dhcp"
}

variable "ipv6_address" {
  type        = string
  default     = "auto"
  description = "IPv6 auto discovery"
}


variable "memory_dedicated" {
  type        = number
  default     = 2048
  description = "Dedicated memory in MB"
}

variable "memory_swap" {
  type        = number
  default     = 512
  description = "Swap memory in MB"
}

variable "mounts" {
  type = list(object({
    acl       = optional(bool, false)
    path      = string
    replicate = optional(bool, false)
    volume    = string
  }))
  default     = []
  description = "Additional mount points for the container"
}

variable "network_bridge" {
  type        = string
  default     = "vmbr1"
  description = "Network bridge to attach to"
}

variable "network_interface_name" {
  type        = string
  default     = "eth0"
  description = "Network interface name"
}

variable "network_mac_address" {
  type        = string
  default     = ""
  description = "Network interface MAC address"
}

variable "os_type" {
  type        = string
  default     = "debian"
  description = "Operating system type (ubuntu, debian, centos, etc.)"
}

variable "path" {
  type        = string
  default     = ""
  description = "Device to pass through to the container (e.g., /dev/sda)"
}

variable "started" {
  type        = bool
  default     = true
  description = "Start container after creation"
}

variable "tags" {
  type        = list(string)
  default     = ["opentofu"]
  description = "Tags for the container"
}

variable "unprivileged" {
  type        = bool
  default     = true
  description = "Unprivileged container"
}
