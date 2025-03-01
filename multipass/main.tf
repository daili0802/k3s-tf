terraform {
  required_providers {
    multipass = {
      source = "larstobi/multipass"
    }
  }
}

provider "multipass" {}

resource "multipass_instance" "multipass_vm" {
  count  = 4
  cloudinit_file  = cloud_init.cfg
  name   = "k3s-${count.index + 1}"
  cpus   = 2
  memory = "4G"
  disk   = "20G"
  image  = "jammy"
}
