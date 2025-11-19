resource "aws_security_group" "cain_sec-groups" {
  name        = "allow_tls_rules"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.Cain_Existing_VPC.id

  tags = {
    Name = "cain_firewall_rules"
  }
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.cain_sec-groups
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

data "aws_vpc" "Cain_Existing_VPC" {
    id = "vpc-07eede624774fec02"
  # above vpc is already existing in my aws account
}

