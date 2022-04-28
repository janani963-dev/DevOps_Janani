resource "aws_instance" "JWebServer" {
  ami           = var.amiid
  instance_type = var.machinetype
  key_name      = var.keyname

  tags = {
    Name = var.mytag
  }
}