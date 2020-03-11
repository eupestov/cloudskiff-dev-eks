resource "aws_key_pair" "admin" {
  key_name   = "admin-key-${random_string.suffix.result}"
  public_key = var.aws_admin_public_key
}
