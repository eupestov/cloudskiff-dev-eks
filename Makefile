.DEFAULT_GOAL := help

check:	## execute all validators
	terraform init; terraform validate; terraform fmt; tflint; echo $$?

apply:	## terraform apply 
	terraform apply

destroy:	## terraform destroy 
	terraform destroy 

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
