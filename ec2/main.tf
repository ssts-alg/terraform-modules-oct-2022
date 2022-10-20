resource "aws_instance" "web" {
  count                       = var.ec2_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.enable_ip
  vpc_security_group_ids      = var.sg_ids

  tags = {
    Name = var.ec2_name
  }
}
