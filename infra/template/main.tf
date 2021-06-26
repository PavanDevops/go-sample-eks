provider "aws" {
  region = var.region
}

module "network" {
  source                = "../modules/aws-vpc"
  environment           = var.environment
  project               = var.project
  cidr                  = var.cidr_block
  tag_map               = var.tags
}

module "eks" {
  source = "../modules/aws-eks"
  environment = var.environment
  project = var.project
  ssh_key = var.public_key
  subnet_ids = [ module.network.subnet_01, module.network.subnet_02, module.network.subnet_03]
  tag_map = var.tags
}

output "network" {
  value = module.network
}

output "eks" {
  value = module.eks
}
