# Use official OpenJDK image as base
FROM eclipse-temurin:17-jdk

# Set working directory inside container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/transaction-api-1.0.0.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]