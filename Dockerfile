FROM openjdk:jre
COPY build/libs/josense-0.0.1-SNAPSHOT.jar /opt/josense.jar
WORKDIR /opt
CMD ["/bin/java", "-jar", "/opt/josense.jar"]