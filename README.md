# Provision Azure Devops Projects with Terraform

This repository holds the Terraform code to provision Azure Devops Projects.

Actions allowed:

- Create project
- Add users to existing project
- Remove users from existing project
- Remove user from Azure Devops license?

## Prerequisites

- You must own an Azure Devops Organization where the projects will be created.
- This Azure Devops Organization must be linked to an Azure AD tenant.

## How does it work?

The Terraform code does the following actions:

- Create an Azure Devops Projects inside an existing Azure Devops Organization
- Create Azure AD groups for the new Devops project
  - Project administrators group
  - Project contributors group
  - Project stakeholders group?
- Add users in newly created Azure AD groups
- Define group mapping ? --> this does not look possible with terraform provider. As this feature should be restricted to [assign an access level based on group rules](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/assign-access-levels-by-group-membership?view=azure-devops&tabs=preview-page), why not create 2 Azure AD groups az-devops-basic and az-devops-stakeholder and define the corresponding rules? It will be easire to manage also and dissociate access level management from project membership.
We could also manage user entitlement via terraform automatically.

Will we assign people to Project Administrators group ? Members of this group can manage project users outside of the automated process. They cannot assign access levels though so people added through that way will only receive Stakeholder.

## Project creation

When an Azure Devops project is created, the following items are also created

- A default project team
- The following project security groups in Azure Devops:
  - Build Administrators
  - Contributors: the Azure AD project contributors group is member of this Azure Devops group
  - Project Administrators: the Azure AD project administrators group is member of this Azure Devops group
  - Project Valid Users
  - Readers

## Reference

[Using Terraform to manage Azure Devops](https://mohitgoyal.co/2020/09/09/using-terraform-to-manage-azure-devops-index/)
