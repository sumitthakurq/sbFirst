FROM openjdk:17-jdk-slim
WORKDIR /opt
# Add the application's jar to the image
COPY target/sbFirst-v1.jar sbFirst-v1.jar



# execute the application
ENTRYPOINT ["java", "-jar", "sbFirst-v1.jar"]