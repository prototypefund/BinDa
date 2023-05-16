resource "keycloak_realm" "realm_esbz" {
  realm             = "esbz"
  display_name      = "ESBZ Realm"
  display_name_html = "<div class=\"kc-logo-text\"><span>ESBZ Realm</span></div>"
  enabled           = true
  user_managed_access = true
}

resource "keycloak_openid_client" "bin-da-ui_access"e {
  realm_id    = keycloak_realm.realm_esbz.id
  client_id   = "bin-da-ui_access"
  access_type = "CONFIDENTIAL"
  client_secret = var.bin-da-ui_access_client_secret
  base_url                                 = var.binda_base_url
  description                              = "User Access to BinDa UI"
  direct_access_grants_enabled             = true
  exclude_session_state_from_auth_response = false
  name                                     = "User Access to BinDa UI"
  standard_flow_enabled                    = true
  valid_redirect_uris = [
    var.binda_login_redirect_url
  ]
  valid_post_logout_redirect_uris = [
    var.binda_logout_redirect_url
  ]
}
