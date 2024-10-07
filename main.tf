# main.tf

resource "null_resource" "foo" {
  triggers = {
    foo = var.project
  }
}

resource "aws_s3_bucket" "test-2_rjyi8vpJGfYUyKrJ" {
  bucket = "test-2"
}

resource "aws_s3_bucket_public_access_block" "test-2_rjyi8vpJGfYUyKrJ" {
  bucket                  = aws_s3_bucket.test-2_rjyi8vpJGfYUyKrJ.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "test-2_rjyi8vpJGfYUyKrJ" {
  bucket = aws_s3_bucket.test-2_rjyi8vpJGfYUyKrJ.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "test-2_rjyi8vpJGfYUyKrJ" {
  bucket = aws_s3_bucket.test-2_rjyi8vpJGfYUyKrJ.id

  versioning_configuration {
    status = "Disabled"
  }
}
