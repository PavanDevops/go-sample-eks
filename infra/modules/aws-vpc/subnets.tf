resource "aws_subnet" "subnet_01" {
  cidr_block        = cidrsubnet(var.cidr, 8, 10)
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
  vpc_id            = aws_vpc.vpc.id
  tags              =  merge( { "Name" = "${local.resource_name}-subnet-01" }, var.tag_map )
}

resource "aws_subnet" "subnet_02" {
  cidr_block        = cidrsubnet(var.cidr, 8, 11)
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true
  vpc_id            = aws_vpc.vpc.id
  tags              =  merge( { "Name" = "${local.resource_name}-subnet-02" }, var.tag_map )
}

resource "aws_subnet" "subnet_03" {
  cidr_block        = cidrsubnet(var.cidr, 8, 12)
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = true
  vpc_id            = aws_vpc.vpc.id
  tags              =  merge( { "Name" = "${local.resource_name}-subnet-03" }, var.tag_map )
}
