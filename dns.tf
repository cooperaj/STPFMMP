resource "pihole_dns_record" "primary_A_records" {
  for_each = local.domain_data.domains
  domain   = each.value
  ip       = each.key
}

resource "pihole_cname_record" "primary_CNAME_records" {
  for_each = local.domain_data.cnames
  domain   = each.key
  target   = each.value
}

resource "pihole_dns_record" "secondary_A_records" {
  provider = pihole.pihole2
  for_each = local.domain_data.domains
  domain   = each.value
  ip       = each.key
}

resource "pihole_cname_record" "secondary_CNAME_records" {
  provider = pihole.pihole2
  for_each = local.domain_data.cnames
  domain   = each.key
  target   = each.value
}