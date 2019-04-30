provider "aws" {
  region = "${var.region}"

  profile = "${var.profile}"
}
resource "aws_instance" "instance" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  subnet_id = "${var.subnet_id}"

  root_block_device {
    volume_size = "${var.OSDiskSize}"
    volume_type = "gp2"
    delete_on_termination = true
  }

  # provisioner "local-exec" {
  #   # command = "sed -i '/^[$GROUP_ID]/s/$/\n$PUBLIC_IP/' hosts.ini"
  #   command = "sed -i '/^\[GROUP_ID\]/s/$/\n$PUBLIC_IP/' hosts.ini"

  #   environment = {
  #     GROUP_ID = "${var.ansible_role}"
  #     PUBLIC_IP = "${aws_instance.instance.public_ip}"
  #   }
  # }

}
