variable "region" {
  type = string
  description = "Region for the resource "
  
}


variable "cluster-name" {
    type = string
    description = "name of the cluster to be created"
  
  
}


variable "instance-types" {
    type = list(string)
   # default = [ "t2.micro" ]
  
}

data "aws_availability_zones" "available" {
  state = "available"
}

variable "desired_size" {
  description = "Auto-scaling size"
  type = number
  
}

variable "max_size" {
  type = number
  description = "Maximum size of instance to scale"
  
}

variable "min_size" {
  type = number
  description = "Minimum number of instance"
  
}

variable "max_unaval" {
  description = "The maximum number of unavailable instance"
  type = number
}

variable "cidr_block" {
  description = "The cidr block for the network"
  
}

variable "dns_enable" {
  description = "Enabling dns support"
  type = bool
    
}

variable "dns_host" {
  description = "Enabling dns hostname"
  type = bool
  
}
