source "qemu" "k8s-node" {
  iso_url        = "https://cloud-images.ubuntu.com/jammy/20230519/jammy-server-cloudimg-amd64.img"
  iso_checksum   = "sha256:13ce68cde7bdc9b97107f450d85bdb3e8438149cd402ac1ac8aab9cbebfb3ac4"
  cd_files = [
        "./http/meta-data",
        "./http/user-data"
  ]
  disk_size      = "5000M"
  disk_image     = "true"
  use_backing_file = "true"
  format         = "qcow2"
  accelerator    = "kvm"
  ssh_username   = "ubuntu"
  ssh_password   = "ubuntu"
  ssh_timeout    = "60m"
  vm_name        = "k8s-node"
  net_device     = "virtio-net"
  disk_interface = "virtio"
  qemu_binary    = "/usr/libexec/qemu-kvm"
  headless       = "true"
  boot_command = [
    "e<down><down><down><end>",
    " autoinstall ds=nocloud;",
    "<F10>"
  ]
}

build {
  sources = ["source.qemu.k8s-node"]

  provisioner "file" {
    source      = "cloud-init.yaml"
    destination = "/etc/cloud/cloud.cfg.d/99-install-docker.yaml"
  }
}

