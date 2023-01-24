locals {
  // The policy is the same for all roles, so we read it once to stay DRY
  // It allows the root account to switch to these roles
  policy_assume_role = templatefile("${path.module}/policy_assume_role.json.tpl", {
    root_account_id = data.aws_caller_identity.this[0].account_id
  })
}

resource "aws_iam_role" "this" {
  for_each           = { for k, v in var.role : k => v if v.enabled && k != null }
  name               = each.key
  assume_role_policy = local.policy_assume_role
  tags               = each.value.tags
}

// Give roles the desired permissions
// Due limitations on aws_iam_role_policy_attachment, is not possible to add more then one policy at the time.
resource "aws_iam_role_policy_attachment" "this" {
  for_each   = { for k, v in var.role_policy_attachment : k => v if v.enabled && k != null }
  role       = each.value.role
  policy_arn = each.value.policy_arn
}
