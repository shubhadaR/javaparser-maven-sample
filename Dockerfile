FROM maven:3.6.0-jdk-11-slim AS build
#COPY src /home/app/src
#COPY pom.xml /home/app
RUN mvn -f pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY target/javaparser-maven-sample-1.0-SNAPSHOT-shaded.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","demo.jar"]