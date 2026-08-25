# Auto-Healing Web Tier

Terraform implementation of a highly available and self-healing web tier on AWS.

## 1. Objective

The objective of this assessment is to build an auto-healing web tier that can tolerate the loss of any single VM without application downtime.

The solution uses:

- AWS Application Load Balancer (ALB)
- AWS Auto Scaling Group (ASG)
- Two EC2 instances across two Availability Zones
- NGINX web server
- ALB target group health checks
- ELB health checks integrated with the Auto Scaling Group
- Terraform Infrastructure as Code
- Modular Terraform configuration

The web tier maintains a minimum and desired capacity of two instances.

---

## 2. Why AWS?

AWS was selected because it provides native services that directly support the assessment requirements, including:

- Application Load Balancer for traffic distribution and health checks
- Auto Scaling Group for automatic instance replacement
- EC2 for the web tier
- Availability Zones for high availability
- User Data for automated instance bootstrapping

This allows the solution to provide self-healing behaviour using managed AWS capabilities while keeping the Terraform implementation straightforward.

---

## 3. Architecture

The architecture consists of an internet-facing Application Load Balancer distributing traffic across two NGINX web servers deployed across separate Availability Zones.

The editable draw.io architecture diagram is available here:

- `architecture-diagram.drawio`
- `architecture-diagram.png`

### High-level flow

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