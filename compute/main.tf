data "aws_ssm_parameter" "golden-ami" {
    name = "/golden-ami/latest"
  
}

data "aws_iam_instance_profile" "existing" {
    name = var.instance_profile_name
  
}