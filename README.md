# Federated Edge Observability

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Start Here

If you've followed a link to this repository, but are not really sure what it contains
or how to use it, head over to [Ansible Edge GitOps](http://validatedpatterns.io/ansible-edge-gitops/) (which this pattern is derived from) for additional context and installation instructions

## Basics & Setup

This Validated Pattern lays the OTEL based infrastructure foundation to setup observability in federated and/or distributed environments.
The infrastructure components are a central OpenShift Hub server with 4 edge nodes which are running as preconfigured virtual machines on OpenShift-Virtualization (OCP-V).

The technology components used here are 
- OpenShift,
- ArgoCD as OpenShift GitOps,
- Hashicorp Vault,
- OpenShift Virtualization, 
- Ansible Automation Platform,
- OpenShift Data Foundations (ODF),
- Red Hat Device Edge (running at the edge),
- OpenTelemetry.

The installation at the OpenShift hub cluster happens via Operators (subscriptions), the pattern itself (see values-hub.yaml) or via an Ansible playbook (OTEL at the edge) while the installation at the edge happens via an Ansible playbook installing an RPM: https://github.com/validatedpatterns-demos/rhvp.federated_edge_observability/blob/main/roles/otel_collector/tasks/main.yml
ArgoCD is managing the applications as defined in the values-hub.yaml file.

The user/password/key config happens in your user home (!) directory via the values-secret.yaml, so make sure you copy and then edit your values-secret.yaml.template to ~/values-secret.yaml.

There are several different git repositories in play which serve different purposes. The multiple git repos serve the purpose of easy customization and adoption into different environments.

### GitRepos setup

#### Federated Edge Observability
This pattern repo is the starting point and main git repo:
https://github.com/validatedpatterns-sandbox/federated-edge-observability

The edge node setup is stored under $patterDir/overrides/values-egv-feo.yaml

#### RHVP Federated Edge Observability
This pattern repo contains roles & Ansible playbooks for the edge device configuration:
https://github.com/validatedpatterns-demos/rhvp.federated_edge_observability

#### Config as Code
This repo holds the AAP configuration
https://github.com/validatedpatterns-demos/federated-edge-observability-config-as-code

#### Edge Inventory
This git repo holds the edge inventory
https://github.com/validatedpatterns-demos/federated-edge-observability-inventory






