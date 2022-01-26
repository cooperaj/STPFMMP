provider "pihole" {
  url      = "http://${var.pihole_ip}" # PIHOLE_URL
  password = var.pihole_password       # PIHOLE_PASSWORD
}

provider "pihole" {
  alias    = "pihole2"
  url      = "http://${var.pihole2_ip}" # PIHOLE_URL
  password = var.pihole2_password      # PIHOLE_PASSWORD
}