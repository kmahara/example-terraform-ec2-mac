resource "aws_key_pair" "this" {
  key_name   = var.name
  public_key = var.ssh_pubkey
}
