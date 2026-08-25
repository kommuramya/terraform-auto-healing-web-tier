output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.network.subnet_ids
}

output "alb_security_group_id" {
  description = "Security group ID for the application load balancer"
  value       = module.security.alb_security_group_id
}

output "web_security_group_id" {
  description = "Security group ID for the web servers"
  value       = module.security.web_security_group_id
}

output "load_balancer_dns_name" {
  description = "DNS name of the application load balancer"
  value       = module.load_balancer.load_balancer_dns_name
}