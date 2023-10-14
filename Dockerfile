FROM gradle:8.3.0-jdk17-jammy as builder
LABEL stage=builder
WORKDIR /opt/app
COPY build.gradle settings.gradle gradlew ./
COPY gradle gradle
COPY src src
RUN gradle clean build
 
FROM eclipse-temurin:17-jre-jammy
LABEL maintainer="Vishnu https://github.com/mvishnumohan"
LABEL version="1.0"
LABEL description="Sample Spring Boot application"
WORKDIR /opt/app
EXPOSE 8080
COPY --from=builder /opt/app/build/libs/api-*-SNAPSHOT.war api.war
ENTRYPOINT ["java", "-jar", "api.war" ]