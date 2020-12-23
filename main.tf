terraform {
  required_version = ">= 0.13"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.1.0"
    }
  }
}

provider "azuredevops" {
  # Configuration options
}

# Azure Devops provider uses the following environment variables
# AZDO_ORG_SERVICE_URL = the Azure DevOps organization url.
# AZDO_PERSONAL_ACCESS_TOKEN = Azure DevOps organization personal access token

# Create Azure Devops Project with features as requested
# Required PAT permissions : Project & Team: Read, Write, & Manage
resource "azuredevops_project" "tf-project" {
  name               = "Terraform-Test"
  description        = "Terraform-Test Project Description"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

# Set the project features available
resource "azuredevops_project_features" "tf-project-features" {
  project_id = azuredevops_project.tf-project.id
  features   = var.azdevops_project_features
}

# Create a limited project admins group
resource "azuredevops_group" "tf-group" {
  scope        = azuredevops_project.tf-project.id
  display_name = "Limited Administrators"
  description  = "Members of this group have the same authorizations as Project Administrators group except Edit Project settings."
}

# Set project permissions for the limited project admins group
resource "azuredevops_project_permissions" "tf-project-perm" {
  project_id  = azuredevops_project.tf-project.id
  principal   = azuredevops_group.tf-group.id
  permissions = var.azdevops_limited_admin_group_project_permissions
}

# Set project repositories permissions for the limited project admins group
resource "azuredevops_git_permissions" "tf-project-git-root-permissions" {
  project_id = azuredevops_project.tf-project.id
  principal  = azuredevops_group.tf-group.id
  permissions = var.azdevops_limited_admin_group_git_root_permissions
}

# Create Azure Devops User Entitlement
# Required PAT permissions : Member Entitlement Management: Read & Write
resource "azuredevops_user_entitlement" "tf-project-user" {
  principal_name       = "azdevops_user3@sebastienpondichygmail.onmicrosoft.com"
  account_license_type = "stakeholder"
}

# Add user to Azure Devops Group
# Required PAT permissions : Deployment Groups: Read & Manage
resource "azuredevops_group_membership" "membership" {
  group = azuredevops_group.tf-group.descriptor
  members = [ 
    azuredevops_user_entitlement.tf-project-user.descriptor
  ]
}