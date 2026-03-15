## `/diagrams/terraform-deployment.md`
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
