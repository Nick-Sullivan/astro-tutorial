output "website_endpoint" {
  description = "URL for the S3 Bucket website"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}