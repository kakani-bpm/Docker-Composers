# Build a JAR File
FROM maven:3.6.3-jdk-8-slim AS stage
WORKDIR /home/app
COPY . /home/app/
RUN mvn -f /home/app/pom.xml clean package

# Create an Image
FROM openjdk:8-jdk-alpine
EXPOSE 5000
COPY --from=stage /home/app/target/Springboot-dockers-0.0.1-SNAPSHOT.jar Springboot-dockers-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["sh", "-c", "java -jar /Springboot-dockers-0.0.1-SNAPSHOT.jar"]
