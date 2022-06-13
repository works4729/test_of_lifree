# resource "aws_s3_bucket" "lifree-s3-bucket" {
#   bucket = "lifree-s3-bucket-for-images"
#   acl = "public-read"
  
#   cors_rule {
#     allowed_origins = ["*"]
#     allowed_methods = ["GET"]
#     allowed_headers = ["*"]
#   }

#   tags = {
#     Name = "lifree-s3-bucket-for-images"
#   }
# }

resource "aws_s3_bucket" "artifact" {
  bucket = "artifact-pragmatic-terraform-for-lifree"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}

