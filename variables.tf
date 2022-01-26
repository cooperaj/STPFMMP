variable "pihole_ip" {
  type      = string
  sensitive = true
}
variable "pihole_password" {
  type      = string
  sensitive = true
}
variable "pihole2_ip" {
  type      = string
  sensitive = true
}
variable "pihole2_password" {
  type      = string
  sensitive = true
}

locals {
  domain_data = jsondecode(file("${path.module}/domains.json"))
}