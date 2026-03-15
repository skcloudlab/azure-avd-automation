# Architecture Overview

This solution uses the following components:

- ServiceNow for request intake and approvals
- Azure Logic Apps for orchestration
- Azure DevOps for pipeline execution
- Terraform for infrastructure as code
- Azure Virtual Desktop for desktop delivery

## High-Level Flow

ServiceNow Request
-> Logic App Trigger
-> Azure DevOps Pipeline
-> Terraform Deployment
-> AVD Provisioning
-> User Assignment
-> Callback to ServiceNow
