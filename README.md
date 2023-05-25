# cyber4EDU.dev BinDa

## Local Setup 

```shell
git clone git@gitlab.com:cyber4EDU/cyber4edu-dev-binda.git
cd cyber4edu-dev-binda
git switch dev
git submodule init
git submodule update 


cd cyber4dev-binda-api
docker build -t binda_api:latest .
cd ..
docker-compose up -d
```

## Local URLs

* Keycloak 
  * Admin User: admin : admin
  * Test User: testuser1 : testuser1 
  * http://127.0.0.1:8282
  * OIDC Config
    * http://127.0.0.1:8282/realms/esbz/.well-known/openid-configuration
* BinDa API OpenAPI
  * http://127.0.0.1:8000/swagger/

## Testuser 

Username: testteacher01 
Password: testteacher01
Realm: esbz
Client: binda-ui_access
Roles:
 * role_binda_lehrer (Lehrer)
 * role_binda_verwaltung (Schulverwaltung)
 * role_binda_leitung (Schulleitung)

### JWT Token Example

Lehrer

```json
{
  "exp": 1684748991,
  "iat": 1684748691,
  "jti": "c0341390-06e3-4f1b-98e8-f5328130ba50",
  "iss": "http://localhost:8282/realms/esbz",
  "aud": "account",
  "sub": "331dac72-9e2e-4677-a3fb-8cca168642be",
  "typ": "Bearer",
  "azp": "binda-ui_access",
  "session_state": "7ce9700f-b108-47db-8d64-58035dbd5e60",
  "acr": "1",
  "realm_access": {
    "roles": [
      "role_esbz_team_teamv4",
      "default-roles-esbz",
      "offline_access",
      "uma_authorization",
      "role_binda_lehrer"
    ]
  },
  "resource_access": {
    "account": {
      "roles": [
        "manage-account",
        "manage-account-links",
        "view-profile"
      ]
    }
  },
  "scope": "openid profile email",
  "sid": "7ce9700f-b108-47db-8d64-58035dbd5e60",
  "email_verified": true,
  "preferred_username": "testteacher01",
  "given_name": "",
  "family_name": "",
  "email": "testteacher01@sus.esbz.berlin"
}
```