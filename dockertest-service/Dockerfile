FROM openjdk:8-jdk-alpine
MAINTAINER greg@netifi.com
ARG JAR_FILE
RUN mkdir -p /opt/netifi
COPY build/libs/${JAR_FILE} /opt/netifi/app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/opt/netifi/app.jar"]
