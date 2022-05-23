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

variable "clc_snippets" {
  type        = list(string)
  description = "List of Container Linux Config snippets."
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
  description = "A name for your cluster."
  type        = list(string)
}

variable "vpc_ids" {
  description = "List of VPC IDs to attach to the instance"
  type        = list(string)
}

variable "private_network_netmask" {
  description = "A name for your cluster."
  type        = string
}

variable "script_id" {
  description = "The ID of the startup script of the instance"
  type        = string
}

variable "region" {
  description = "Vultr deployment region."
  type        = string
  default     = "lhr"
}

variable "enable_ipv6" {
  description = "Cluster IPv6 for future use NOT CURRENTLY SUPPORTED."
  type        = bool
  default     = false
}

variable "ddos_protection" {
  description = "Enable/disable cluster node DDOS Protection."
  type        = bool
  default     = false
}

variable "dns_servers" {
  type        = list(string)
  description = "List of the DNS servers to use"
  default     = ["1.1.1.1#cloudflare-dns.com", "1.0.0.1#cloudflare-dns.com"]
}
