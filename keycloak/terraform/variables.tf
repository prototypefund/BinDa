variable "kc_url" {
  description = "keycloak URL"
  type = string
  default = "http://localhost:8282"
}

variable "kc_admin_username" {
  description = "keycloak admin username"
  type = string
  default = "admin"
}
variable "kc_admin_password" {
  description = "keycloak admin password"
  type = string
  default = "admin"
}
variable "bin-da-ui_access_client_secret" {
  description = "client secret for the BinDa UI access client"
  type = string
  default = ">Hs8wkP14XzKAj63GpYlKSt529rAsSl83"
}
variable "binda_base_url" {
  description = "BinDa UI Base URL"
  type = string
  default = "http://localhost:9092"
}
variable "binda_login_redirect_url" {
  description = "BinDa UI Valid Login Redirect URL"
  type = string
  default = "http://localhost:9092/*"
}
variable "binda_logout_redirect_url" {
  description = "BinDa UI Valid Logout Redirect URL"
  type = string
  default = "http://localhost:9092/*"
}
