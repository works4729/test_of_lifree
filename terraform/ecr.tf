#__________  api  __________#
resource "aws_ecr_repository" "lifree-api" {
  name = "lifree-api"
}
resource "aws_ecr_lifecycle_policy" "lifree-api-policy" {
  repository = aws_ecr_repository.lifree-api.name

  policy = <<EOF
  {
    "rules": [
      {
        "rulePriority": 1,
        "description": "Keep last 30 release tagged images",
        "selection": {
          "tagStatus": "tagged",
          "tagPrefixList": ["latest"],
          "countType": "imageCountMoreThan",
          "countNumber": 30
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  }
EOF
}

#__________ front __________#
resource "aws_ecr_repository" "lifree-front" {
  name = "lifree-front"
}
resource "aws_ecr_lifecycle_policy" "lifree-front-policy" {
  repository = aws_ecr_repository.lifree-front.name

  policy = <<EOF
  {
    "rules": [
      {
        "rulePriority": 1,
        "description": "Keep last 30 release tagged images",
        "selection": {
          "tagStatus": "tagged",
          "tagPrefixList": ["latest"],
          "countType": "imageCountMoreThan",
          "countNumber": 30
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  }
EOF
}