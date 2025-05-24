#resource "aws_s3_bucket" "kaab-saleem-s3" {
#  bucket = "${var.env}-${var.bucket_name}"
#
#  tags = {
#    Name        = "${var.env}-${var.bucket_name}"
#    Environment = var.env
#  }
#}

# infra-app/s3.tf

# Add this at the top of your s3.tf or in a variables.tf within infra-app module
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
  numeric = true
}

resource "aws_s3_bucket" "kaab-saleem-s3" {
  # Change this line:
  bucket = "${var.env}-${var.bucket_name}-${random_string.bucket_suffix.id}"

  tags = {
    Name        = "${var.env}-${var.bucket_name}-${random_string.bucket_suffix.id}"
    Environment = var.env
  }
}