# Terraform Flatcar provisioning on Vultr VM

[![GitHub Release](https://img.shields.io/github/release/celest-io/terraform-vultr-flatcar-vm.svg?style=flat)]()

A terraform module that will provision a Flatcar VM on Vultr

## Usage

```terraform
locals {
  flatcar_ipxe = <<EOT
#!ipxe

chain http://matchbox_http_endpoint/ipxe?provider=vultr-k8s
 EOT
}

resource "vultr_startup_script" "ipxe" {
  filter {
    name = "name"
    values = ["flatcar-ipxe"]
  }
}

resource "vultr_startup_script" "k8s_ipxe" {
  name   = "k8s-ipxe"
  type   = "pxe"
  script = base64encode(local.flatcar_ipxe)
}

resource "vultr_ssh_key" "provisioning" {
  name    = "k8s-provisioning"
  ssh_key = local.provisioning_key
}

resource "vultr_vpc" "cluster" {
  description    = "Private Network for k0s cluster"
  region         = "lhr"
  v4_subnet      = "10.0.0.0"
  v4_subnet_mask = "24"
}

resource "vultr_firewall_group" "workers" {
  description = "Firewall group for k8s workers"
}

resource "vultr_firewall_rule" "workers_ssh" {
  firewall_group_id = vultr_firewall_group.workers.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "22"
  notes             = "Allow SSH to all workers nodes globally."
}

module "k8s_worker_1" {
  source                  = "celest-io/flatcar-vm/vultr"
  node_name               = "k8s-worker-1"
  vpc_ids                 = [vultr_vpc.cluster.id]
  script_id               = vultr_startup_script.k8s_ipxe.id
  ssh_key_ids             = [vultr_ssh_key.provisioning.id]
  private_network_netmask = vultr_vpc.cluster.v4_subnet_mask
  region                  = "lhr"
  plan                    = "vhp-2c-2gb-amd"
  firewall_group_id       = vultr_firewall_group.workers.id
}
```
