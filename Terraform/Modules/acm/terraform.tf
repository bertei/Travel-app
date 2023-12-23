resource "aws_route53" "main" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = var.record_type

  alias = {
    name = var.alias_name
    zone_id = var.alias_zoneid
    evaluate_target_health = var.health_check
  }
}