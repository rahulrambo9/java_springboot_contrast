# Description
 This repo contain one self modified java springboot application and some security testing classes
 which will help to see how contrast caught and monitor vulnerabilities and attacks.

 Prerequiste:
 a) Need Contrast account free or paid --> which will give api key, service key, url etc.
 b) Docker desktop 
 c) Kubernetes cluster - minikube or kubeadm (if need to test on k8)

 ******** Steps for Instrumenting contrast into base image (Dockerfile) *************
1. Add below steps in your base image Dockefile:
* Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine

-> Copy the required agent files from the official Contrast agent image

COPY --from=contrast/agent-java:latest /contrast/contrast-agent.jar /opt/contrast/contrast.jar

-> Copy the Contrast configuration file to the container

COPY contrast_security.yaml /opt/contrast/contrast_security.yaml

-> Set the environment variable for Contrast agent options

ENV CONTRAST_OPTS="-javaagent:/opt/contrast/contrast.jar -Dcontrast.config.path=/opt/contrast/contrast_security.yaml"

-> Set Java tool options to include the Contrast agent options

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

 4.Access the Vulnerable Endpoints:

Use a browser or a tool like curl to access the endpoints to trigger the vulnerabilities.
bash
Copy code
curl "http://localhost/vulnerable?username=%27%20OR%20%271%27=%271%27"
curl "http://localhost:8080/xss?input=<script>alert('XSS')</script>"
curl "http://localhost:8080/idor?id=1"
curl "http://localhost:8080/cmd?command=ls"

Important Notes
Security: Never deploy intentionally vulnerable code in a production environment. Use a separate, isolated environment for security testing.
Ethics: Use the knowledge of creating vulnerabilities responsibly. Always have permission to test the systems you are working on.

![image](https://github.com/rahulrambo9/java_springboot_contrast/assets/128880701/ff1216b8-307b-4ed2-995b-e49b415bcc0a)

 
