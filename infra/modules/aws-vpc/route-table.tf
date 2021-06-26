resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  tags = merge( { "Name" = "${local.resource_name}-rt" }, var.tag_map )
}

resource "aws_route_table_association" "rt_association1" {
  route_table_id  = aws_route_table.rt.id
  subnet_id       = aws_subnet.subnet_01.id
}

resource "aws_route_table_association" "rt_association2" {
  route_table_id  = aws_route_table.rt.id
  subnet_id       = aws_subnet.subnet_02.id
}

resource "aws_route_table_association" "rt_association3" {
  route_table_id  = aws_route_table.rt.id
  subnet_id       = aws_subnet.subnet_03.id
}

resource "aws_route" "tier1_igw" {
  route_table_id          = aws_route_table.rt.id
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = aws_internet_gateway.igw.id
}
