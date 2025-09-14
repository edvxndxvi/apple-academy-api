FROM openjdk:21 AS builder

WORKDIR /app

COPY . .

RUN mvn clean install

FROM openjdk:21

WORKDIR /app

COPY --from=builder /target/apple-academy-api-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]