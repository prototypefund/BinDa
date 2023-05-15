# cyber4EDU.dev BinDa

## Local Setup 

```shell
cd cyber4dev-binda-api
docker build -t bin-da-api:latest .
cd ..
docker-compose -up 
```

## Local URLs

* Keycloak
  * http://127.0.0.1:8282
  * OIDC Config
    * http://127.0.0.1:8282/realms/esbz/.well-known/openid-configuration
* BinDa API OpenAPI
  * http://127.0.0.1:8000/swagger/
