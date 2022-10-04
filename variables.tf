variable "node_name" {
  type        = string
  description = "Name of the instance."
}

variable "flatcar_update_group" {
  type        = string
  description = "The name to the Flatcar Linux update manager."
  default     = "stable"
}

variable "flatcar_update_server" {
  type        = string
  description = "The URL to the Flatcar Linux update manager."
  default     = "http://public.update.flatcar-linux.net/v1/update/"
}

variable "tags" {
  type        = list(string)
  description = "Tags"
  default     = []
}

variable "snippets" {
  type        = list(string)
  description = "List of Butane snippets."
  default     = []
}

variable "plan" {
  type        = string
  description = "ID of the plan of the instance"
}

variable "firewall_group_id" {
  type        = string
  description = "The ID of the firewall group to assign to the instance"
}

variable "ssh_key_ids" {
  type        = list(string)
  description = "A list of SSH key IDs"
}

variable "vpc_ids" {
  type        = list(string)
  description = "List of VPC IDs to attach to the instance"
}

variable "private_network_netmask" {
  type        = string
  description = "Netmask of the private network attached to the instance"
}

variable "script_id" {
  type        = string
  description = "The ID of the startup script of the instance"
}

variable "region" {
  type        = string
  description = "Vultr deployment region."
  default     = "lhr"
}

variable "enable_ipv6" {
  type        = bool
  description = "Enable IPv6 on the instance"
  default     = false
}

variable "ddos_protection" {
  type        = bool
  description = "Enable/disable node DDOS Protection."
  default     = false
}

variable "dns_servers" {
  type        = list(string)
  description = "List of the DNS servers to use"
  default     = ["1.1.1.1#cloudflare-dns.com", "1.0.0.1#cloudflare-dns.com"]
}
