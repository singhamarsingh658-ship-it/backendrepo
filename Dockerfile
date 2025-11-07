# Use official Java 21 image
FROM eclipse-temurin:21-jdk

# Set working directory inside container
WORKDIR /app

# Copy everything into the container
COPY . .

# Build the Spring Boot app (agar mvnw file hai)
RUN ./mvnw clean package -DskipTests || mvn clean package -DskipTests

# Run the generated JAR file automatically
CMD ["java", "-jar", "target/*.jar"]
