# Terraform Root Module

This folder contains the root Terraform configuration for the Azure Virtual Desktop automation reference implementation.

The root module composes reusable Terraform modules to demonstrate how Azure Virtual Desktop resources can be provisioned through Infrastructure as Code.

## Responsibilities

The root module is responsible for:

- creating the AVD workspace
- creating the host pool
- creating the application group
- optionally deploying a session host
- optionally assigning a user to the application group

## Notes

This Terraform configuration is a sanitized reference implementation intended for learning and architecture demonstration.

It does not include:

- production secrets
- internal enterprise configuration
- customer-specific settings

## Related Modules

The root module uses the following reusable modules:

- avd-hostpool
- avd-appgroup
- avd-sessionhost
- avd-user-assignment
