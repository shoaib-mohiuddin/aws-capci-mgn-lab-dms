resource "aws_vpc_peering_connection" "peering" {
  peer_owner_id = data.aws_caller_identity.current.account_id
  peer_vpc_id   = data.aws_vpc.target_vpc.id
  vpc_id        = data.aws_vpc.on_prem_vpc.id
  auto_accept   = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  tags = {
    Name = "onPrem-Target"
  }
}

resource "aws_route" "requestor" {
  count                     = length(data.aws_route_tables.target_vpc.ids)
  route_table_id            = data.aws_route_tables.target_vpc.ids[count.index]
  destination_cidr_block    = data.aws_vpc.on_prem_vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}

resource "aws_route" "acceptor" {
  count                     = length(data.aws_route_tables.on_prem_vpc.ids)
  route_table_id            = data.aws_route_tables.on_prem_vpc.ids[count.index]
  destination_cidr_block    = data.aws_vpc.target_vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}
