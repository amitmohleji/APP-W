FROM openjdk:8-jre
MAINTAINER "amohleji@xebialabs.com"
ADD target/petclinic.jar /usr/local
WORKDIR /usr/local
CMD ["java" , "-jar","petclinic.jar" ]