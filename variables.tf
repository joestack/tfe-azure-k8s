#K8s variables
variable "aks_prefix" {
  description = "A prefix used for all resources in this example"
}


variable "kubernetes_client_id" {
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "kubernetes_client_secret" {
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

# Azure Variables
variable "arm_region" {
  default = "germanycentral"
}

variable "arm_resource_group_name" {
  default = "vault"
}
