output "s3_bucket_name" {
  description = "S3 bucket for state storage"
  value       = aws_s3_bucket.terraform_state.id
}

output "dynamodb_table_name" {
  description = "DynamoDB table for locking"
  value       = aws_dynamodb_table.terraform_locks.id
}

output "aws_region" {
  description = "AWS region"
  value       = var.aws_region
}
