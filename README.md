# Provision Azure Devops Projects with Terraform

This repository holds the Terraform code to provision Azure Devops Projects.

Actions allowed:

- Create project with some defaults
- Add users to existing project

## Prerequisites

- You must own an Azure Devops Organization where the projects will be created.

## How does it work?

The Terraform code does the following actions:

- Create an Azure Devops Projects inside an existing Azure Devops Organization
- Customize project's features based on variable `azdevops_project_features`
- Create a Limited Admins Azure Devops Security group
- Assign some project level and repository permissions to the Limited Admins group
- Assign an access level to a user
- Assign that user to the Limited Admin security group

## Reference

[Using Terraform to manage Azure Devops](https://mohitgoyal.co/2020/09/09/using-terraform-to-manage-azure-devops-index/)
