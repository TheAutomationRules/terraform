provider "vault" {
  skip_tls_verify = true
  # Configuration options
  address         = "http://${var.vault_addr}:8200"
  token           = var.vault_root_token
}