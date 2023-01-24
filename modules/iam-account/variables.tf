variable "enabled" {
  type        = bool
  default     = false
  description = "Gives ability to enable or disable a module"
}

variable "user" {
  type = map(object({
    enabled              = bool
    name                 = string
    path                 = optional(string)
    permissions_boundary = optional(string)
    force_destroy        = optional(bool)
    tags                 = optional(map(string))
  }))
  description = "Account user"
}

variable "group" {
  type = map(object({
    enabled = bool
    name    = string
  }))
  description = "Account group"
}

variable "role" {
  type = map(object({
    enabled            = bool
    name               = string
    assume_role_policy = optional(string)
    tags               = optional(map(string))
  }))
  description = "Principal account IAM identity"
}

variable "group_membership" {
  type = map(object({
    enabled = bool
    group   = string
    users   = list(string)
  }))
}

variable "user_group_membership" {
  type = map(object({
    enabled = bool
    user    = string
    groups  = list(string)
  }))
}

variable "iam_policy" {
  type = map(object({
    enabled = bool
    name    = string
    policy  = string
  }))
}

variable "role_policy_attachment" {
  type = map(object({
    enabled    = bool
    role       = string
    policy_arn = string
  }))
}

variable "user_policy_attachment" {
  type = map(object({
    enabled    = bool
    user       = string
    policy_arn = string
  }))
}

variable "account" {
  type = map(object({
    enabled           = bool
    name              = string
    email             = string
    role_name         = string
    close_on_deletion = optional(bool)
    tags              = optional(map(string))
  }))
  description = "Organization Account"
  default     = {}
}

variable "ou" {
  type = map(object({
    enabled   = bool
    name      = optional(string)
    parent_id = optional(string)
  }))
  description = "Organization Unit"
  default     = {}
}

variable "get_caller_identity" {
  description = "Whether to get AWS account ID, User ID, and ARN in which Terraform is authorized"
  type        = bool
  default     = true
}

variable "account_alias" {
  description = "AWS IAM account alias for this account"
  type        = list(any)
  default     = []
}

variable "create_account_password_policy" {
  description = "Whether to create AWS IAM account password policy"
  type        = bool
  default     = true
}

variable "max_password_age" {
  description = "The number of days that an user password is valid."
  type        = number
  default     = 0
}

variable "minimum_password_length" {
  description = "Minimum length to require for user passwords"
  type        = number
  default     = 8
}

variable "allow_users_to_change_password" {
  description = "Whether to allow users to change their own password"
  type        = bool
  default     = true
}

variable "hard_expiry" {
  description = "Whether users are prevented from setting a new password after their password has expired (i.e. require administrator reset)"
  type        = bool
  default     = false
}

variable "password_reuse_prevention" {
  description = "The number of previous passwords that users are prevented from reusing"
  type        = number
  default     = null
}

variable "require_lowercase_characters" {
  description = "Whether to require lowercase characters for user passwords"
  type        = bool
  default     = true
}

variable "require_uppercase_characters" {
  description = "Whether to require uppercase characters for user passwords"
  type        = bool
  default     = true
}

variable "require_numbers" {
  description = "Whether to require numbers for user passwords"
  type        = bool
  default     = true
}

variable "require_symbols" {
  description = "Whether to require symbols for user passwords"
  type        = bool
  default     = true
}

/*
variable "aws_organizations_account" {
  type = list(object({
    name  = string,
    email = string
    }
  ))
  description = "Create new organization account"
  default     = []
}
*/

variable "reader_users" {
  type    = list(string)
  default = []
}

variable "dev_users" {
  type    = list(string)
  default = []
}

variable "owner_users" {
  type    = list(string)
  default = []
}

variable "aws_region" {}
variable "access_key" {}
variable "secret_key" {}
variable "environment" {}
