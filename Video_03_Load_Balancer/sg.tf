# ----------------------------------------------------------------------------------------------------------------------
# AWS Security Group (HTTP: 80, 8080)
# ----------------------------------------------------------------------------------------------------------------------
# Security group Load Balancer
# - Habilitar el acceso desde el exterior a los puertos TCP 80 y 8080
# - Permite el acceso desde el Load Balancer hacia el Security Group de las instancias EC2
resource "aws_security_group" "sg_lb" {
  name        = "sg_lb_${local.az_prefix}-1_001"
  description = "ALB - Security Group"
  vpc_id      = local.vpc_id

  # INGRESS RULES
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Habilita el acceso HTTP al puerto 80"
  }

  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Habilita el acceso HTTP al puerto 8080"
  }

  # EGRESS RULES
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "sg_lb_${local.az_prefix}-1_001"
    Creator = local.creator
  }
}
# ----------------------------------------------------------------------------------------------------------------------
# Security group Instancias EC2
# - Habilitar el acceso desde el Load Balancer a los puertos TCP 80 y 8080 de las instancias
# - Permite el trafico EGRESS
resource "aws_security_group" "sg_service" {
  name        = "sg_staging_${local.az_prefix}_${local.service}_001"
  description = "${local.service} - Security Group"
  vpc_id      = local.vpc_id

  # INGRESS RULES
  ingress {
    from_port       = "80"
    to_port         = "80"
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_lb.id]
    description     = "Habilita el acceso HTTP al puerto 80"
  }

  ingress {
    from_port       = "8080"
    to_port         = "8080"
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_lb.id]
    description     = "Habilita el acceso HTTP al puerto 8080"
  }

  # EGRESS RULES
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "sg_staging_${local.az_prefix}-1_${local.service}_001"
    Creator = local.creator
  }
}