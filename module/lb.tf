resource "aws_lb" "apr-terra-LB" {
  name               = "apr-terra-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.sgname.id
  subnets            = apr-terra-subnet.id

tags = {
Environment = "dev"
}
}