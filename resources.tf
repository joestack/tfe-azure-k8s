provider "azurerm" {
}

resource "azurerm_resource_group" "aks" {
  name     = "${var.aks_prefix}-aks"
  location = "${var.arm_region}"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.aks_prefix}-rbac"
  location            = "${azurerm_resource_group.aks.location}"
  resource_group_name = "${azurerm_resource_group.aks.name}"
  dns_prefix          = "${var.aks_prefix}-rbac"

  agent_pool_profile {
    name            = "default"
    count           = "${var.node_count}"
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${var.kubernetes_client_id}"
    client_secret = "${var.kubernetes_client_secret}"
  }

  role_based_access_control {
    enabled = true
  }

}
