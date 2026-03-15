# End-to-End Architecture

```mermaid
flowchart TD
    A[User submits request in ServiceNow] --> B[Logic App HTTP Trigger]
    B --> C[Validate request]
    C --> D[Prepare deployment input]
    D --> E[Azure DevOps Pipeline]
    E --> F[Terraform Init / Plan / Apply]
    F --> G[Azure Virtual Desktop resources]
    G --> H[User assignment]
    H --> I[Callback to ServiceNow]


## `/diagrams/logicapp-workflow.md`

```md
# Logic App Workflow

```mermaid
flowchart TD
    A[HTTP Request] --> B[Validate payload]
    B --> C[Compose request data]
    C --> D[Generate tfvars or request body]
    D --> E[Trigger pipeline]
    E --> F[Wait for status]
    F --> G[Send callback response]


## `/diagrams/terraform-deployment.md`

```md
# Terraform Deployment Flow

```mermaid
flowchart TD
    A[terraform init] --> B[terraform validate]
    B --> C[terraform plan]
    C --> D[terraform apply]
    D --> E[Create Workspace]
    D --> F[Create Host Pool]
    D --> G[Create App Group]
    D --> H[Create Session Host]
    D --> I[Assign User]


---

# Extra files you should add

## `/modules/README.md`

```md
# Modules

This folder contains sanitized Terraform modules for demonstrating an Azure Virtual Desktop automation pattern.

Included modules:

- avd-hostpool
- avd-sessionhost
- avd-appgroup
- avd-user-assignment

These are sample reference modules only.
