# Architecture Overview

This document describes the architecture used to automate Azure Virtual Desktop (AVD) onboarding and offboarding using ServiceNow, Azure Logic Apps, Azure DevOps pipelines, and Terraform.

The architecture demonstrates how enterprise IT service requests can trigger automated cloud infrastructure provisioning.

---

# Architecture Goals

The automation platform is designed to achieve the following objectives:

- eliminate manual provisioning of Azure Virtual Desktop environments
- reduce deployment time
- ensure infrastructure consistency
- enable infrastructure lifecycle automation
- integrate enterprise ITSM workflows with cloud provisioning

---

# High-Level Architecture

The architecture integrates multiple layers of enterprise automation.

```mermaid
flowchart TD

A[ServiceNow Request]
B[Azure Logic App Trigger]
C[Request Validation]
D[Azure DevOps Pipeline]
E[Terraform Infrastructure Deployment]
F[Azure Virtual Desktop Resources]
G[User Assignment]
H[Callback to ServiceNow]

A --> B
B --> C
C --> D
D --> E
E --> F
F --> G
G --> H
```
# End-to-End AVD Automation Flow

```mermaid
sequenceDiagram
    participant SN as ServiceNow / Request Source
    participant LA1 as Logic App - Onboarding
    participant Graph as Microsoft Graph
    participant Blob as Blob Config
    participant ADO as Azure DevOps Repo
    participant PR as Pull Request Flow
    participant PIPE as ADO Pipeline
    participant TF as Terraform
    participant Azure as Azure ARM / AVD
    participant LA2 as Logic App - Post Deployment
    participant Mail as Office365 Mail

    SN->>LA1: Submit onboarding request
    LA1->>Graph: Validate user UPN
    Graph-->>LA1: Return user object ID
    LA1->>Blob: Read department-config.json
    Blob-->>LA1: Return department mapping
    LA1->>ADO: Create/update tfvars in automation branch
    LA1->>PR: Create PR to main
    PR->>PR: Add reviewer / approve / auto-complete
    PR-->>PIPE: Repo change triggers pipeline
    PIPE->>TF: Init / Validate / Plan / Apply
    TF->>Azure: Provision personal AVD resources
    PIPE->>Azure: Run command to expand C drive if needed
    PIPE->>LA2: POST callback payload
    LA2->>Blob: Reload department mapping
    LA2->>Graph: Find target AVD group
    LA2->>Graph: Add user to group if required
    LA2->>Azure: Assign user to session host
    LA2->>SN: Update RITM success/failure
    LA2->>Mail: Send admin notification
```
---

# Architecture Layers

The automation platform consists of four layers.

## IT Service Management Layer

ServiceNow acts as the user interface and approval system.

Responsibilities:

- request intake
- approval workflows
- audit tracking
- lifecycle tracking

---

## Orchestration Layer

Azure Logic Apps orchestrate the automation workflow.

Responsibilities:

- receive ServiceNow request payload
- validate request parameters
- prepare infrastructure deployment inputs
- trigger Azure DevOps pipelines
- return deployment status

---

## DevOps Execution Layer

Azure DevOps pipelines act as the execution engine.

Responsibilities:

- run Terraform commands
- manage deployment workflows
- maintain infrastructure state
- provide deployment logs

Typical pipeline stages:

- Terraform Init
- Terraform Plan
- Terraform Apply

---

## Infrastructure Layer

Terraform provisions Azure resources required for Azure Virtual Desktop.

Resources deployed may include:

- AVD host pools
- application groups
- session host virtual machines
- workspace configuration
- user assignments

Terraform ensures infrastructure deployments are:

- repeatable
- version controlled
- consistent across environments

---

# Azure Virtual Desktop Components

The automation provisions the following AVD components.

## Host Pool

A host pool defines a collection of session host virtual machines.

Key attributes:

- personal or pooled host pool
- load balancing configuration
- maximum sessions

---

## Session Host

Session hosts are the virtual machines that deliver desktops to users.

Automation tasks include:

- virtual machine provisioning
- host pool registration
- domain join
- monitoring configuration

---

## Application Group

Application groups define which desktops or applications users can access.

Types:

- desktop application group
- remote application group

---

## Workspace

Workspaces provide a logical container for application groups.

Users access Azure Virtual Desktop resources through workspace assignments.

---

# Request Flow

The end-to-end request flow is described below.

1. User submits ServiceNow catalog request.
2. Request approval workflow is executed.
3. ServiceNow triggers Azure Logic App.
4. Logic App validates the request payload.
5. Logic App triggers Azure DevOps pipeline.
6. Azure DevOps executes Terraform deployment.
7. Terraform provisions Azure Virtual Desktop resources.
8. User is assigned to the application group.
9. Logic App sends completion status back to ServiceNow.

---

# Key Benefits

This automation architecture provides the following benefits:

- faster provisioning of Azure Virtual Desktop environments
- reduction in manual configuration errors
- improved infrastructure governance
- consistent infrastructure deployment
- integration between ITSM and cloud automation

---

# Architecture Considerations

When implementing this architecture in production environments, consider:

- secure storage of secrets using Azure Key Vault
- RBAC enforcement using Microsoft Entra ID
- network isolation using private endpoints
- monitoring using Azure Monitor
- centralized logging using Log Analytics

---

# Summary

This architecture demonstrates how enterprise organizations can automate the lifecycle of Azure Virtual Desktop infrastructure by integrating ITSM workflows with Infrastructure as Code and DevOps automation.
