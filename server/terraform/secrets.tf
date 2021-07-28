#data "local_file" "secrets" {
#  filename = "./.terraform_secret.yaml"
#}
# For later:
#data "sops_file" "secrets" {
#  source_file = ".secrets.yaml"
#}


data "tls_public_key" "mcd" {
  private_key_pem = var.ssh_key
}

data "tls_public_key" "ubuntu_terraform" {
  private_key_pem = var.terraform_key
}