terraform {
  required_version = ">= 0.13.0"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.5"
    }
       sops = {
         source = "carlpett/sops"
         version = "0.6.3"
       }
    #local = {
    #  source  = "hashicorp/local"
    #  version = "2.1.0"
    #}
  }
}


provider "proxmox" {
  pm_parallel     = 1
  pm_tls_insecure = true
  pm_api_url      = data.sops_file.secrets.data["data.pm_api_url"]
  pm_user         = data.sops_file.secrets.data["data.pm_user"]
  pm_password     = data.sops_file.secrets.data["data.pm_password"]
  # pm_api_token_id         = data.sops_file.secrets.data["data.pm_api_token_id"]
  # pm_api_token_secret     = data.sops_file.secrets.data["data.pm_api_token_secret"]
}
provider "sops" {
}
#provider "local" {
#}

