output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "igw-id" {
  value = aws_internet_gateway.igw.id
}

output "subnet_01" {
  value = aws_subnet.subnet_01.id
}

output "subnet_02" {
  value = aws_subnet.subnet_02.id
}

output "subnet_03" {
  value = aws_subnet.subnet_03.id
}

output "sg" {
  value = aws_security_group.sg.id
}
