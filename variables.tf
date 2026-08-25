variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "auto-healing-web"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "assessment"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "desired_capacity" {
  description = "Desired number of web instances"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of web instances"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of web instances"
  type        = number
  default     = 3
}
variable "availability_zones" {
  description = "Availability zones for the web tier"
  type        = list(string)

  default = [
    "ap-southeast-2a",
    "ap-southeast-2b"
  ]

  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "At least two availability zones are required."
  }
}