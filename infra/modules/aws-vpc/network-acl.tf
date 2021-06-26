resource "aws_network_acl" "tier1_nacl" {
  vpc_id        = aws_vpc.vpc.id
  subnet_ids    = [ aws_subnet.subnet_01.id, aws_subnet.subnet_02.id, aws_subnet.subnet_03.id ]
  egress {
    action      = "allow"
    from_port   = 0
    protocol    = "-1"
    rule_no     = 100
    to_port     = 0
    cidr_block  = "0.0.0.0/0"
  }
  ingress {
    action      = "allow"
    from_port   = 0
    protocol    = "-1"
    rule_no     = 100
    to_port     = 0
    cidr_block  = "0.0.0.0/0"
  }
  tags          = merge( { "Name" = "${local.resource_name}-tier1-nacl" }, var.tag_map )
}
