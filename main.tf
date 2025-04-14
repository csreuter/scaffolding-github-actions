# main.tf

resource "null_resource" "foo" {
  triggers = {
    foo = var.project
  }
}

resource "aws_s3_bucket" "my-bucket_MLp4M2fh7jaXe5CR" {
  bucket = "my-bucket"
}

resource "aws_s3_bucket_public_access_block" "my-bucket_MLp4M2fh7jaXe5CR" {
  bucket                  = aws_s3_bucket.my-bucket_MLp4M2fh7jaXe5CR.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "my-bucket_MLp4M2fh7jaXe5CR" {
  bucket = aws_s3_bucket.my-bucket_MLp4M2fh7jaXe5CR.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "my-bucket_MLp4M2fh7jaXe5CR" {
  bucket = aws_s3_bucket.my-bucket_MLp4M2fh7jaXe5CR.id

  versioning_configuration {
    status = "Disabled"
  }
}
