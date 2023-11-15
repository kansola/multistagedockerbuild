# Stage 1: Build
FROM openjdk:11 As build

# Set the working directory
WORKDIR /app

# Copy the Java source code to the container
COPY myjava-app/ .

# Compile the Java application
RUN javac Hello.java

# Stage 2: Final
FROM openjdk:11

# Set the working directory
WORKDIR /app

# Copy the compiled application from the build stage
COPY --from=build /app/Hello.class .

# Run the application
CMD ["java", "Hello"]
