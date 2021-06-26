#!/bin/bash -e

#if [ $# -ne 1 ]; then
#    echo "Usage: $(basename $0) <ENVIRONMENT>"
#    echo "Example: ./tf-plan.sh dev|prod"
#    exit
#fi
#
#ENVIRONMENT=${1}

initialize() {
  if [[ "$(which terraform)" && "$(terraform --version)" ]]; then
    terraform init -input=false
#      -backend=true \
#      -backend-config="../${ENVIRONMENT}/backend.conf"
  else
    echo "***** terraform is not installed, Exiting ... *****"
    exit
  fi
}

plan () {
  if [[ "$(which terraform)" && "$(terraform --version)" ]]; then
    terraform apply \
      -input=false \
#      -var-file="../${ENVIRONMENT}/terraform.tfvars" \
      -auto-approve
  else
    echo "***** terraform is not installed, Exiting ... *****"
    exit
  fi
}

initialize
plan
