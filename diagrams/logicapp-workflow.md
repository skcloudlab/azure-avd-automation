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
