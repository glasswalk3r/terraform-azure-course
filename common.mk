lint:
	@terraform validate
	@terraform fmt
kaboom:
	@terraform destroy
fresh:
	@terraform refresh

