# Terraform Deployment Flow

This diagram shows how the Terraform root module composes reusable modules to provision Azure Virtual Desktop resources.

```mermaid
flowchart LR
    A[Terraform Root Module] --> B[avd-hostpool]
    A --> C[avd-appgroup]
    A --> D[avd-sessionhost]
    A --> E[avd-user-assignment]
```

## Deployment Sequence

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
```

## Summary

The Terraform configuration is structured to keep the root module simple while delegating resource creation to reusable modules.
