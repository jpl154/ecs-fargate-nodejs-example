output "Public_LB_DNS_name" {
  description = "Public LB address to connect too"
  value       = module.fargate.Public_LB_DNS_name
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.quickstart_vpc.vpc_id
}