output "alb_dns" {
  value = aws_alb.main.dns_name
}

output "alb_zone_id" {
  value = aws_alb.main.zone_id
}

output "alb_tg_arn" {
  value = aws_alb_target_group.main.arn
}