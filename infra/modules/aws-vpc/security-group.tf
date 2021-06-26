resource "aws_security_group" "sg" {
  vpc_id      = aws_vpc.vpc.id

  tags = merge( { "Name" = "${local.resource_name}-sg" }, var.tag_map )

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = [ "0.0.0.0/0"  ]
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "allow_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "TCP"
  cidr_blocks       = [ "0.0.0.0/0" ]
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = [ "0.0.0.0/0" ]
  security_group_id = aws_security_group.sg.id
}
