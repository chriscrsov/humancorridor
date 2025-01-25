# VPC
resource "digitalocean_vpc" "my_vpc" {
  name     = "my-vpc"
  region   = var.region
  ip_range = var.vpc_cidr_block
}

# Kubernetes Cluster
resource "digitalocean_kubernetes_cluster" "my_cluster" {
  name    = "my-do-cluster"
  region  = var.region
  version = var.kubernetes_version

  node_pool {
    name       = "worker-pool"
    size       = var.node_size
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }

  vpc_uuid = digitalocean_vpc.my_vpc.id
}

# Additional Node Pool (if needed)
resource "digitalocean_kubernetes_node_pool" "additional_nodes" {
  cluster_id = digitalocean_kubernetes_cluster.my_cluster.id
  name       = "additional-nodes"
  size       = var.node_size
  auto_scale = true
  min_nodes  = 1
  max_nodes  = 3
}
