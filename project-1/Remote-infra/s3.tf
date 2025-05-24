resource "aws_s3_bucket" "kaab-saleem-s3" {
  bucket = "kaab-saleem-bucket"

  tags = {
    Name        = "TWS-junoon-state-bucket"
  }
}