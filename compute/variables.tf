variable "volume_size" {
    type = number
  
}

variable "vpc_id" {
    type = string
  
}

variable "instance_type" {
    type = string
  
}

variable "image_id" {
    type = string
  
}

variable "key_name" {
    type = string
  
}

variable "max_size" {
    type = number
  
}

variable "min_size" {
    type = number
  
}

variable "desired_capacity" {
    type = number
  
}

variable "subnet_ids" {
    type = list(string)
  
}