# Azure AVD Automation with ServiceNow, Logic Apps, Azure DevOps and Terraform

This repository showcases an end-to-end automation pattern for Azure Virtual Desktop (AVD) onboarding and offboarding.

## Overview

The solution demonstrates how an AVD request can flow from ServiceNow into Azure Logic Apps, trigger Azure DevOps pipelines, provision infrastructure with Terraform, and return status back to ServiceNow.

## Architecture Flow

1. User submits request in ServiceNow
2. ServiceNow calls Logic App HTTP endpoint
3. Logic App validates request and prepares deployment input
4. Logic App updates repo / triggers Azure DevOps pipeline
5. Azure DevOps runs Terraform
6. Azure Virtual Desktop resources are provisioned
7. User is assigned access
8. Status is sent back to ServiceNow

## Repository Structure

- `docs/` - architecture, workflow, implementation notes
- `terraform/` - sample Terraform root files
- `modules/` - sample Terraform module structure
- `pipelines/` - Azure DevOps YAML samples
- `logicapp/` - Logic App sample workflow JSON
- `diagrams/` - architecture diagrams

## Important Note

This repository contains sanitized sample content for learning and demonstration. No customer-specific configuration, secrets, tenant details, or proprietary assets are included.

## Current Scope

- Personal host pool AVD onboarding pattern
- Offboarding / destroy flow pattern
- ServiceNow callback model
- Azure DevOps pipeline integration
- Terraform deployment structure

## Coming Next

- Step-by-step implementation guide
- Architecture diagrams
- Troubleshooting notes
- Security considerations
