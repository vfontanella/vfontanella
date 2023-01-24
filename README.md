# Terraform module to manage AWS IAM Services

Terraform module to manage AWS IAM services.


## Description

This set of modules provide features to allow the management of AWS IAM resources such as:

- Manages organisations and organisations units
- Manages Organisations accounts and Users
- Manages Roles, policies, permissions and attachments


##
The list of included modules are listed below:
* iam-account
* iam-assumable-role
* iam-assumable-role-with-oidc
* iam-assumable-role-with-saml
* iam-assumable-roles
* iam-assumable-roles-with-saml
* iam-eks-role
* iam-github-oidc-provider
* iam-github-oidc-role
* iam-group-with-assumable-roles-policy
* iam-group-with-policies
* iam-policy
* iam-read-only-policy
* iam-role-for-service-account-eks
* iam-user

## Usage
Each module contain a README file with the instruction how to use it.


### Makefile
A makefile provide some automation to facilitate the operations during module development.

```
Usage: make <target>
  help        Show this help.
  cleantf     Clean terraform directory and lock file
  justcommit  Add changes (Amend) and commit with no edit (--no-edit)
  justpush    Force push after justcommit
  pre-commit  Execure precommit check hooks
  tfdocs      Execure terraform-docs
  ```

### Provider
The modules depends on the AWS provider.

```hcl
provider "aws" {
  version = "~> 4.0"
}
```

### The repository setup
This session explain how to setup the current modules in other to reuse them in other deployments.

```hcl
module "my-repository" {
  source             = "git@github.com:riskscreen/rs-terraform-aws-iam//modules/<module-name>"
}
```

&copy; Riskscreen 2022
