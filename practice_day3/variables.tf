variable "aws_region" {
  type        = string
  description = "AWS region for resources"
  default     = "ca-central-1"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "uat"
}

variable "s3_bucket_names" {
  type        = list(string)
  description = "List of S3 bucket names for count example"
  default     = ["tf-day08-count-bucket-6767420", "tf-day08-count-bucket-b-53533443-er"]
}

# Set type - used with for_each
variable "s3_bucket_set" {
  type        = set(string)
  description = "Set of S3 bucket names for for_each example"
  default     = ["tf-day08-foreach-bucket-6767420", "tf-day08-foreach-bucket-b-53533443-er"]
}
