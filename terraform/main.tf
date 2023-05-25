# Terraform resources 

# Random ID
resource "random_id" "instance_id" {
 byte_length = 3
}

# Rancher cluster
resource "rancher2_cluster" "cluster_tf" {
  name         = "dcc-${random_id.instance_id.hex}"
  description  = "Terraform"

  rke_config {
    ignore_docker_version = false
    network {
      plugin = "flannel"
    }
  }
}

# Control plane 
resource "ovirt_vm" "control" {
  count 	       = 3
  name                 = var.vm_control[count.index]
  clone                = "false"
  cluster_id           = var.cluster_id
  memory               = var.vm_memory
  maximum_memory       = var.vm_maximum_memory
  template_id          = var.vm_template_id
  cpu_cores            = var.vm_cpu_cores
  cpu_sockets          = var.vm_cpu_sockets
  cpu_threads          = var.vm_cpu_threads

  initialization_custom_script   = data.template_file.startup-script_control.rendered
  initialization_hostname        = var.vm_control[count.index]

  #dns_search         = var.vm_dns_search
  #dns_servers        = var.vm_dns_servers
  #nic_configuration {
  #  label              = var.vm_nic_device
  #  boot_proto         = var.vm_nic_boot_proto
  #  address            = var.vm_nic_ip_address_worker[count.index]
  #  gateway            = var.vm_nic_gateway
  #  netmask            = var.vm_nic_netmask
  #  on_boot            = var.vm_nic_on_boot
  #}
}

# resource "ovirt_vm_start" "control" {
#   vm_id = ovirt_vm.control[count.index].id
#   stop_behavior = "stop"
#   force_stop = true
# 
#   depends_on = [ovirt_vm.control]
# }

# Worker nodes
resource "ovirt_vm" "worker" {
  count                = 3
  name                 = var.vm_worker[count.index]
  clone                = "false"
  cluster_id           = var.cluster_id
  memory               = var.vm_memory
  maximum_memory       = var.vm_maximum_memory
  template_id          = var.vm_template_id
  cpu_cores            = var.vm_cpu_cores
  cpu_sockets          = var.vm_cpu_sockets
  cpu_threads          = var.vm_cpu_threads

  initialization_hostname          = var.vm_worker[count.index]
  initialization_custom_script   = data.template_file.startup-script_worker.rendered

  #dns_search         = var.vm_dns_search
  #dns_servers        = var.vm_dns_servers
  #nic_configuration {
  #  label              = var.vm_nic_device
  #  boot_proto         = var.vm_nic_boot_proto
  #  address            = var.vm_nic_ip_address_worker[count.index]
  #  gateway            = var.vm_nic_gateway
  #  netmask            = var.vm_nic_netmask
  #  on_boot            = var.vm_nic_on_boot
  #}

  # depends_on = [ovirt_vm_start.control]
  depends_on = [ovirt_vm.control]
}

# resource "ovirt_vm_start" "worker" {
#   vm_id = ovirt_vm.worker[count.index].id
#   stop_behavior = "stop"
#   force_stop = true
# 
#   depends_on = [ovirt_vm.worker]
# }
