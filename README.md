# Deploy Honeypot Sensors

Uses Hashicorp Terraform and ansible to deploy [TPOT sensors](https://github.com/telekom-security/tpotce) and send logs back to a Splunk instance. 

## Prerequisites

- Terraform
- Ansible
- AWS CLI

## Initial Setup

### Terraform

Update the `variables.tf` file in the aws directory.

Variables to consider:

- region
- instance_type
- private_key
- private_key_path
- linux_password - unused, but good to update to something random
- web_password - unused, but good to update to something random

* private key will be used to authenticate to linux host.

### Ansible

Copy the `vars.yml.example` file to `var.yml` and update.

## Start

Obtain credentials for aws using aws cli or another mechanism.

```
terraform init
```

```
terraform apply
```