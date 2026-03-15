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

