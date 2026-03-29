# Security Group outputs
output "security_group_id" {
  description = "ID of the security group"
  # Changed from aws_security_group.main.id
  value       = aws_security_group.web_sg.id
}

# EC2 Instance outputs
output "instance_ids" {
  description = "IDs of the EC2 instances"
  # Changed from aws_instance.main.id (Using [*] because count is used in main.tf)
  value       = aws_instance.web_server[*].id
}

output "instance_public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.web_server[*].public_ip
}

output "instance_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = aws_instance.web_server[*].private_ip
}

# Outputs demonstrating type usage
output "environment_info" {
  description = "Environment information from string type variable"
  value = {
    name         = var.environment
    type         = "string"
    is_staging   = var.environment == "staging"
    display_name = upper(var.environment)
  }
}

output "storage_info" {
  description = "Storage information from number type variable"
  value = {
    # Changed from var.storage_disk
    disk_size_gb = var.storage_size
    disk_size_mb = var.storage_size * 1024
    type         = "number"
  }
}

output "monitoring_policy" {
  description = "Monitoring configuration from boolean type variable"
  value = {
    # Replaced missing is_delete with enable_monitoring
    enabled     = var.enable_monitoring
    policy_text = var.enable_monitoring ? "Detailed monitoring is enabled" : "Detailed monitoring is disabled"
    type        = "bool"
  }
}

output "region_config" {
  description = "Region configuration from string type variable"
  value = {
    # Replaced allowed_locations with region
    primary = var.region
    type    = "string"
  }
}

output "tags_info" {
  description = "Tags from map type variable"
  value = {
    # Changed from var.resource_tags
    tags       = var.instance_tags
    tag_count  = length(keys(var.instance_tags))
    tag_keys   = keys(var.instance_tags)
    tag_values = values(var.instance_tags)
    type       = "map(string)"
  }
}

output "network_configuration" {
  description = "Network configuration from tuple type variable"
  value = {
    tuple_value   = var.network_config
    vpc_cidr      = element(var.network_config, 0)
    subnet_prefix = element(var.network_config, 1)
    cidr_bits     = element(var.network_config, 2)
    subnet_full   = "${element(var.network_config, 1)}/${element(var.network_config, 2)}"
    type          = "tuple([string, string, number])"
  }
}

output "instance_types_info" {
  description = "Instance types from list type variable"
  value = {
    allowed_types = var.allowed_instance_types
    count         = length(var.allowed_instance_types)
    selected      = var.allowed_instance_types[0]
    type          = "list(string)"
  }
}

output "server_configuration" {
  description = "Server configuration from object type variable"
  value = {
    # Changed from var.vm_config
    config        = var.server_config
    instance_type = var.server_config.instance_type
    name          = var.server_config.name
    monitoring    = var.server_config.monitoring
    type          = "object"
  }
}

output "all_resource_tags" {
  description = "All tags applied to resources (merged common_tags + resource_tags)"
  value       = local.common_tags
}
