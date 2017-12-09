variable "iam_instance_profile" {default = "EC2-Hostname"}

variable "volume_type" {default = "gp2"}

variable "volume_size" {default = "80"}

variable "instance_type" {default = "m4.large"}

variable "ami_id" {default = "ami-e402d49e"}

variable "subnet_ids"{
  type = "map"
  default = {
    "app" = "subnet-93af76bf"
    "data" = "subnet-5eae7772"
    "web" = "subnet-5fae7773"
    "mgt" = "subnet-88a178a4"
  }
}

variable "names"{type = "list"}

variable "zones"{type = "map"}

variable "owner"{}

variable "env"{}

variable "project"{default="Hcqis"}
