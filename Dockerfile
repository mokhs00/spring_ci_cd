FROM openjdk:17-alpine AS builder
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src

RUN chmod +x ./gradlew
RUN ./gradlew bootJar

FROM openjdk:17-alpine
ARG JAR_FILE=build/libs/*.jar
COPY --from=builder ${JAR_FILE} app.jar

RUN chmod +x ./app.jar

ENTRYPOINT ["java","-jar","/app.jar"]