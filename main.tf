# main.tf

resource "null_resource" "foo" {
  triggers = {
    foo = var.project
  }
}

resource "aws_s3_bucket" "test_SJgAzFfpM4xyaXAi" {
  bucket = "test"
}

resource "aws_s3_bucket_public_access_block" "test_SJgAzFfpM4xyaXAi" {
  bucket                  = aws_s3_bucket.test_SJgAzFfpM4xyaXAi.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "test_SJgAzFfpM4xyaXAi" {
  bucket = aws_s3_bucket.test_SJgAzFfpM4xyaXAi.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "test_SJgAzFfpM4xyaXAi" {
  bucket = aws_s3_bucket.test_SJgAzFfpM4xyaXAi.id

  versioning_configuration {
    status = "Disabled"
  }
}
