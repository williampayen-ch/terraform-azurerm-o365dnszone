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
  type = map(map(string))
  default = {
    at = {
      name  = "@"
      value = "v=spf1 include:spf.protection.outlook.com -all"
      ttl   = 5
    }
  }
}

variable "core_dns_defaultsrv" {
  type = map(map(string))
  default = {
    sipfederation = {
      name     = "_sipfederationtls._tcp"
      target   = "sipfed.online.lync.com"
      ttl      = 5
      priority = 100
      weight   = 1
      port     = 5061
    },
    siptls = {
      name     = "_sip._tls"
      target   = "sipdir.online.lync.com."
      ttl      = 5
      priority = 100
      weight   = 1
      port     = 443
    }
  }
}


variable "core_dns_defaultcname" {
  type = map(map(string))
  default = {
    autodiscover = {
      record = "autodiscover.outlook.com"
      ttl    = 5
    },
    enterpriseenrollment = {
      record = "enterpriseenrollment.manage.microsoft.com"
      ttl    = 5
    },
    enterpriseregistration = {
      record = "enterpriseregistration.windows.net"
      ttl    = 5
    },
    lyncdiscover = {
      record = "webdir.online.lync.com"
      ttl    = 5
    },
    msoid = {
      record = "clientconfig.microsoftonline-p.net"
      ttl    = 5
    },
    sip = {
      record = "sipdir.online.lync.com"
      ttl    = 5
    }
  }
}

