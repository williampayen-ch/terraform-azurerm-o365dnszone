resource "azurerm_dns_zone" "dns" {
  name                = var.core_dns_zone
  resource_group_name = var.core_dns_zone_rgname

  tags = var.tags
}

resource "azurerm_dns_mx_record" "dns-mx" {
  zone_name           = var.core_dns_zone
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
  for_each            = var.core_dns_defaulttxt
  zone_name           = var.core_dns_zone
  resource_group_name = var.core_dns_zone_rgname

  name = each.key
  ttl  = each.value["ttl"]

  record {
    value = each.value["value"]
  }

  tags = var.tags
}

resource "azurerm_dns_srv_record" "dns-srv" {
  for_each            = var.core_dns_defaultsrv
  zone_name           = var.core_dns_zone
  resource_group_name = var.core_dns_zone_rgname

  name = each.value["name"]
  ttl  = each.value["ttl"]

  record {
    priority = each.value["priority"]
    weight   = each.value["weight"]
    port     = each.value["port"]
    target   = each.value["target"]
  }

  tags = var.tags
}

resource "azurerm_dns_cname_record" "dns-cname" {
  for_each            = var.core_dns_defaultcname
  zone_name           = var.core_dns_zone
  resource_group_name = var.core_dns_zone_rgname

  name   = each.key
  ttl    = each.value["ttl"]
  record = each.value["record"]

  tags = var.tags
}
