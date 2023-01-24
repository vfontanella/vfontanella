# iam-account

## Manage IAM account, Users, Groups, Policies.



# New User
```
  user = {
    "vfontanella" = {
      enabled           = true
      name              = "vfontanella"
      force_destroy     = true
      tags              = {
        "ManagedBy"     = "terraform"
        "admin"         = "true"
        "production"    = "true"
      }
    }
  }
```

# New Group
```
  group = {
    "readers" = {
      enabled = true
      name    = "readers"
    }
  }
```
# New user group membership
  user_group_membership = {
    GroupMembershipUser = {
      enabled            = true
      user               = "user"
      groups             = [
        "readers",
        "devs",
        "owners"
      ]
    }
  }

# New group membership
```
  group_membership = {
  "GroupReaders" = {
    enabled              = true
    group                = "readers"
    users                = [
      "reader"
      ]
    }
  }
}
```
# New user Policy Attachment
```
  user_policy_attachment = {
    "AdminUser" = {
      enabled     = true
      user        = "user"
      policy_arn  = "arn:aws:iam::aws:policy/job-function/SystemAdministrator"
    }
  }
```
# New Role
```
role = {
    "reader" = {
        enabled         = true
        name            = "reader"
        tags            = {
            "ManagedBy" = "terraform"
        }
    }
  }

# New IAM Policy
```
role = {
    "reader" = {
        enabled         = true
        name            = "reader"
        tags            = {
            "ManagedBy" = "terraform"
        }
      }
    }
```
# New Role Policy Attachment
```
  role_policy_attachment = {
    "ReaderReadOnly" = {
        enabled    = true
        role       = "reader"
        policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    }
  }
```

# New Organization Unit
```
ou = {
    "devops" = {
      enabled = true
    }
  }
```
# New Organization Account
```
account = {
    "production" = {
    enabled    = true
    name       = "production"
    email      = "vfontanella@hotmail.com"
    role_name  = "owner"
    tags       = {
        "ManagedBy" = "terraform"
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_account_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_alias) | resource |
| [aws_iam_account_password_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy) | resource |
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_organizations_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account) | resource |
| [aws_organizations_organizational_unit.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_organizations_organization.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | n/a | `any` | n/a | yes |
| <a name="input_account"></a> [account](#input\_account) | Organization Account | <pre>map(object({<br>    enabled           = bool<br>    name              = string<br>    email             = string<br>    role_name         = string<br>    close_on_deletion = optional(bool)<br>    tags              = optional(map(string))<br>  }))</pre> | `{}` | no |
| <a name="input_account_alias"></a> [account\_alias](#input\_account\_alias) | AWS IAM account alias for this account | `list(any)` | `[]` | no |
| <a name="input_allow_users_to_change_password"></a> [allow\_users\_to\_change\_password](#input\_allow\_users\_to\_change\_password) | Whether to allow users to change their own password | `bool` | `true` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `any` | n/a | yes |
| <a name="input_create_account_password_policy"></a> [create\_account\_password\_policy](#input\_create\_account\_password\_policy) | Whether to create AWS IAM account password policy | `bool` | `true` | no |
| <a name="input_dev_users"></a> [dev\_users](#input\_dev\_users) | n/a | `list(string)` | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Gives ability to enable or disable a module | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_get_caller_identity"></a> [get\_caller\_identity](#input\_get\_caller\_identity) | Whether to get AWS account ID, User ID, and ARN in which Terraform is authorized | `bool` | `true` | no |
| <a name="input_group"></a> [group](#input\_group) | Account group | <pre>map(object({<br>    enabled = bool<br>    name    = string<br>  }))</pre> | n/a | yes |
| <a name="input_group_membership"></a> [group\_membership](#input\_group\_membership) | n/a | <pre>map(object({<br>    enabled = bool<br>    group   = string<br>    users   = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_hard_expiry"></a> [hard\_expiry](#input\_hard\_expiry) | Whether users are prevented from setting a new password after their password has expired (i.e. require administrator reset) | `bool` | `false` | no |
| <a name="input_iam_policy"></a> [iam\_policy](#input\_iam\_policy) | n/a | <pre>map(object({<br>    enabled = bool<br>    name    = string<br>    policy  = string<br>  }))</pre> | n/a | yes |
| <a name="input_max_password_age"></a> [max\_password\_age](#input\_max\_password\_age) | The number of days that an user password is valid. | `number` | `0` | no |
| <a name="input_minimum_password_length"></a> [minimum\_password\_length](#input\_minimum\_password\_length) | Minimum length to require for user passwords | `number` | `8` | no |
| <a name="input_ou"></a> [ou](#input\_ou) | Organization Unit | <pre>map(object({<br>    enabled   = bool<br>    name      = optional(string)<br>    parent_id = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_owner_users"></a> [owner\_users](#input\_owner\_users) | n/a | `list(string)` | `[]` | no |
| <a name="input_password_reuse_prevention"></a> [password\_reuse\_prevention](#input\_password\_reuse\_prevention) | The number of previous passwords that users are prevented from reusing | `number` | `null` | no |
| <a name="input_reader_users"></a> [reader\_users](#input\_reader\_users) | n/a | `list(string)` | `[]` | no |
| <a name="input_require_lowercase_characters"></a> [require\_lowercase\_characters](#input\_require\_lowercase\_characters) | Whether to require lowercase characters for user passwords | `bool` | `true` | no |
| <a name="input_require_numbers"></a> [require\_numbers](#input\_require\_numbers) | Whether to require numbers for user passwords | `bool` | `true` | no |
| <a name="input_require_symbols"></a> [require\_symbols](#input\_require\_symbols) | Whether to require symbols for user passwords | `bool` | `true` | no |
| <a name="input_require_uppercase_characters"></a> [require\_uppercase\_characters](#input\_require\_uppercase\_characters) | Whether to require uppercase characters for user passwords | `bool` | `true` | no |
| <a name="input_role"></a> [role](#input\_role) | Principal account IAM identity | <pre>map(object({<br>    enabled            = bool<br>    name               = string<br>    assume_role_policy = optional(string)<br>    tags               = optional(map(string))<br>  }))</pre> | n/a | yes |
| <a name="input_role_policy_attachment"></a> [role\_policy\_attachment](#input\_role\_policy\_attachment) | n/a | <pre>map(object({<br>    enabled    = bool<br>    role       = string<br>    policy_arn = string<br>  }))</pre> | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | n/a | `any` | n/a | yes |
| <a name="input_user"></a> [user](#input\_user) | Account user | <pre>map(object({<br>    enabled              = bool<br>    name                 = string<br>    path                 = optional(string)<br>    permissions_boundary = optional(string)<br>    force_destroy        = optional(bool)<br>    tags                 = optional(map(string))<br>  }))</pre> | n/a | yes |
| <a name="input_user_group_membership"></a> [user\_group\_membership](#input\_user\_group\_membership) | n/a | <pre>map(object({<br>    enabled = bool<br>    user    = string<br>    groups  = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_user_policy_attachment"></a> [user\_policy\_attachment](#input\_user\_policy\_attachment) | n/a | <pre>map(object({<br>    enabled    = bool<br>    user       = string<br>    policy_arn = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_caller_identity_account_id"></a> [caller\_identity\_account\_id](#output\_caller\_identity\_account\_id) | The AWS Account ID number of the account that owns or contains the calling entity |
| <a name="output_caller_identity_arn"></a> [caller\_identity\_arn](#output\_caller\_identity\_arn) | The AWS ARN associated with the calling entity |
| <a name="output_caller_identity_user_id"></a> [caller\_identity\_user\_id](#output\_caller\_identity\_user\_id) | The unique identifier of the calling entity |
| <a name="output_iam_account_password_policy_expire_passwords"></a> [iam\_account\_password\_policy\_expire\_passwords](#output\_iam\_account\_password\_policy\_expire\_passwords) | Indicates whether passwords in the account expire. Returns true if max\_password\_age contains a value greater than 0. Returns false if it is 0 or not present. |
<!-- END_TF_DOCS -->
