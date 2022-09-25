# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List ACL policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage secrets engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List enabled secrets engines
path "sys/mounts"
{
  capabilities = ["read", "list"]
}

# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}

path "admin-secrets/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# PKI
path "pki*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# AWS
path "aws/*" {
  capabilities = ["create","read","update","list"]
}

# Cloud Creds
path "cloud/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}