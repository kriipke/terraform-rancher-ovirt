#  Startup script

# Registration command
data "template_file" "startup-script_control" {
  template = file("${path.module}/files/startup-script")
  vars = {
    registration_command = "${rancher2_cluster.cluster_tf.cluster_registration_token.0.node_command} --etcd --controlplane"
  }
  depends_on = [rancher2_cluster.cluster_tf]
}

data "template_file" "startup-script_worker" {
  template = file("${path.module}/files/startup-script")
  vars = {
    registration_command = "${rancher2_cluster.cluster_tf.cluster_registration_token.0.node_command} --worker"
  }
  depends_on = [rancher2_cluster.cluster_tf]
}

