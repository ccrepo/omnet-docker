# 📡 Project: Omnet-Docker

Project ActiveMQ-Docker builds and deploys Omnet-Server a Spring-Boot Application.

## 📖 Usage

### 1️⃣ Pre-requisites:

#### Software:
      
```text
Open JDK version 21
Full docker e.g. curl -fsSL https://get.docker.com | sudo sh
```

This example uses a docker host network and expects the following ports to be available on the local host.

```text
EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3306 (mysql)
EXPOSE 8080 (configurable)
```
        
### 2️⃣ Build:

Navigate to project home directory and execute the following commands

```bash
cd bin
./compile-dev
```

### 3️⃣ Interface:

Spring API available at the following:

Post is configurable (with default 8081)

GET http://localhost:port/api/user/ - get user data 

POST http://localhost:port/api/user/ - create User

POST http://localhost:port/api/user/session - get session Token 

POST http://localhost:port/api/user/access - get access Token 

OAuth2 authorization is performed via configured remote OKTA account.

Required OKTA values are listed in application.properties 

Test examples are in: Omnet Server

```bash
cd bin
ls -l *culr* *wget*
```

### 4️⃣ Components:

The following components are built, configured and delployed.

omnet-server to springboot boot server

omnet-client client to talk to the omnet server.

```bash
cd bin

ser-create-and-login-access-curl
user-create-and-login-session-curl
user-create-curl
user-create-curl-error
user-create-wget
user-read-curl-error
/user-read-curl

example:
 ./user-read-curl  "eyJraWQiOiJSZmNGcnAwMDI3dDhkSlRSTUt0NGYwSmd5UEY2aUpSNm94dzZEb0FfbEhJIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULkdncXg4bXdqVVQ4R0IyNk9wQzY3LTBQZHdlTkkyVjhuV1dnbWlpWGE3RXciLCJpc3MiOiJodHRwczovL2ludGVncmF0b3ItMzg1OTAzMi5va3RhLmNvbS9vYXV0aDIvZGVmYXVsdCIsImF1ZCI6ImFwaTovL2RlZmF1bHQiLCJpYXQiOjE3NzMwNTYwNjUsImV4cCI6MTc3MzE0MjQ2NSwiY2lkIjoiMG9hMTBybTlzaW0zZ21sVDg2OTgiLCJ1aWQiOiIwMHUxMHRraHY0bVZPN3lhRjY5OCIsInNjcCI6WyJvcGVuaWQiXSwiYXV0aF90aW1lIjoxNzczMDU2MDY0LCJzdWIiOiJ1c2VybmFtZWRoa2Jhd3VuZnBreS5zdXJuYW1lZGh6YmJwZGZicmxzYmFiQG9tbmV0LmNvbSJ9.eckNytDw4yjxFKwoMSsp-68ELLU8SazXrhfsfMAwBZfYSg3Q6-RKF1M3oeU8QGi6lU8NnSXGWTqqfR_JD-KbN8cw_yjigrleFhXlBBEzjzU7CO_XEUy-8z4SKZt6iN2YEqbNf97cqu1mmGsfEkr4149bDirKmLWjO1AqE-vXUF1bHJjXS9p-F-JG158GRCBIxaJGAGidqVKx0LegA9AxKlyOVFChzxC5CCm1x8LjRKOlizFCstqX-vd1JsCiegxDCyimkS1008xJmwJZ3dLdYftkeGsZQ_JfWyIb8_ZIhGNNNzDUROEa-9Yk-mSqlu23wABbaNNkht5_0iDEA3pjmw"
{"header":{"id":"c45d1835-3fea-42b4-a508-4384c3dcbeb2","status":true,"code":200,"message":"NYI","originator":"server"},"body":{}}OK
```

Once built you will be able to ssh into the docker container 'omnet' using command

```bash
ssh root@localhost
```

### 5️⃣ OKTA

OKTA account requires the followinig information.

```bash
# OKTA administration application - must be set in docker build or set here if manual build.
# These are used for OKTA administration API operations.
spring.security.oauth2.client.registration.okta-admin.client-id=
spring.security.oauth2.client.registration.okta-admin.client-secret=
spring.security.oauth2.client.provider.okta-admin.issuer-uri=
spring.security.oauth2.client.registration.okta-admin.scope=
okta-admin.api.token=
omnet.okta-admin.domain.name=
omnet.okta-admin.domain.is-active=

# OKTA user application - must be set in docker build or set here if manual build.
# These are used for OKTA /token operations.
spring.security.oauth2.client.registration.okta-user.client-id=
spring.security.oauth2.client.registration.okta-user.client-secret=
spring.security.oauth2.client.provider.okta-user.issuer-uri=
spring.security.oauth2.client.registration.okta-user.scope=
okta-user.api.token=
omnet.okta-user.domain.name=
omnet.okta-user.domain.is-active=

# OKTA validate.
# Used by spring security to validate 
spring.security.oauth2.resourceserver.jwt.issuer-uri=
```

OKTA Setup

```bash
Application Admin with
Client Secret
```

```bash
Application Native 
None Client Authentification
Require PKCE
ROP Grant Type
```

```bash
Access Policy with Rule including ROP Grant Type
```
