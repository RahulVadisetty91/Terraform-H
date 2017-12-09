#ec2 resource for HQR
resource "aws_instance"  "ec2Instance" {
   ami = "${var.ami_id}"
   count = "${length(var.names)}"
   subnet_id = "${var.subnet_ids[var.zones[element(var.names, count.index)]]}"
   instance_type = "${var.instance_type}"
   iam_instance_profile = "${var.iam_instance_profile}"


  #ebs_block_device {
  #  device_name           = "/dev/sda1"
  #  volume_type           = "${var.volume_type}"
  #  volume_size           = "${var.volume_size}"
  #  delete_on_termination = false
  # }

  tags {
      Name = "${element(var.names, count.index)}"
      Owner = "${var.owner}"
      Environment = "${var.env}"
      Project = "${var.project}"
      Zone = "${var.zones[element(var.names, count.index)]}"
  }

  security_groups = "${var.security_groups[var.zones[element(var.names, count.index)]]}"
  user_data = "${file("script.sh")}"
}

resource "aws_ebs_volume" "example" { 
  availability_zone = "us-east-1a"
  type           =   "${var.volume_type}"
  size           =   "${var.volume_size}"

}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sda2"
  volume_id = "${element(aws_ebs_volume.example.*.id, count.index)}"
  instance_id = "${element(aws_instance.ec2Instance.*.id, count.index)}"
}

