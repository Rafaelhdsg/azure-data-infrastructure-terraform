# Azure Data Infrastructure Provisioning with Terraform

## Project Objective

This project demonstrates the automated provisioning of essential Azure data infrastructure components—specifically an Azure Storage Account and an Azure Key Vault—using Terraform. It showcases Infrastructure as Code (IaC) best practices, modular design, and secure resource deployment on the Microsoft Azure cloud platform. The goal is to provide a robust, repeatable, and secure foundation for data-intensive applications and services.

## Technologies Used

*   **Microsoft Azure:** Cloud platform for hosting resources.
*   **Terraform:** Infrastructure as Code tool for defining and provisioning cloud resources.
*   **AzureRM Provider:** Terraform provider for managing Azure resources.
*   **Azure CLI:** Command-line tool for managing Azure resources (for authentication and state management).

## Repository Structure

```
.gitignore
README.md
main.tf
variables.tf
locals.tf
resource_groups.tf
keyvault.tf
storages.tf
outputs.tf
terraform.tfvars
providers.tf
```

## Description of key files:
*   **main.tf:** Provider and basic setup.
*   **variables.tf:** Definitions for Resource Groups, Key Vaults, and Storage Accounts.
*   **locals.tf:** Flattened and normalized maps for dynamic provisioning.
*   **resource_groups.tf:** Dynamic creation of Resource Groups.
*   **keyvault.tf:** Dynamic creation of Key Vaults and associated secrets.
*   **storages.tf:** Dynamic creation of Storage Accounts.
*   **outputs.tf:** Outputs for deployed resources.
*   **terraform.tfvars:** User-specific variable values for environment configuration.

## Architecture Overview

- **Resource Groups**: Dynamically created based on a configuration map.
- **Key Vaults**: Multiple Key Vaults per Resource Group, automatically provisioned.
- **Secrets**: Each Key Vault can contain one or multiple secrets, demonstrating secure secret management best practices.
- **Storage Accounts**: Multiple per Resource Group, with configurable replication and tier.

### Configuration Example (`terraform.tfvars`)

```hcl
location = "westus3"

resource_groups = {
  rg-data-prod = {
    key_vaults = [
      { name = "kv-prod-data" },
      { name = "kv-prod-analytics" }
    ],
    storages = [
      { name = "stprodlogs" },
      { name = "stprodshared" }
    ]
  },
  rg-data-dev = {
    key_vaults = [
      { name = "kv-dev-data" }
    ],
    storages = [
      { name = "stdevshared" }
    ]
  }
}
```

## Instructions for Use

### Prerequisites

1.  **Azure Account:** An active Azure subscription.
2.  **Azure CLI:** Installed and authenticated (`az login`).
3.  **Terraform:** Installed (version 1.0+ recommended).

### Setup and Deployment

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/Rafaelhdsg/azure-data-infrastructure-terraform.git
    cd azure-data-infra-terraform
    ```

2.  **Initialize Terraform:**
    ```bash
    terraform init
    ```
    *Note: This project is configured for local state management by default. For production environments, consider configuring a remote backend (e.g., Azure Storage Account) as described in the 'Future Enhancements' section.* 

4.  **Generate an Execution Plan:**
    ```bash
    terraform plan
    ```
    Review the proposed changes carefully.

5.  **Apply the Configuration:**
    ```bash
    terraform apply
    ```
    Type `yes` when prompted to confirm the deployment.

### Cleaning Up Resources

To destroy the provisioned resources, run:

```bash
terraform destroy
```
Type `yes` when prompted to confirm.

## Outputs

After deployment, Terraform will provide the following outputs:

- **resource_groups** — Names of all created Resource Groups.
- **key_vaults** — Names of all created Key Vaults.
- **storages** — Names of all created Storage Accounts.

## Why This Project Matters

This project serves as a foundational demonstration of critical skills for any CloudOps or Data Infrastructure professional. It highlights:

*   **Proficiency in Infrastructure as Code (IaC) with Terraform:** Demonstrating the ability to define, provision, and manage Azure resources programmatically, ensuring consistency and repeatability.
*   **Azure Ecosystem Understanding:** Showcasing practical experience with core Azure services essential for data solutions (Storage Accounts, Key Vaults) and their secure configuration.
*   **Security Best Practices:** Implementing secure secret management using Azure Key Vault, including access policies and the concept of secrets rotation.
*   **Modular and Maintainable Code:** Presenting a clean, well-structured Terraform configuration that adheres to best practices, making it easy to understand, extend, and maintain.
*   **Automation Mindset:** Emphasizing an approach to infrastructure management that prioritizes automation over manual processes, crucial for scalable cloud operations.

By reviewing this project, a recruiter or hiring manager can quickly ascertain my hands-on capabilities in building secure, automated, and scalable cloud infrastructure for data workloads.

## Value Proposition

This project provides a robust, automated, and secure foundation for deploying Azure Storage Accounts and Key Vaults. It streamlines the provisioning process, reduces human error, and ensures that resources are configured according to predefined standards. This approach is vital for organizations seeking agility, reliability, and security in their cloud operations and data infrastructure initiatives.


## Autor 

**Rafael Guedes**  \
CloudOps | Data Infrastructure | IaC with Terraform

📍[GitHub Profile](https://github.com/Rafaelhdsg)
