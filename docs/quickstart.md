# Quickstart

You can download prebuilt jar file to your local disk.

make sure you have java installed.

and copy application.yml to your application-dev.yml

then you can run application via

```bash
java  -Dfile.encoding=UTF-8  \
         --spring.config.location=/var/www/config/application-dev.yml
        -jar build/libs/josense-0.0.1-SNAPSHOT.jar
```