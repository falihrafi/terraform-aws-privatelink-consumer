resource "aws_vpc_endpoint" "service_consumer" {
  vpc_id              = var.vpc_id
  subnet_ids          = local.vpce_subnet_ids
  security_group_ids  = var.security_group_ids
  service_name        = var.service_provider_name
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = var.private_dns_enabled

<<<<<<< HEAD
  tags = merge(
    {
    Name          = format(var.service_name, "-vpce")
=======
  tags = {
    Name          = "var.service_name-vpce"
>>>>>>> fix count index avail subnets
    Description   = var.description
    Environment   = var.environment
    ProductDomain = var.product_domain
    ManagedBy     = "terraform"
    },
    var.additional_tags,
  )
}
