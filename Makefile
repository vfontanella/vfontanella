SHELL := /bin/bash -o pipefail
args = $(foreach a,$($(subst -,_,$1)_args),$(if $(value $a),$a="$($a)"))

.PHONY:

help:     ## Show this help.
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
cleantf: ## Clean terraform directory and lock file.
	@echo "                                                 "
	@echo "Cleanning .terraform directories and lock file..."
	@echo "                                                 "
	rm -rf modules/*/.terraform
	rm -f modules/*/.terraform.lock.*

justcommit:		## Add changes (Amend) and commit with no edit (--no-edit).
	@echo "                                                  "
	@git add .
	@git commit --amend --no-edit

justpush:		## Force push after justcommit.
	@git push -f

pre-commit:		## Execure precommit check hooks.
	@pre-commit run -a

tfdocs:		## Execure terraform-docs.
	@terraform-docs -c .tfdocs-config.yml .
