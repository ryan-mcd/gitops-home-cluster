#terraform apply -var-file=<(sops -d secret.tfvars.json)
terraform {
  required_version = ">= 0.13.0"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.7.4"
    }
    #local = {
    #  source  = "hashicorp/local"
    #  version = "2.1.0"
    #}
    #    sops = {
    #      source = "carlpett/sops"
    #      version = "0.6.3"
    #    }
  }
}


provider "proxmox" {
  pm_parallel     = 3
  pm_tls_insecure = true
  pm_api_url      = var.pm_api_url
  #pm_user         = var.pm_user
  #pm_password     = var.pm_password
  pm_api_token_id         = var.pm_api_token_id
  pm_api_token_secret     = var.pm_api_token_secret
  # Note for future implementation:
  #pm_password = data.sops_file.secrets.data["proxmox.pm_password"]
}
#provider "local" {
#}
#provider "sops" {
#}

