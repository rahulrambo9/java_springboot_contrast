
# Use the custom base image with the Contrast agent
FROM java_spring_contrast_baseimg:test2

# Set the Contrast-specific environment variables and options
#ENV CONTRAST_OPTS="\
#-Dcontrast.application.metadata=bU=java_spring_contrast_app,contactEmail=rahulvhd9@gmail.com,contactName=Rahul \
#-Dcontrast.agent.java.standalone_app_name=java_spring_contrast_app \
#-Dcontrast.application.group=Dev"

# Combine CONTRAST_OPTS with existing JAVA_TOOL_OPTIONS
#ENV JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS} ${CONTRAST_OPTS}"

# Set the Contrast configuration (adjust paths and settings as needed)
ENV JAVA_TOOL_OPTIONS="-javaagent:/opt/contrast/contrast-agent.jar -Dcontrast.agent.java.standalone_app_name=java_spring_contrast_app2 -Dcontrast.config.path=/opt/contrast/contrast_security.yaml"


# Copy your Spring application JAR file into the container
COPY target/springboot-k8s-demo.jar springboot-k8s-demo.jar

# Set the entry point to run your Spring application
ENTRYPOINT ["java","-jar","/springboot-k8s-demo.jar"]

# Set the entrypoint, conditionally adding the Contrast agent
#ENTRYPOINT ["sh", "-c", "java ${ENABLE_CONTRAST:+-javaagent:/opt/contrast/contrast-agent.jar -Dcontrast.config.path=/opt/contrast/contrast_security.yaml -Dcontrast.agent.java.standalone_app_name=java_spring_contrast_app} -jar /springboot-k8s-demo.jar"]