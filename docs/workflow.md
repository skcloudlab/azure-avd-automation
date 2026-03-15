# Workflow

## Onboarding

1. User submits catalog request in ServiceNow
2. ServiceNow sends request to Logic App
3. Logic App validates payload
4. Logic App prepares deployment input
5. Azure DevOps pipeline is triggered
6. Terraform provisions infrastructure
7. User is assigned to the correct AVD application group
8. ServiceNow receives completion status

## Offboarding

1. ServiceNow offboarding request is submitted
2. Logic App triggers destroy flow
3. Azure DevOps runs Terraform destroy
4. User access and resources are removed
5. Completion status is sent back
