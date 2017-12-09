variable "security_groups"{
  type = "map"
  default = {
    "app" = ["sg-e8c6fb96"]
    "data" = ["sg-e8c6fb96"]
    "web" = ["sg-08c0fd76"]
    "mgt" = ["sg-e8c6fb96","sg-08c0fd76"]
  }
}
