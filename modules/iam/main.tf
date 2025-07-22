# modules/iam/main.tf

# Create example Entra ID groups (these could be synced from on-prem AD)
resource "azuread_group" "security_arch" {
  display_name     = "AZG_EH_SecurityArchitecture"
  security_enabled = true
}

resource "azuread_group" "admin" {
  display_name     = "AZG_EH_Admin"
  security_enabled = true
}

resource "azuread_group" "security_reader" {
  display_name     = "AZG_EH_SecurityReader"
  security_enabled = true
}

resource "azuread_group" "iam" {
  display_name     = "AZG_EH_IAM"
  security_enabled = true
}

# Assign RBAC roles to the groups for the target resource group
resource "azurerm_role_assignment" "admin_rg" {
  scope                = var.target_resource_group_id
  role_definition_name = "Owner"
  principal_id         = azuread_group.admin.object_id
}

resource "azurerm_role_assignment" "reader_rg" {
  scope                = var.target_resource_group_id
  role_definition_name = "Reader"
  principal_id         = azuread_group.security_reader.object_id
}

resource "azurerm_role_assignment" "security_arch" {
  scope                = var.target_resource_group_id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.security_arch.object_id
}
