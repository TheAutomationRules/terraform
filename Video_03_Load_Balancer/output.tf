# ----------------------------------------------------------------------------------------------------------------------
# TERRAFORM OUTPUT
# ----------------------------------------------------------------------------------------------------------------------
# SALIDA CON ENLACE DE HTTP A PUERTO 80
output "http_80" {
  value       = "http://${aws_lb.load_balancer.dns_name}"
  description = "HTTP Link Port 80"
}
# SALIDA CON ENLACE DE HTTP A PUERTO 8080
output "http_8080" {
  value       = "http://${aws_lb.load_balancer.dns_name}:8080"
  description = "HTTP Link Port 8080"
}