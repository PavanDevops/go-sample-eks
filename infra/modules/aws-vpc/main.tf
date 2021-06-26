data "aws_caller_identity" "current" {}

locals {
  env_map = {
    development = "dev"
    staging     = "stage"
    production  = "prod"
  }[var.environment]
  resource_name = "${local.env_map}-${var.project}"
}

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr
  tags = merge( { "Name" = "${local.resource_name}-vpc" }, var.tag_map )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge( { "Name" = "${local.resource_name}-igw" }, var.tag_map )
}
