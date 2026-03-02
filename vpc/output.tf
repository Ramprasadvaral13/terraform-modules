output "vpc_id" {
    value = aws_vpc.test.id
  
}

output "public_subnet_ids" {
    value = [ for k,s in aws_subnet.test-subnet : s.id if var.subnet[k].public == true ]
  
}

output "private_subnet_ids" {
    value = [ for k,s in aws_subnet.test-subnet : s.id if var.subnet[k].public == false ]
  
}