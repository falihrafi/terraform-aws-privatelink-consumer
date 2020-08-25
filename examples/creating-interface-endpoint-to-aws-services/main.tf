module "service-consumer" {
  source = "../../"

  product_domain      = local.product_domain
  service_name        = local.service_name
  environment         = local.environment
  private_dns_enabled = "true"

  vpc_id                = local.vpc_id
  available_subnet_ids  = [local.available_subnet_ids]
  security_group_ids    = [local.security_group_ids]
  service_provider_name = local.service_provider_name
}

