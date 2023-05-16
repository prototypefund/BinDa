terraform {
  required_providers {
    keycloak = {
      source = "mrparkers/keycloak"
      version = "4.1.0"
    }
  }
}

provider "keycloak" {
    client_id     = "admin-cli"
  username      = var.kc_admin_username
  password      = var.kc_admin_password   #  read from env via TF_VAR_kc-admin-password
  url           = var.kc_url
}
