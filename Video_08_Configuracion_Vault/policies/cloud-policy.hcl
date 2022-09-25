path "cloud/*" {
  capabilities = ["create","read","update","list"]
}
path "auth/token/create" {
  capabilities = ["update"]
}