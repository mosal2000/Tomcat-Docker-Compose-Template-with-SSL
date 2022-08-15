# Tomcat Docker-Compose Template with SSL and Manager

## Creating SSL Cert
Certificate need to be created under ssl directory:
```
$ openssl req -x509 -newkey rsa:4096 -keyout localhost-rsa-key.pem -out localhost-rsa-cert.pem -days 36500
```
Default password: changeit1

## Running Docker
Build docker image use this command.
```
$ docker-compose build
```
To Run docker use one of these commands.
```
$ docker-compose up
$ docker-compose up --build

```
To Run docker using detache mode use one of these commands.

```
$ docker-compose up -d
$ docker-compose up --build -d
```

## Tomcat Manager
Currently, the username for Tomcat Manager is admin wirh changeit001 as the password. Please change it ic conf/tomcat-users.xml.

```
  <user username="admin" password="changeit001" roles="manager-gui"/>
```

