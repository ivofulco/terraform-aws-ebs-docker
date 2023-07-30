####################################

# Dependency

install-aws-cli:
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install

install-terraform:
	wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	sudo apt update && sudo apt install terraform

install-graphviz:
	sudo apt update
	sudo apt install graphviz -y

####################################


tf-init:
	terraform init --upgrade

tf-format: tf-init
	terraform fmt --recursive
	terraform validate

tf-plan: tf-format
	terraform plan -out=example.tfplan

tf-apply: tf-plan
	terraform apply --auto-approve

tf-destroy-f:
	terraform destroy --auto-approve

clean:
	rm -rfv .terraform/ .terraform.lock.hcl example.tfplan terraform.tfstate terraform.tfstate.backup