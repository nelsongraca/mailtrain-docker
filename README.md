# Unofficial Docker container for MailTrain

[Docker Hub Releases](https://hub.docker.com/r/nelsongraca/mailtrain)

## Usage

```sh
docker run \
    -d \
    -p 3000:3000 \
    -e "MYSQL_ROOT_PASSWORD=mailtrain" \
    -e "MYSQL_DATABASE=mailtrain" \
    -e "MYSQL_USER=mailtrain" \
    -e "MYSQL_PASSWORD=mailtrain" \
    -e "LDAP_URL=ldap://some_ldap_server:389" \
    -e "LDAP_BASE_DN=dc=domain,dc=example" \
    -e "LDAP_FILTER=(uid={{username}})" \
    -e "LDAP_USERNAME_ATTRIBUTE=uid" \
    -e "LDAP_BIND_DN=uid=bindUser" \
    -e "LDAP_BIND_PASSWORD=somePassword" \
    nelsongraca/mailtrain 
```

You can the access it on http://hostname:3000

Database is included.
