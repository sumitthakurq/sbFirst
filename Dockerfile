FROM openjdk:17-jdk-slim
WORKDIR /opt
# Add the application's jar to the image
COPY target/sbfirst-v1.jar sbfirst-v1.jar



# execute the application
ENTRYPOINT ["java", "-jar", "sbfirst-v1.jar"]
