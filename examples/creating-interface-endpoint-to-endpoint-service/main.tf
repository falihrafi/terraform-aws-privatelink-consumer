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

  vpc_id                = "vpc-06cec817276b039a5"
  available_subnet_ids  = ["subnet-05b05e5e225efecf6", "subnet-0aa8f2253c0c2a48d"]
  security_group_ids    = ["sg-06d1b469f92ef84e7"]
  service_provider_name = "com.amazonaws.vpce.ap-southeast-1.vpce-svc-0511fba35c46b3314"
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
