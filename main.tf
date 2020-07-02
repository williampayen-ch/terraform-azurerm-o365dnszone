resource "azurerm_dns_zone" "dns" {
  name                = var.core_dns_zone
  resource_group_name = var.core_dns_zone_rgname

  tags = var.tags
}

resource "azurerm_dns_mx_record" "dns-mx" {
  zone_name           = azurerm_dns_zone.dns.zone_name
  resource_group_name = var.core_dns_zone_rgname

  name = "@"
  ttl  = 5

  record {
    preference = 0
    exchange   = var.core_dns_zone_mx_exchange
  }

  tags = var.tags
}

resource "azurerm_dns_txt_record" "dns-txt" {
  foreach             = var.core_dns_defaulttxt
  zone_name           = var.core_dns_zone
  resource_group_name = var.core_dns_zone_rgname

  name = var.core_dns_defaulttxt["name"]
  ttl  = var.core_dns_defaulttxt["ttl"]

  record {
    value = var.core_dns_defaulttxt["value"]
  }

  tags = var.tags
}
resource "azurerm_dns_srv_record" "dns-srv" {
  foreach             = var.core_dns_defaultsrv
  zone_name           = var.core_dns_zone
  resource_group_name = var.core_dns_zone_rgname

  name = var.core_dns_defaultsrv["name"]
  ttl  = var.core_dns_defaultsrv["ttl"]

  record {
    priority = var.core_dns_defaultsrv["priority"]
    weight   = var.core_dns_defaultsrv["weight"]
    port     = var.core_dns_defaultsrv["port"]
    target   = var.core_dns_defaultsrv["target"]
  }

  tags = var.tags
}

resource "azurerm_dns_cname_record" "dns-cname" {
  foreach             = var.core_dns_defaultcname
  zone_name           = var.core_dns_zone
  resource_group_name = var.core_dns_zone_rgname

  name   = var.core_dns_defaultcname["name"]
  ttl    = var.core_dns_defaultcname["ttl"]
  record = var.core_dns_defaultcname["record"]

  tags = var.tags
}
