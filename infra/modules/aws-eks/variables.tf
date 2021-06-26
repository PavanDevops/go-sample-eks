provider "aws" {
  region  = var.region
}

variable "project" {
  description = "Name to be used on all the resources as identifier"
}

variable "environment" {
  description = "Environment of the resource"
}

variable "region" {
  description = "The region where  resources will be placed"
  default     = "ap-southeast-1"
}

variable "tag_map" {
  description = "The list of tags"
}

variable "subnet_ids" {}
variable "ssh_key" {}
