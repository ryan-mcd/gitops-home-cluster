variable "common" {
  type = map(string)
  default = {
    os_type       = "cloud-init"
    clone         = "ubuntu-cloudimg"
    search_domain = "dfw.56k.sh 56k.sh"
    nameserver    = "172.24.0.254"
  }
}

variable "masters" {
  type = map(map(string))
  default = {
    "k8s-master01" = {
      id          = 300
      cidr        = "172.24.0.10/24"
      ip          = "172.24.0.10"
      cores       = 2
      gw          = "172.24.0.254"
      macaddr     = "5E:95:FA:7A:78:D0"
      memory      = 4096
      disk        = "16G"
      target_node = "pve"
    },
    "k8s-master02" = {
      id          = 301
      cidr        = "172.24.0.11/24"
      ip          = "172.24.0.11"
      cores       = 2
      gw          = "172.24.0.254"
      macaddr     = "5E:95:FA:7A:78:D1"
      memory      = 4096
      disk        = "16G"
      target_node = "pve"
    },
    "k8s-master03" = {
      id          = 302
      cidr        = "172.24.0.12/24"
      ip          = "172.24.0.12"
      cores       = 2
      gw          = "172.24.0.254"
      macaddr     = "5E:95:FA:7A:78:D2"
      memory      = 4096
      disk        = "16G"
      target_node = "pve"
    }
  }
}

variable "workers" {
  type = map(map(string))
  default = {
    "k8s-worker01" = {
      id          = 303
      cidr        = "172.24.0.20/24"
      ip          = "172.24.0.20"
      cores       = 4
      gw          = "172.24.0.254"
      macaddr     = "5E:95:FA:7A:78:D3"
      memory      = 8192
      disk        = "60G"
      target_node = "pve"
    },
    "k8s-worker02" = {
      id          = 304
      cidr        = "172.24.0.21/24"
      ip          = "172.24.0.21"
      cores       = 4
      gw          = "172.24.0.254"
      macaddr     = "5E:95:FA:7A:78:D4"
      memory      = 8192
      disk        = "60G"
      target_node = "pve"
    },
    "k8s-worker03" = {
      id          = 305
      cidr        = "172.24.0.22/24"
      ip          = "172.24.0.22"
      cores       = 4
      gw          = "172.24.0.254"
      macaddr     = "5E:95:FA:7A:78:D5"
      memory      = 8192
      disk        = "60G"
      target_node = "pve"
    }
  }
}

# Proxmox API host URL
variable "pm_api_url" {
  sensitive = true
}
# Proxmox user (e.g. root@pam)
variable "pm_api_token_id" {
  sensitive = true
}
# Proxmox password
variable "pm_api_token_secret" {
  sensitive = true
}
# Root password
variable "root_password" {
  sensitive = true
}
# Cloud-init user (i.e. terraform) password
variable "user_password" {
  sensitive = true
}
#Key used by Terraform and Ansible to login to bastion host to execute tasks
variable "ssh_pub_key" {
  sensitive = true
}
#Key used by Terraform and Ansible to login to bastion host to execute tasks
variable "ssh_key" {
  sensitive = true
}
# Key used by the default Terraform sudo user among all provisioned hosts
variable "terraform_key" {
  sensitive = true
}
