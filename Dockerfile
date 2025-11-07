# Step 1: Use official Maven + JDK image to build the app
FROM maven:3.9.6-eclipse-temurin-21 AS build

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy pom.xml and all source code
COPY . .

# Step 4: Give permission to mvnw (important!)
RUN chmod +x ./mvnw || true

# Step 5: Build the Spring Boot JAR (skip tests for faster build)
RUN ./mvnw clean package -DskipTests || mvn clean package -DskipTests

# Step 6: Use lightweight JDK image for runtime
FROM eclipse-temurin:21-jdk

# Step 7: Set work directory for running app
WORKDIR /app

# Step 8: Copy built JAR file from previous stage
COPY --from=build /app/target/*.jar app.jar

# Step 9: Expose port 8080 (default Spring Boot port)
EXPOSE 8080

# Step 10: Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
