variable "vpc_id" {
  type        = string
  description = "ID of the VPC in which the endpoint will be used"
}

variable "available_subnet_ids" {
  type        = list
  description = "IDs of the available subnets in which to create the endpoint network interfaces"
}

variable "security_group_ids" {
  type        = list
  description = "IDs of the security groups to associate with the VPC Endpoint"
}

variable "service_provider_name" {
  type        = string
  description = "Service name of the PrivateLink service provider"
}

variable "service_name" {
  type        = string
  description = "Stack name of the PrivateLink"
}

variable "description" {
  type        = string
  default     = ""
  description = "Description of the PrivateLink service stack"
}

variable "environment" {
  type        = string
  description = "Will be used in resources' Environment tag"
}

variable "product_domain" {
  type        = string
  description = "Abbreviation of the product domain the created resources belong to"
}

variable "private_dns_enabled" {
  type        = string
  default     = "false"
  description = "Only for Interface VPC endpoint to AWS services and AWS Marketplace partner service. Whether or not to associate a private hosted zone with the specified VPC"
}

variable "additional_tags" {
  type        = map
  description = "Additional tags to be added to the VPC Endpoint"
  default     = {}
}
