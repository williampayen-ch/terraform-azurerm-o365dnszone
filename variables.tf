variable "core_dns_zone" {
  type = string
}

variable "core_dns_zone_rgname" {
  type = string
}

variable "core_dns_zone_mx_exchange" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "core_dns_defaulta" {
  type = map(string)
  default = {

  }
}

variable "core_dns_defaulttxt" {
  type = list(map(string))
  default = [
    {
      name  = "@"
      value = "v=spf1 include:spf.protection.outlook.com -all"
      ttl   = 5
    }
  ]
}

variable "core_dns_defaultsrv" {
  type = list(map(string))
  default = [
    {
      name     = "_sipfederationtls._tcp"
      target   = "sipfed.online.lync.com"
      ttl      = 5
      priority = 100
      weight   = 1
      port     = 5061
    },
    {
      name     = "_sip._tls"
      target   = "sipdir.online.lync.com."
      ttl      = 5
      priority = 100
      weight   = 1
      port     = 443
    }
  ]
}


variable "core_dns_defaultcname" {
  type = list(map(string))
  default = [
    {
      name   = "autodiscover"
      record = "autodiscover.outlook.com"
      ttl    = 5
    },
    {
      name   = "enterpriseenrollment"
      record = "enterpriseenrollment.manage.microsoft.com"
      ttl    = 5
    },
    {
      name   = "enterpriseregistration"
      record = "enterpriseregistration.windows.net"
      ttl    = 5
    },
    {
      name   = "lyncdiscover"
      record = "webdir.online.lync.com"
      ttl    = 5
    },
    {
      name   = "msoid"
      record = "clientconfig.microsoftonline-p.net"
      ttl    = 5
    },
    {
      name   = "sip"
      record = "sipdir.online.lync.com"
      ttl    = 5
    }
  ]
}

