locals {
  domain_name = "ebi-yade.com"

  public_records = [
    {
      name    = "ebi-yade.com"
      type    = "TXT"
      ttl     = "300"
      records = ["google-site-verification=QCOOwO7TZJQsxZQRRldlvFvcRWcyNWahqeiWVI6OpK4"]
    },
    {
      name = "ebi-yade.com"
      type = "MX"
      ttl  = "300"
      records = [
        "1 aspmx.l.google.com.",
        "5 alt1.aspmx.l.google.com.",
        "5 alt2.aspmx.l.google.com.",
        "10 alt3.aspmx.l.google.com.",
        "10 alt4.aspmx.l.google.com.",
      ]
    },
    {
      name = "mail.ebi-yade.com"
      type = "MX"
      ttl  = "300"
      records = [
        "10 mx1.simplelogin.co.",
        "20 mx2.simplelogin.co.",
      ]
    },
    {
      name    = "mail.ebi-yade.com"
      type    = "TXT"
      ttl     = "300"
      records = ["v=spf1 include:simplelogin.co -all"]
    },
    {
      name    = "dkim._domainkey.mail.ebi-yade.com"
      type    = "CNAME"
      ttl     = "300"
      records = ["dkim._domainkey.simplelogin.co."]
    },
    {
      name    = "_dmarc.mail.ebi-yade.com"
      type    = "TXT"
      ttl     = "300"
      records = ["v=DMARC1; p=quarantine; pct=100; adkim=s; aspf=s"]
    },
  ]

  suffix       = "DnsEbiYadeMail"
  suffix_kebab = "dns-ebi-yade-mail"
}
