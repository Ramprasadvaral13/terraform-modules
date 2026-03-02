variable "vpc_cidr" {
    type = string
  
}

variable "route_cidr" {
    type = string
  
}

variable "subnet" {
    type = map(object({
      cidr = string
      az = string
      public = bool
    }))
  
}