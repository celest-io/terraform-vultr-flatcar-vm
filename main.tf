data "vultr_os" "custom" {
  filter {
    name   = "name"
    values = ["Custom"]
  }
}

data "ct_config" "node" {
  pretty_print = false
  content = templatefile("${path.module}/config/config.yaml", {
    hostname       = var.node_name
    update_group   = var.flatcar_update_group
    update_server  = var.flatcar_update_server
    v4_subnet_mask = var.private_network_netmask
    dns_servers    = join(" ", var.dns_servers)
  })
  platform = "custom"
  snippets = var.clc_snippets
}

resource "vultr_instance" "node" {
  plan              = var.plan
  hostname          = var.node_name
  label             = var.node_name
  region            = var.region
  tags              = var.tags
  firewall_group_id = var.firewall_group_id
  vpc_ids           = var.vpc_ids
  ssh_key_ids       = var.ssh_key_ids
  enable_ipv6       = var.enable_ipv6
  ddos_protection   = var.ddos_protection
  user_data         = data.ct_config.node.rendered
  script_id         = var.script_id
  os_id             = data.vultr_os.custom.id
}
