FROM openjdk:8
MAINTAINER Amine KAROUI <abderrahmane_oulmderat@carrefour.com>
LABEL application=myproject

ARG JAR_FILE

# Java Version and other ENV
#ENV LANG=en_US.UTF-8
VOLUME ["/applications"]

# Set default user
#USER fqctrace
WORKDIR /applications

COPY ${JAR_FILE} /applications/app.jar

# Entry with exec
#ENTRYPOINT exec java $JAVA_OPTS -jar /applications/app.jar

ENV JAVA_OPTS=""
ENTRYPOINT ["java","-jar","/applications/app.jar"]
