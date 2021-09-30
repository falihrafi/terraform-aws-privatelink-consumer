# terraform-aws-privatelink-consumer

[![Terraform Version](https://img.shields.io/badge/Terraform%20Version->=0.12.0,<=0.13.0-blue.svg)](https://releases.hashicorp.com/terraform/)
[![Release](https://img.shields.io/github/release/traveloka/terraform-aws-privatelink-consumer.svg)](https://github.com/traveloka/terraform-aws-privatelink-consumer/releases)
[![Last Commit](https://img.shields.io/github/last-commit/traveloka/terraform-aws-privatelink-consumer.svg)](https://github.com/traveloka/terraform-aws-privatelink-consumer/commits/master)
[![Issues](https://img.shields.io/github/issues/traveloka/terraform-aws-privatelink-consumer.svg)](https://github.com/traveloka/terraform-aws-privatelink-consumer/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/traveloka/terraform-aws-privatelink-consumer.svg)](https://github.com/traveloka/terraform-aws-privatelink-consumer/pulls)
[![License](https://img.shields.io/github/license/traveloka/terraform-aws-privatelink-consumer.svg)](https://github.com/traveloka/terraform-aws-privatelink-consumer/blob/master/LICENSE)
![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)

## Description

A Terraform module which creates an AWS VPC Endpoint for service consumer PrivateLink.

## Table of Content

* [terraform-aws-privatelink-provider](#terraform-aws-privatelink-provider)
   * [Description](#description)
   * [Table of Content](#table-of-content)
   * [Dependencies](#dependencies)
   * [Usage](#usage)
   * [Subnet IDs Selection](#subnet-ids-selection)
   * [Terraform Version](#terraform-version)
   * [Requirements](#requirements)
   * [Providers](#providers)
   * [Modules](#modules)
   * [Resources](#resources)
   * [Inputs](#inputs)
   * [Outputs](#outputs)
   * [Contributing](#contributing)
   * [Authors](#authors)
   * [License](#license)

## Dependencies

Doesn't have any dependencies to any other Terraform module

## Usage

```hcl
module "service-consumer-privatelink" {
  source                = "github.com/traveloka/terraform-aws-privatelink-consumer?ref=master"

  product_domain = "tsi"
  service_name   = "beicalc"
  environment    = "testing"

  vpc_id                = "vpc-abcd0123"
  available_subnet_ids  = ["subnet-0a1b2c34", "subnet-0a1b2d45"]
  security_group_ids    = ["sg-01a23b45"]
  service_provider_name = "com.amazonaws.vpce.ap-southeast-1.vpce-svc-01abc2de3fa4b5cd6"
}
```

## Subnet IDs Selection

Subnets used by interface endpoint must be on the same Availability Zone with the endpoint service. You just need to provide list of available subnets at most one subnet for each Availability Zone. This module will filter provided `available_subnet_ids` which are in the same Availability Zone with the endpoint service and use them.

## Terraform Version

The latest stable version of Terraform which this module tested working is Terraform `0.12.31` on 2021/09/30

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc_endpoint.service_consumer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_subnet.available_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc_endpoint_service.service_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc_endpoint_service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional tags to be added to the VPC Endpoint | `map` | `{}` | no |
| <a name="input_available_subnet_ids"></a> [available\_subnet\_ids](#input\_available\_subnet\_ids) | IDs of the available subnets in which to create the endpoint network interfaces | `list` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the PrivateLink service stack | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Will be used in resources' Environment tag | `string` | n/a | yes |
| <a name="input_private_dns_enabled"></a> [private\_dns\_enabled](#input\_private\_dns\_enabled) | Only for Interface VPC endpoint to AWS services and AWS Marketplace partner service. Whether or not to associate a private hosted zone with the specified VPC | `string` | `"false"` | no |
| <a name="input_product_domain"></a> [product\_domain](#input\_product\_domain) | Abbreviation of the product domain the created resources belong to | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | IDs of the security groups to associate with the VPC Endpoint | `list` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Stack name of the PrivateLink | `string` | n/a | yes |
| <a name="input_service_provider_name"></a> [service\_provider\_name](#input\_service\_provider\_name) | Service name of the PrivateLink service provider | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC in which the endpoint will be used | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_names"></a> [dns\_names](#output\_dns\_names) | List of DNS names for the VPC Endpoint include regional DNS name and zonal DNS name |
| <a name="output_regional_dns_name"></a> [regional\_dns\_name](#output\_regional\_dns\_name) | Regional DNS name for the VPC Endpoint. Use this DNS name to connect to service provider through PrivateLink. |
| <a name="output_regional_hosted_zone_id"></a> [regional\_hosted\_zone\_id](#output\_regional\_hosted\_zone\_id) | Regional hosted zone id for the VPC Endpoint. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing

This module accepting or open for any contributions from anyone, please see the [CONTRIBUTING.md](https://github.com/traveloka/terraform-aws-privatelink-consumer/blob/master/CONTRIBUTING.md) for more detail about how to contribute to this module.

## Authors

- [Febry Antonius](https://github.com/febryantonius)

## License

This module is under Apache License 2.0 - see the [LICENSE](https://github.com/traveloka/terraform-aws-privatelink-consumer/blob/master/LICENSE) file for details.
