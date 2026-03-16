# End-to-End Architecture

This diagram shows the high-level automation flow for Azure Virtual Desktop onboarding and offboarding.

```mermaid
flowchart TD
    A[User submits request in ServiceNow] --> B[ServiceNow Catalog and Approval]
    B --> C[Azure Logic App HTTP Trigger]
    C --> D[Validate Request Payload]
    D --> E[Prepare Deployment Input]
    E --> F[Azure DevOps Pipeline]
    F --> G[Terraform Init / Plan / Apply]
    G --> H[Azure Virtual Desktop Resources]
    H --> I[User Assignment]
    I --> J[Callback to ServiceNow]
```

## Summary

The architecture connects IT service management with cloud infrastructure automation by using:

- ServiceNow for request intake
- Azure Logic Apps for orchestration
- Azure DevOps for execution
- Terraform for infrastructure provisioning
- Azure Virtual Desktop for desktop delivery
