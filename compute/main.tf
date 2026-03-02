resource "aws_security_group" "test-sg" {
    name = "test-sg"
    description = "test-sg"
    vpc_id = var.vpc_id
    
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }

    egress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
  
}

resource "aws_launch_template" "test-lt" {
    instance_type = var.instance_type
    image_id = var.image_id
    key_name = var.key_name
    vpc_security_group_ids = [ aws_security_group.test-sg.id ]

    iam_instance_profile {
      
    }

    block_device_mappings {
      device_name = "/dev/xvda"
      ebs {
        volume_size = var.volume_size
        volume_type = "gp3"
        delete_on_termination = true

      }
    }
  
}