resource "aws_ecr_repository" "ecr" {
  name                 = "${var.ecr_name}"
  image_tag_mutability = "MUTABLE"

  tags = {
    Name        = "${var.ecr_name}"
    environment = var.env
  }
}

resource "aws_ecr_lifecycle_policy" "ecr_lifecycle" {
  repository = aws_ecr_repository.ecr.name
 
  policy = jsonencode({
   rules = [{
     rulePriority = 1
     description  = "keep last 10 images"
     action       = {
       type = "expire"
     }
     selection     = {
       tagStatus   = "any"
       countType   = "imageCountMoreThan"
       countNumber = 10
     }
   }]
  })
}