# Auto-Healing Web Tier

Terraform implementation of a highly available and self-healing web tier on AWS.

## 1. Objective

The objective of this assessment is to provision an auto-healing web tier that can tolerate the loss of any single VM without application downtime.

The solution uses:

- AWS Application Load Balancer
- AWS Auto Scaling Group
- Two EC2 instances across two Availability Zones
- NGINX web server
- ALB health checks
- Auto Scaling health checks
- Terraform Infrastructure as Code
- Modular Terraform configuration

The infrastructure is designed to maintain a minimum of two healthy web instances at all times.

---

## 2. Architecture

```text
                         Internet
                            |
                            v
                 +---------------------+
                 | Application Load    |
                 | Balancer            |
                 |                     |
                 | HTTP :80            |
                 | Health Checks       |
                 +----------+----------+
                            |
                 +----------+----------+
                 |                     |
                 v                     v
          +-------------+       +-------------+
          | EC2 / NGINX |       | EC2 / NGINX |
          |             |       |             |
          | AZ: 2a      |       | AZ: 2b      |
          +-------------+       +-------------+
                 ^                     ^
                 |                     |
                 +----------+----------+
                            |
                    Auto Scaling Group
                    Min: 2
                    Desired: 2
                    Max: 2