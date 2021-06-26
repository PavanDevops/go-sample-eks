#!/bin/bash -e

#if [ $# -ne 1 ]; then
#    echo "Usage: $(basename $0) <ENVIRONMENT>"
#    echo "Example: ./tf-plan.sh dev|prod"
#    exit
#fi
#
#if [ -d ".terraform" ]; then rm -Rf .terraform; fi
#
#ENVIRONMENT=${1}

initialize() {
  if [[ "$(which terraform)" && "$(terraform --version)" ]]; then
    terraform init -input=false
  else
    echo "***** terraform is not installed, Exiting ... *****"
    exit
  fi
}

plan () {
  if [[ "$(which terraform)" && "$(terraform --version)" ]]; then
    terraform plan -input=false
  else
    echo "***** terraform is not installed, Exiting ... *****"
    exit
  fi
}

initialize
plan
