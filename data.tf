data "aws_vpc_endpoint_service" "service_provider" {
  service_name = "${var.service_provider_name}"
}

data "aws_subnet" "available_subnets" {
  count = length(var.available_subnet_ids)
  id    = var.available_subnet_ids[count.index]
}

