# Azure Virtual Desktop Automation
### End-to-End Automation with ServiceNow, Logic Apps, Azure DevOps and Terraform

This repository demonstrates a **reference architecture for automating Azure Virtual Desktop (AVD) onboarding and offboarding workflows** using Infrastructure as Code and DevOps pipelines.

The solution integrates the following platforms:

- ServiceNow (request intake & approvals)
- Azure Logic Apps (automation orchestration)
- Azure DevOps (CI/CD pipeline execution)
- Terraform (Infrastructure as Code)
- Azure Virtual Desktop (desktop provisioning)

The goal is to automate the **complete lifecycle of AVD user provisioning**, from request submission to infrastructure deployment and user access assignment.

---

# Overview

In many enterprises, provisioning Azure Virtual Desktop environments is still performed manually.

Typical manual process:

1. User submits request  
2. IT team reviews request  
3. Administrator creates VM  
4. User assigned to host pool  
5. Access verified manually  

This approach introduces:

- slow provisioning
- operational overhead
- configuration errors
- lack of automation

This project demonstrates how the process can be **fully automated using DevOps practices**.

---

# Architecture

The architecture integrates ITSM workflows with cloud automation.

```
ServiceNow Request
        │
        ▼
Azure Logic App Trigger
        │
        ▼
Azure DevOps Pipeline
        │
        ▼
Terraform Infrastructure Deployment
        │
        ▼
Azure Virtual Desktop Resources
        │
        ▼
User Assignment
        │
        ▼
Callback to ServiceNow
```

This architecture enables provisioning of AVD environments **within minutes instead of hours**.

---

# Repository Structure

```
azure-avd-automation-servicenow-terraform/

├── modules/
│   ├── avd-hostpool/
│   ├── avd-sessionhost/
│   ├── avd-appgroup/
│   └── avd-user-assignment/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── backend.tf
│   └── terraform.tfvars.example
│
├── pipelines/
│   ├── terraform-apply.yml
│   └── terraform-destroy.yml
│
├── logicapp/
│   ├── onboarding-workflow.json
│   └── offboarding-workflow.json
│
└── diagrams/
    ├── architecture.md
    ├── logicapp-workflow.md
    └── terraform-deployment.md
```

---

# Solution Components

## ServiceNow

ServiceNow acts as the **entry point for the automation workflow**.

Users submit requests through a catalog item containing fields such as:

- User UPN
- Department
- Host pool type
- Request ID

Once approved, ServiceNow sends a REST API request to the Logic App.

---

## Azure Logic Apps

Azure Logic Apps orchestrate the automation workflow.

Main responsibilities:

- Receive ServiceNow request
- Validate request payload
- Prepare Terraform configuration
- Trigger Azure DevOps pipeline
- Send completion status back to ServiceNow

---

## Azure DevOps

Azure DevOps pipelines execute Terraform deployment workflows.

Typical pipeline stages:

1. Terraform Init  
2. Terraform Plan  
3. Terraform Apply  

A separate pipeline can be used for **offboarding and infrastructure destruction**.

---

## Terraform

Terraform manages infrastructure provisioning for:

- AVD host pools
- application groups
- session host virtual machines
- user assignment

Terraform ensures infrastructure deployments are:

- repeatable
- consistent
- version controlled

---

# Terraform Modules

The repository includes modular Terraform components.

### Host Pool Module
Creates an Azure Virtual Desktop host pool.

### Session Host Module
Deploys a session host virtual machine and registers it with the host pool.

### Application Group Module
Creates a desktop application group and associates it with the workspace.

### User Assignment Module
Assigns users to the application group.

---

# Deployment Flow

The automated provisioning workflow follows these steps.

1. User submits ServiceNow request  
2. Logic App receives API request  
3. Request payload validated  
4. Azure DevOps pipeline triggered  
5. Terraform executes infrastructure deployment  
6. AVD resources are created  
7. User assigned to application group  
8. ServiceNow ticket updated with status  

---

# Offboarding Workflow

The automation also supports **resource cleanup**.

Offboarding process:

1. ServiceNow offboarding request submitted  
2. Logic App triggers destroy workflow  
3. Azure DevOps pipeline executes Terraform destroy  
4. Session host resources removed  
5. User access revoked  
6. ServiceNow ticket updated  

---

# Security Considerations

When implementing this architecture in production environments, consider the following:

- Use Azure Key Vault for secrets
- Implement RBAC using Microsoft Entra ID
- Use managed identities where possible
- Store Terraform state securely
- Restrict network access using NSGs and private endpoints

---

# Monitoring

Automation systems should include monitoring and logging.

Recommended tools:

- Azure Monitor
- Log Analytics
- Azure DevOps pipeline logs

Key metrics to monitor:

- deployment success rate
- pipeline execution time
- login failures
- session host health

---

# Example Use Cases

This automation architecture can be applied in several scenarios:

- enterprise desktop provisioning
- secure remote workforce environments
- automated onboarding for large organizations
- DevOps driven infrastructure management

---

# Important Notice

This repository contains **sanitized reference implementation examples**.

The configuration is intended for **learning and demonstration purposes only**.

Do not use these examples in production environments without proper security review and customization.

---

# Future Enhancements

Potential improvements include:

- pooled host pool automation
- auto-scaling session hosts
- monitoring dashboards
- cost optimization automation
- self-service deployment portals

---

# Contributing

Contributions are welcome.

Possible improvements include:

- additional Terraform modules
- improved automation workflows
- monitoring integrations
- documentation enhancements

---

# License

This project is provided for educational purposes.

Review and adapt the configuration before deploying in production environments.

---

# Author

SK Cloud Automation  
Cloud Architect | Azure | Terraform | DevOps | Automation
