# Automation Workflow

This document explains the end-to-end automation workflow for Azure Virtual Desktop provisioning and deprovisioning.

The automation platform integrates ServiceNow, Azure Logic Apps, Azure DevOps pipelines, and Terraform.

Two primary workflows are supported:

- User Onboarding
- User Offboarding

---

# End-to-End Workflow

The overall workflow follows this architecture.

```mermaid
flowchart TD

A[ServiceNow Request] --> B[Logic App Trigger]
B --> C[Validate Request Payload]
C --> D[Prepare Deployment Input]
D --> E[Trigger Azure DevOps Pipeline]
E --> F[Terraform Infrastructure Deployment]
F --> G[Azure Virtual Desktop Resources]
G --> H[User Assignment]
H --> I[Callback to ServiceNow]
```

---

# Onboarding Workflow

The onboarding workflow provisions Azure Virtual Desktop infrastructure and assigns the user to the environment.

```mermaid
flowchart TD

A[User submits ServiceNow request]
B[Manager approval]
C[Logic App HTTP Trigger]
D[Validate payload]
E[Prepare Terraform configuration]
F[Trigger Azure DevOps pipeline]
G[Terraform Plan]
H[Terraform Apply]
I[Provision AVD host pool resources]
J[Deploy session host VM]
K[Register VM to host pool]
L[Assign user to application group]
M[Send status to ServiceNow]

A --> B
B --> C
C --> D
D --> E
E --> F
F --> G
G --> H
H --> I
I --> J
J --> K
K --> L
L --> M
```

---

# Onboarding Workflow Steps

### 1 Service Request

A user submits a request through the ServiceNow service catalog.

Typical request parameters include:

- user UPN
- department
- host pool type
- request ID

---

### 2 Approval Workflow

ServiceNow executes approval workflows to validate the request.

Approvals may include:

- manager approval
- IT approval
- security approval

---

### 3 Logic App Trigger

Once approved, ServiceNow sends an HTTP request to Azure Logic Apps.

The request payload contains the provisioning details required for deployment.

---

### 4 Payload Validation

Logic App validates:

- required parameters
- request format
- allowed host pool types

If validation fails, the request is rejected
