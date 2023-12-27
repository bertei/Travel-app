# This data source allows to find a Hosted Zone ID given Hosted Zone name and certain search criteria.
data "aws_route53_zone" "public" {
  name         = "bernatei.com"
  private_zone = false
}

#Create SSL Cert
resource "aws_acm_certificate" "main" {
  domain_name       = var.domain_name
  validation_method = var.validation_method

  tags = {
    Name = "${var.acm_tag_name}"
  }
}

#CNAME Record for the ACM Cert. validation to prove we own the domain.
resource "aws_route53_record" "cert_validation" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.main.domain_validation_options)[0].resource_record_name
  records         = [ tolist(aws_acm_certificate.main.domain_validation_options)[0].resource_record_value ]
  type            = tolist(aws_acm_certificate.main.domain_validation_options)[0].resource_record_type
  zone_id         = data.aws_route53_zone.public.id #hz id we retrieved with data source
  ttl             = 60
}

#Request a DNS validated cert, deploy required validations records and wait for validation to complete.
resource "aws_acm_certificate_validation" "cert" {
  certificate_arn = aws_acm_certificate.main.arn
}