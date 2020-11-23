#####################################
# Route53 Config
#####################################
data "aws_route53_zone" "this" {
  name = var.domain_name
}

resource "aws_route53_record" "public" {
  count   = length(var.public_records)
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.public_records[count.index]["name"]
  type    = var.public_records[count.index]["type"]
  ttl     = var.public_records[count.index]["ttl"]
  records = var.public_records[count.index]["records"]
}

/*
resource "aws_route53_record" "this" {
  count   = length(var.dkim_cname_records)
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.dkim_cname_records[count.index]["key"]
  type    = "CNAME"
  ttl     = "600"
  records = [ var.dkim_cname_records[count.index]["value"] ]
}
*/
