# Quickstart
This guide show you how to quick run an josense web app

## Prequirement

* JDK 8.* or latest JDK
* Postgresql DB , 10.* or latest

## Run

You can download prebuilt jar file to your local disk.

make sure you have java installed.

and copy application.yml to your application-dev.yml

then you can run application via

```bash
java  -Dfile.encoding=UTF-8  \
         --spring.config.location=/var/www/config/application-dev.yml
        -jar build/libs/josense-0.0.1-SNAPSHOT.jar
```
## Create mariadb

```
docker volume create mydata
docker run --restart=always --name mydb -v mydata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=admin@123 -d mariadb:10.4 --character-set-server=utf8mb4 --collation-server=utf8mb4_general_ci

```

## Build docker image

```bash
docker build -t josense .
docker run -d --restart=always -p 8080:8080 \
    -v $(pwd)/src/main/resources/application-dev.yml:/opt/application-dev.yml \
    josense /bin/java  -Dfile.encoding=UTF-8  \
     -Dspring.config.location=/opt/application-dev.yml \
      -jar /opt/josense.jar 
    

```

## Docker compose

```bash

   josense:
     image: josense
     volumes:
       - /home/data/www/josense/vol:/opt/vol # map the josense directory to container's /opt/vol, you can put config file into it
     restart: always
     command: /bin/java -Dfile.encoding=UTF-8  -Dspring.config.location=/opt/vol/application-dev.yml -jar /opt/josense.jar

```


## nginx reverse proxy configure

```bash
server {
    listen 18080;
    server_name www.netroby.com;
    if ($host != "www.netroby.com") {
        return 444;
    }
    location / {
        proxy_set_header Host www.netroby.com; # Must have
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; # Must have
        proxy_redirect http://www.netroby.com:18080 https://www.netroby.com/; # Must have
        proxy_redirect http://josense:8080 https://www.netroby.com/; # Must have
        proxy_pass http://josense:8080;
    }
}
server {
    listen 18080;
    server_name netroby.com;
    return 301 http://www.netroby.com$request_uri;
}

```