createall: createallws deployyall
deleteall: destroyall deleteallws

createallws:
	terraform init && \
	terraform workspace new dev && \
	terraform workspace new test && \
	terraform workspace new pro && \
	terraform workspace new shared && \
	terraform workspace select default

deployyall:
	terraform workspace select dev && terraform init && terraform apply --auto-approve && \
	terraform workspace select test && terraform init && terraform apply --auto-approve && \
	terraform workspace select pro && terraform init && terraform apply --auto-approve && \
	terraform workspace select shared && terraform init && terraform apply --auto-approve && \
	terraform workspace select default

destroyall:
	terraform workspace select dev && terraform destroy --auto-approve && \
	terraform workspace select test && terraform destroy --auto-approve && \
	terraform workspace select pro && terraform destroy --auto-approve  && \
	terraform workspace select shared && terraform destroy --auto-approve  && \
	terraform workspace select default

deleteallws:
	terraform workspace select default && \
	terraform workspace delete dev && \
	terraform workspace delete test && \
	terraform workspace delete pro && \
	terraform workspace delete shared