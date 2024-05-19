# Description
 This repo contain one self modified java springboot application and some security testing classes which will help to see how contrast caught and monitor vulnerabilities and attacks.

 ******** Steps for Instrumenting contrast into base image (Dockerfile) *************
1. Add below steps in your base image Dockefile:
* Use an official OpenJDK runtime as a parent image *
FROM openjdk:8-jre-alpine

* Copy the required agent files from the official Contrast agent image *
COPY --from=contrast/agent-java:latest /contrast/contrast-agent.jar /opt/contrast/contrast.jar

* Copy the Contrast configuration file to the container *
COPY contrast_security.yaml /opt/contrast/contrast_security.yaml

* Set the environment variable for Contrast agent options * 
ENV CONTRAST_OPTS="-javaagent:/opt/contrast/contrast.jar -Dcontrast.config.path=/opt/contrast/contrast_security.yaml"

* Set Java tool options to include the Contrast agent options *
ENV JAVA_TOOL_OPTIONS="$CONTRAST_OPTS"

2. Create "Contrast_security.yaml"
api:
  url: https://ce.contrastsecurity.com/Contrast
  api_key: jE6---------------FMgu8Opd
  service_key: CNPX-------IX
  user_name: agent_f---------------------@tisOrg
log:
  level: DEBUG


3.Run the Container with Correct Environment Variables:
Ensure that you pass the necessary environment variables when running the container.

docker run -p 8080:8080 \
  -e CONTRAST__API__URL=https://ce.contrastsecurity.com/Contrast \
  -e CONTRAST__API__API_KEY=jE6657G8888888ZrCnFMgu8Opd \
  -e CONTRAST__API__SERVICE_KEY=CN******LU9IX \
  -e CONTRAST__API__USER_NAME=agent_f1c88e2a-6136-**********@***sOrg \
  java-springboot-contrast:v8

 
