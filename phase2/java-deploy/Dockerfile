#Use official jdk runtime as the base image
FROM openjdk:11-jdk-slim

#Set the working directory inside the container
WORKDIR /app

#Copy content of the jar file to the directory inside the container
COPY build/libs/*.jar /app/calculator.jar

#Run the application
ENTRYPOINT ["java", "-jar", "calculator.jar"]
