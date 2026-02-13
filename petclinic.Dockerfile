FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY petclinic-3.4.0.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
