output "regional_dns_name" {
  description = "Regional DNS name for the VPC Endpoint. Use this DNS name to connect to service provider through PrivateLink."
  value       = aws_vpc_endpoint.service_consumer.dns_entry.0.dns_name
}

output "regional_hosted_zone_id" {
  description = "Regional hosted zone id for the VPC Endpoint."
  value       = aws_vpc_endpoint.service_consumer.dns_entry.0.hosted_zone_id
}

output "dns_names" {
  description = "List of DNS names for the VPC Endpoint include regional DNS name and zonal DNS name"
  value       = [aws_vpc_endpoint.service_consumer.dns_entry]
}
