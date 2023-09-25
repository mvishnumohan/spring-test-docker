FROM eclipse-temurin:17-jdk-jammy as builder
WORKDIR /opt/app
COPY build.gradle settings.gradle gradlew ./
COPY gradle gradle
COPY src src
RUN ./gradlew clean build --no-daemon
RUN ls
RUN ./gradlew clean build
RUN cd build
RUN ls
 
FROM eclipse-temurin:17-jre-jammy
LABEL maintainer="Vishnu https://github.com/mvishnumohan"
LABEL version="1.0"
LABEL description="Sample Spring Boot application"
WORKDIR /opt/app
EXPOSE 8080
COPY --from=builder /opt/app/build/libs/api-*-SNAPSHOT.war api.war
ENTRYPOINT ["java", "-jar", "api.war" ]