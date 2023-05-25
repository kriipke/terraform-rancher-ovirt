# Basic

variable "vm_control" {
  description = "Unique names for the control nodes"
  default     = ["node-1","node-2","node-3"]
}
variable "vm_worker" {
  description = "Unique names for the worker nodes"
  default     = ["node-4","node-5","node-6"]
}
variable "cluster_id" {
  description = "The ID of cluster the VMs belong to"
  default     = "23aadea2-f59e-11ed-a7f3-00163e308826"
}
variable "vm_template_id" {
  description = "The ID of template the VMs are based on"
  default     = "2a23cb85-5805-4980-914a-ba58d53ccfa0"
}
variable "vm_memory" {
  description = "Memory to assign to the VM in bytes."
  default     = "4294967296"
}
variable "vm_maximum_memory" {
  description = "Maximum memory to assign to the VM n the memory policy in bytes"
  default     = "8589934592"
}
variable "vm_cpu_cores" {
  description = "The amount of cores"
  default     = "2"
}
variable "vm_cpu_sockets" {
  description = "The amount of sockets"
  default     = "1"
}
variable "vm_cpu_threads" {
  description = " The amount of threads"
  default     = "1"
}

# VM initialization

variable "vm_dns_search" {
  description = "The dns search path for the VMs"
  default     = "ziinc.us"
}
variable "vm_dns_servers" {
  description = "The dns server for the VMs"
  default     = "10.2.0.2 10.2.0.4 10.2.0.99"
}

# Nic Initialization

variable "vm_nic_device" {
  description = "The vNIC to apply this configuration."
  default     = "eth0"
}
variable "vm_nic_boot_proto" {
  description = "The boot protocol for the vNIC configuration."
  default     = "static"
}
variable "vm_nic_ip_address_control" {
  description = "The IP address for the control nodes"
  default     = ["10.2.0.210","10.2.0.211","10.2.0.212"]
}
variable "vm_nic_ip_address_worker" {
  description = "The IP address for the worker nodes"
  default     = ["10.2.0.220","10.2.0.221","10.2.0.222"]
}
variable "vm_nic_gateway" {
  description = "The gateway for the vNIC"
  default     = "10.2.0.1"
}
variable "vm_nic_netmask" {
  description = "The netmask for the vNIC"
  default     = "255.255.255.0"
}
variable "vm_nic_on_boot" {
  description = "The flag to indicate whether the vNIC will be activated at VM booting"
  default     = "true"
}

# Credentials

variable "ovirt-user" {
  default    = "admin@ovirt@internalsso"
}

variable "ovirt-pass" {
  default    = "ZAQ@wse34!@#"
}

variable "ovirt-url" {
  default    = "https://ovirt.ziinc.us/ovirt-engine/api"
}

variable "rancher-url" {
  default    = "https://10.2.0.205.sslip.io/v3"
}

variable "rancher-token" {
  default    = "token-p2snn:9dbj88hcg68xqtvjkqz2c5xpvw226f7gq7pw87hnpj7vv8md8b2fxm"
}

