variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "ami" {
  # AWS Linux Image
  default = "ami-0de53d8956e8dcf80" 
}
variable "instance_type" {
  default = "t2.micro"
}
variable "vpc_security_group_ids" {
  
}
variable "subnet_id" {
  
}
variable "OSDiskSize" {
  default = "8"
}

variable "ansible_role" {
  
}
