# Terraform provider

# oVirt
provider "ovirt" {
  username = var.ovirt-user
  url      = var.ovirt-url
  password = var.ovirt-pass
  #tls_system = "true"
  #tls_ca_bundle = "/Users/spencersmolen/Downloads/pki-resource.cer"
  tls_insecure = "true"
}

# Rancher
provider "rancher2" {
  api_url = var.rancher-url
  token_key = var.rancher-token
  insecure = "true"
}

