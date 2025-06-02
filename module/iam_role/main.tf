# IAM role for ECS Task Execution (needed for pulling images from ECR or accessing other AWS resources)
resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
  tags = {
    Name        = var.role_name
    Environment = var.env_tag
  }
}

# IAM policy attachment for ECS task execution role
resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# IAM policy attachment for ECS task execution role
resource "aws_iam_role_policy_attachment" "thiss" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}
