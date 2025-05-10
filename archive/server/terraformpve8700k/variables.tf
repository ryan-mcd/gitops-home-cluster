variable "common" {
  type = map(string)
  default = {
    os_type       = "cloud-init"
    clone         = "ubuntu-cloudimg"
    nameserver    = "10.24.0.254"
  }
}

variable "masters" {
  type = map(map(string))
  default = {
    # "k8s-master01" = {
    #   id          = 300
    #   cidr        = "10.24.0.10/24"
    #   ip          = "10.24.0.10"
    #   cores       = 2
    #   gw          = "10.24.0.254"
    #   macaddr     = "5E:95:FA:7A:78:D0"
    #   memory      = 4096
    #   disk        = "24G"
    #   disk2       = "400G"
    #   target_node = "pve8700k"
    # },
    "k8s-master02" = {
      id          = 301
      cidr        = "10.24.0.11/24"
      ip          = "10.24.0.11"
      cores       = 8
      gw          = "10.24.0.254"
      macaddr     = "5E:95:FA:7A:78:D1"
      memory      = 16384
      disk        = "120G"
      disk2       = "350G"
      target_node = "pve8700k"
    }
#     },
#     "k8s-master03" = {
#       id          = 302
#       cidr        = "10.24.0.12/24"
#       ip          = "10.24.0.12"
#       cores       = 2
#       gw          = "10.24.0.254"
#       macaddr     = "5E:95:FA:7A:78:D2"
#       memory      = 4096
#       disk        = "24G"
#       disk2       = "400G"
#       target_node = "pve8700k"
#     }
#   }
# }

# variable "workers" {
#   type = map(map(string))
#   default = {
#     "k8s-worker01" = {
#       id          = 303
#       cidr        = "10.24.0.20/24"
#       ip          = "10.24.0.20"
#       cores       = 4
#       gw          = "10.24.0.254"
#       macaddr     = "5E:95:FA:7A:78:D3"
#       memory      = 8192
#       disk        = "160G"
#       disk2       = "400G"
#       target_node = "pve8700k"
#     },
#     "k8s-worker02" = {
#       id          = 304
#       cidr        = "10.24.0.21/24"
#       ip          = "10.24.0.21"
#       cores       = 4
#       gw          = "10.24.0.254"
#       macaddr     = "5E:95:FA:7A:78:D4"
#       memory      = 8192
#       disk        = "160G"
#       disk2       = "400G"
#       target_node = "pve8700k"
#     },
#     # "k8s-worker03" = {
#     #   id          = 305
#     #   cidr        = "10.24.0.22/24"
#     #   ip          = "10.24.0.22"
#     #   cores       = 4
#     #   gw          = "10.24.0.254"
#     #   macaddr     = "5E:95:FA:7A:78:D5"
#     #   memory      = 8192
#     #   disk        = "60G"
#     #   disk2       = "400G"
#     #   target_node = "pve8700k"
#     # }
  }
}
#Key used by Terraform and Ansible to login to bastion host to execute tasks
variable "ssh_pub_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVVQwsXxOMFK4D3gaE0YPV9pxKZ39lA7E7CRw5ZLJWJo+1fzIaEPsUmuLTtCgZqTdnkishV03RZ2e9k6mkNr537+fJJeK62KXPmyGKSgxZRZhKAcH+n80y2IZy+ZxitZDBH0MkfYI4zPQlo7EaW4FVbDbpDK0MYLcnNbHogvpVxxPBMNjgGor5esTWkqMABSIG3aKdYj1+oE6D59WuEgIaMngYXUgzob3CUxTQJOQoNaPgdYOCE8yUP33e6RCk92uyS1y6RjQpDIejmmvoJNUfKh1WOT1+tpdT/rnPxohE/B1AVp6ZCs1hDqhV8XdwIVQVUljK12NJmCQK//A8kDZ2g4tHEJZ7RDhfUvCh7t6lnoyFL4Hq0kCRLekMaVmSHHWpRj/nsOfKE7vdTn0xPeuaF+W5UutZjA0yqE218dSlxRHg6qnvFBi0dazpZvhdE13WCChQYSM2Tw0dRxdk4RETpkqLvVWRvuQ1b/kQArY7gPx6EZS18VXNfhvxEcgLL1czRR+9x2sfPxMzu8KFYJDgGaqnUjFnYklM95QdcOXTtxBajAmm/RCkqhP4haDD/ox4Sxk3avLg7Mn7fRtOQOiY6r2i2ul64xRAytTAxqlm1HjPAXoHPRaIIELV9AG8whzMbAnvvnB4hxIZp4siXXOEokp1Kb5ydKONeY9bLjKyWw== @"
}
variable "addl_pub_key1" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHzQMo1Lwdz8i34UZi8UVvzS7VAa/n+hHAf3vXtlWx4C pred-laptop"
}
variable "addl_pub_key2" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMF/waMtpOx+6242Qa9Xf1S09NKZ6FXz4vZAir0YBVMR fedora-gpu"
}
