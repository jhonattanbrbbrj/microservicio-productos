# Etapa de compilación con Maven
FROM maven:3.9.5-eclipse-temurin-17 as builder

WORKDIR /app

# Copiar todo el contenido del proyecto
COPY . .

# Construye el JAR (sin ejecutar tests)
RUN mvn clean package -DskipTests

# Etapa final: solo Java y el JAR
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

