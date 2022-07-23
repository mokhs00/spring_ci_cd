FROM openjdk:17-alpine
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src

RUN chmod +x ./gradlew
RUN ./gradlew build bootJar

ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

RUN chmod +x ./app.jar

ENTRYPOINT ["java","-jar","/app.jar"]