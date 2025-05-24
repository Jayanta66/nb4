FROM maven:3.8.5-openjdk-11 AS build

COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:11.0.1-jdk-slim
COPY --from=build /target/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]