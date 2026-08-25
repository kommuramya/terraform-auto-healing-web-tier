variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "Public subnet IDs for the load balancer"
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "The load balancer requires at least two subnets."
  }
}

variable "security_group_id" {
  description = "Security group ID for the load balancer"
  type        = string
}