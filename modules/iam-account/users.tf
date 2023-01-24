// User management terraform file
locals {
  policy_role_switch_template = file("${path.module}/policy_role_switch.json")
}


resource "aws_iam_user" "this" {
  for_each = { for k, v in var.user : k => v if v.enabled && k != null }

  name                 = each.key
  path                 = each.value.path
  permissions_boundary = each.value.permissions_boundary
  force_destroy        = each.value.force_destroy
  tags                 = each.value.tags
}

resource "aws_iam_group" "this" {
  for_each = { for k, v in var.group : k => v if v.enabled && k != null }
  //  name       = "${local.account_name}-${each.value.name}"
  name = each.value.name
}

resource "aws_iam_user_policy_attachment" "this" {
  for_each   = { for k, v in var.user_policy_attachment : k => v if v.enabled && k != null }
  user       = each.value.user
  policy_arn = each.value.policy_arn
}

resource "aws_iam_user_group_membership" "this" {
  for_each = { for k, v in var.user_group_membership : k => v if v.enabled && k != null }
  user     = each.value.user
  groups   = each.value.groups
}
resource "aws_iam_group_membership" "this" {
  for_each = { for k, v in var.group_membership : k => v if v.enabled && k != null }
  group    = each.value.group
  name     = "${local.account_name}-${each.value.group}"
  users    = each.value.users
}

resource "aws_iam_policy" "this" {
  for_each = { for k, v in var.iam_policy : k => v if v.enabled && k != null }
  name     = "${local.account_name}-${each.value.name}"
  policy   = format(local.policy_role_switch_template, local.root_id, "${each.value.policy}")
}
