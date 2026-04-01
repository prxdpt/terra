resource "aws_instance" "demo1" {
  ami   = "ami-0ff8a91507f77f867"
  count = var.instance_count

  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  tags          = var.tags

}

locals {
  all_instance_values = aws_instance.demo1[*].id
}

output "instances" {
  value = local.all_instance_values
}
