#################################################################
## General Inputs
#################################################################
variable "project"                {}
variable "deployment_account_id"  {}
variable "region"                 {}
variable "environment"            {}
variable "app_name"               {}
variable "tags"                   {}
#################################################################
## Network Module Inputs
#################################################################
variable "cidr_block"             {}
variable "public_key"             {}
//variable "image_id"               {}
//variable "instance_type"          {}
//variable "max_size"               {}
