PROJECT_NAME=terraform-dns-ebi-yade-mail
AWS_PROFILE=ebi-yade
WS=default


.PHONY: init
init:
	cp backup.tf.bak backup.tf && \
	sed -i.bak -e "s/<project-name>/$(PROJECT_NAME)/g" backup.tf && \
	sed -i '' -e "s/<profile>/$(AWS_PROFILE)/g" backup.tf && \
	sed -i '' -e "s/<bucket-name>/$(TF_BUCKET)/g" backup.tf && \
	terraform init


.PHONY: fmt
.SILENT: fmt
fmt:
	terraform fmt
	@for module in $(shell ls -1 modules); \
	do \
		cd modules/$${module} && \
		terraform fmt && \
		cd ../.. ; \
	done


.PHONY: checkout
checkout:
	terraform workspace select $(WS)


.PHONY: apply
apply: checkout
	terraform apply


.PHONY: clean
clean:
	find archive ! -name ".keep" -type f -exec rm -f {} +
