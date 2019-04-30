terraform {
  backend "s3" {
    bucket  = "terraforming-iam"
    key     = "cluster"
    region  = "us-east-1"
    profile = "default"
  }
}

module "ec2_server" {
    source = "./modules/ec2"
    
    instance_type = "t2.micro"
    vpc_security_group_ids = "sg-9adee2eb"
    subnet_id = "subnet-c6cb5d9c"

    ansible_role = "leader"
}

resource "local_file" "hosts" {
  filename = "./hosts.ini"
  content = <<-EOF
  [leader]
  ${module.ec2_server.public_ip}
  
  EOF

} 