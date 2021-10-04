provider "aws" {
  region = "ap-southeast-1"
}

#############################################################################################
# Local values declaration. Change the value with a valid value before you used this example
#############################################################################################
locals {
  product_domain = "tsi"
  service_name   = "beicalc"
  environment    = "testing"

  vpc_id                = "vpc-abcd0123"
  available_subnet_ids  = ["subnet-0a1b2c34", "subnet-0a1b2d45"]
  security_group_ids    = ["sg-01a23b45"]
  service_provider_name = "com.amazonaws.ap-southeast-1.logs"
}

#########################
# Interface VPC Endpoint
#########################
module "service-consumer" {
  source = "../../"

  product_domain = local.product_domain
  service_name   = local.service_name
  environment    = local.environment

  vpc_id                = local.vpc_id
  available_subnet_ids  = local.available_subnet_ids
  security_group_ids    = local.security_group_ids
  service_provider_name = local.service_provider_name
}
