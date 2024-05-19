# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine

# Add the application jar to the container
ADD target/springboot-k8s-demo.jar springboot-k8s-demo.jar

# Copy the required agent files from the official Contrast agent image
COPY --from=contrast/agent-java:latest /contrast/contrast-agent.jar /opt/contrast/contrast.jar

# Copy the Contrast configuration file to the container
COPY contrast_security.yaml /opt/contrast/contrast_security.yaml

# Set the environment variable for Contrast agent options
ENV CONTRAST_OPTS="-javaagent:/opt/contrast/contrast.jar -Dcontrast.config.path=/opt/contrast/contrast_security.yaml"

# Set Java tool options to include the Contrast agent options
ENV JAVA_TOOL_OPTIONS="$CONTRAST_OPTS"

# Expose port 8080 for the application
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "springboot-k8s-demo.jar"]
