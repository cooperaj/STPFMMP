variable "pihole_ip" {}
variable "pihole_password" {}
variable "pihole2_ip" {}
variable "pihole2_password" {}

locals {
  domain_data = jsondecode(file("${path.module}/domains.json"))
}