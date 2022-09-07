resource "random_id" "id" {
  byte_length = 8
}
resource "aws_s3_bucket" "terraform" {
  bucket = "terraform-${random_id.id.dec}"
  #vpc_id = var.vpc_id
}
data "aws_iam_policy_document" "example" {
  statement {
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["arn:aws:s3:::*"]
    effect    = "Allow"
  }
  statement {
    actions   = ["s3:*"]
    resources = [aws_s3_bucket.terraform.arn]
    effect    = "Allow"
  }
  statement {
    actions   = ["s3:GetObject"]
    resources = [aws_s3_bucket.terraform.arn]
    effect    = "Allow"
  }
  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.terraform.arn]
    effect    = "Allow"
  }
}
