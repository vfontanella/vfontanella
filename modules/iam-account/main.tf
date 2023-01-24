data "aws_caller_identity" "this" {
  count = var.get_caller_identity ? 1 : 0
}

data "aws_organizations_organization" "root" {}

locals {
  root_id      = data.aws_organizations_organization.root.roots[0].id
  account_name = flatten([for k in var.account : k])[0].name
}

resource "aws_organizations_organizational_unit" "this" {
  for_each  = { for k, v in var.ou : k => v if v.enabled && k != null }
  name      = each.key
  parent_id = local.root_id
}

resource "aws_organizations_account" "this" {
  /* for_each = { for account in var.account : account.name => account } */
  for_each = { for k, v in var.account : k => v if v.enabled && k != null }
  # Account name for the "My organizations" overview
  # This is not the account alias which can be used
  # when switching roles
  name = each.key
  # Globally unique email address.
  # Each email account can only have one AWS account
  email = each.value.email
  # A role will be automatically created which has
  # full admin rights. Let's call it "owner"
  role_name = each.value.role_name
  # Tags are not required, but might be helpful for others
  # in the future who read the assigned tags.
  close_on_deletion = each.value.close_on_deletion

  tags = each.value.tags
}
resource "aws_iam_account_alias" "this" {
  for_each      = { for k, v in var.account_alias : k => v if v.enabled && k != null }
  account_alias = each.key
}

resource "aws_iam_account_password_policy" "this" {
  count = var.create_account_password_policy ? 1 : 0

  max_password_age               = var.max_password_age
  minimum_password_length        = var.minimum_password_length
  allow_users_to_change_password = var.allow_users_to_change_password
  hard_expiry                    = var.hard_expiry
  password_reuse_prevention      = var.password_reuse_prevention
  require_lowercase_characters   = var.require_lowercase_characters
  require_uppercase_characters   = var.require_uppercase_characters
  require_numbers                = var.require_numbers
  require_symbols                = var.require_symbols
}
