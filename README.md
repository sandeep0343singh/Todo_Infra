# Terraform Infrastructure – Modular Approach

## 📌 Overview
This repository follows a **modular Terraform architecture** to provision and manage cloud infrastructure in a **scalable, reusable, and maintainable** way.

The design separates:
- **Root module** → orchestration layer
- **Child modules** → reusable infrastructure components

This approach is ideal for **multi-environment (dev/test/prod)** setups and large-scale cloud deployments.

---

## 🧱 Architecture Approach

### 1️⃣ Root Module
- Entry point of Terraform execution
- Calls multiple child modules
- Manages:
  - Provider configuration
  - Backend configuration
  - Environment-specific variables
  - Inter-module dependencies

### 2️⃣ Child Modules
- Encapsulate specific resources
- Reusable across environments
- Follow **single responsibility principle**

Examples:
- Networking module (VNet, Subnets, NSG)
- Compute module (VM / AKS / App Service)
- Database module
- Identity module

---

## 📂 Repository Structure

```text
.
├── environments
│   ├── dev
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   └── prod
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── backend.tf
│
├── modules
│   ├── network
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── compute
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── database
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── providers.tf
├── versions.tf
└── README.md

## 📤 Outputs & Dependency Management

- Child modules expose required values using `output`
- Root module consumes module outputs to chain dependencies between resources

Example:
```hcl
output "subnet_id" {
  value = azurerm_subnet.this.id
}


## 🌍 Multi-Environment Strategy

Each environment is managed independently with:

- Separate **state file**
- Separate **backend configuration**
- Separate **terraform.tfvars**

### ✅ Benefits
- No state conflicts
- Strong environment isolation
- Safer production deployments

---

## 🔐 State Management

- Remote backend options:
  - Azure Storage
  - Amazon S3
  - Google Cloud Storage
- State locking enabled to prevent concurrent executions
- Versioned state files for audit and rollback

---

## 🧠 Best Practices Followed

- Modular design
- DRY (Don’t Repeat Yourself) principle
- Explicit outputs
- Variable-driven configuration
- Terraform version constraints
- Remote backend usage
- Clear separation of concerns

---

## 🧪 Recommended Enhancements

- **Terratest** for module-level and integration testing
- `terraform fmt` and `terraform validate` in CI/CD pipelines
- **Policy-as-Code** using OPA or Sentinel
- **GitOps-based promotion** across environments

---

## 👨‍💻 Author

Maintained by **Sandeep Singh**
       