output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.network.subnet_ids
}