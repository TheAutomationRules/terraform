#--------------------------------
# Enable userpass auth method
#--------------------------------

resource "vault_auth_backend" "iac-members" {
  type = "userpass"
  path = "iac"
}

# Create the users
resource "vault_generic_endpoint" "iac-member" {
  for_each             = { for username in var.iac_members : username => username }
  path                 = "auth/iac/users/${each.value}"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["admins"],
  "password": "password"
}
EOT

  depends_on = [vault_auth_backend.iac-members]
}

resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}

resource "vault_policy" "cloud_policy" {
  name   = "cloud-policy"
  policy = file("policies/cloud-policy.hcl")
}

#--------------------------------
# create the admin kv secret engine
#--------------------------------

# Enable K/V v2 secrets engine at 'admin-secrets'
resource "vault_mount" "kv-v2" {
  path = "admin-secrets"
  type = "kv-v2"
}

# Enable K/V v2 secrets engine at 'cloud'
resource "vault_mount" "kv-v2-cloud" {
  path = "cloud"
  type = "kv-v2"
}

# Enable AWS secrets engine at 'aws' theautomationrules
resource "vault_aws_secret_backend" "aws_theautomationrules" {
  region                    = local.region
  path                      = "aws/theautomationrules"
  description               = "AWS Secret Engine with IAM"
  access_key                = var.access_key_theautomationrules
  secret_key                = var.secret_key_theautomationrules
  default_lease_ttl_seconds = 900
}


# VAULT AWS SECRET ENGINE ROL
resource "vault_aws_secret_backend_role" "role-theautomationrules" {
  backend         = vault_aws_secret_backend.aws_theautomationrules.path
  name            = "aws-iam-credentials-theautomationrules"
  credential_type = "iam_user"

  policy_document = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:CreateAccessKey",
        "iam:DeleteAccessKey",
        "iam:GetUser",
        "iam:DeleteUser",
        "iam:ListAccessKeys",
        "iam:ListAttachedUserPolicies",
        "iam:ListGroupsForUser",
        "iam:ListUserPolicies",
        "iam:AddUserToGroup",
        "iam:RemoveUserFromGroup"
      ],
      "Resource": ["arn:aws:iam::${var.aws_account_id_theautomationrules}:user/vault-*"]
    },
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iam:AttachUserPolicy",
        "iam:CreateUser",
        "iam:GetUser",
        "iam:DeleteUserPolicy",
        "iam:DetachUserPolicy",
        "iam:PutUserPolicy"
      ],
      "Resource": ["arn:aws:iam::${var.aws_account_id_theautomationrules}:user/vault-*"],
      "Condition": {
        "StringEquals": {
          "iam:PermissionsBoundary": [
            "arn:aws:iam::${var.aws_account_id_theautomationrules}:policy/PolicyName"
          ]
        }
      }
    }
  ]
}
EOT
}

resource "vault_auth_backend" "aws_theautomationrules" {
  type        = "aws"
  path        = "aws_theautomationrules"
  description = "AWS theautomationrules Authentication"
}

resource "vault_aws_auth_backend_client" "aws_theautomationrules" {
  backend    = vault_auth_backend.aws_theautomationrules.path
  access_key = var.access_key_theautomationrules
  secret_key = var.secret_key_theautomationrules
}

#-------------------------------------------------------------------------------
# AWS & SERVICES
#-------------------------------------------------------------------------------

# AWS CREDENTIALS

resource "vault_generic_secret" "aws_theautomationrules_credentials" {
  data_json = <<EOT
  {
    "access_key": "${var.access_key_theautomationrules}",
    "secret_key": "${var.secret_key_theautomationrules}"
  }
  EOT
  path      = "cloud/aws/theautomationrules/vault_nuc_test"

  depends_on = [vault_mount.kv-v2-cloud]
}