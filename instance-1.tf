resource "aws_ec2_host" "instance-1" {
  instance_type     = "mac1.metal"
  availability_zone = var.availability_zone

  # mac1.metal doesn't support host_recovery.
  host_recovery = "off"

  auto_placement = "off"

  tags = {
    Name = var.name
  }
}

resource "aws_instance" "instance-1" {
  ami           = data.aws_ami.mac.image_id
  instance_type = "mac1.metal"

  key_name               = aws_key_pair.this.key_name
  host_id                = aws_ec2_host.instance-1.id
  vpc_security_group_ids = [aws_security_group.this.id]

  user_data = templatefile("user_data.sh", {
    hostname             = var.hostname,
    desktop_picture_path = var.desktop_picture_path
  })

  tags = {
    Name = var.name
  }
}
