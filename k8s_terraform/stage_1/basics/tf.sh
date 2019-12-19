#!/bin/bash

# init
terraform init
terraform validate

# list providers in the folder:
ls .terraform/plugins/linux_amd64/

# list providers used in the configuration:
terraform providers

terraform plan
#Useful flags for plan:
#-out=path: Writes a plan file to the given path. This can be used as input to the "apply" command.
#-var 'foo=bar': Set a variable in the Terraform configuration. This flag can be set multiple times.

terraform apply
#Useful flags for apply:
#-auto-approve: This skips interactive approval of plan before applying.
#-var 'foo=bar': This sets a variable in the Terraform configuration. It can be set multiple times.

terraform show

terraform destroy

#Useful flags for destroys:
#-auto-approve: Skip interactive approval of plan before applying.

terraform plan -out=tfplan
terraform apply tfplan
terraform show
terraform destroy
