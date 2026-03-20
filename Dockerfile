# FROM maven:3.9.7-eclipse-temurin-17 AS build
# RUN git clone https://github.com/PrachiVpatil96/spring-petclinic.git
# RUN cd spring-petclinic && mvn clean package

# FROM amazoncorretto:17-alpine-jdk
# RUN mkdir /spc && chown nobody /spc
# USER nobody
# WORKDIR /spc
# ##COPY --from=build --chown=nobody /spring-petclinic/target/spring-petclinic-3.3.0-SNAPSHOT.jar /spc/spring-petclinic.jar
# COPY --from=build --chown=nobody /spring-petclinic/target/*.jar /spc/spring-petclinic.jar
# EXPOSE 8080
# CMD ["java", "-jar", "spring-petclinic.jar"]

# FROM tomcat:9-jdk17

# # Remove default apps
# RUN rm -rf /usr/local/tomcat/webapps/*

# # Copy WAR file
# COPY */target/*.jar /usr/local/tomcat/webapps/ROOT.jar

# EXPOSE 8080

FROM amazoncorretto:17

# Set working directory inside container
WORKDIR /spc-app

# Copy the Maven-built JAR from target/
COPY /target/spring-petclinic.jar /app/spring-petclinic.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the Spring Boot JAR
ENTRYPOINT ["java","-jar","/app/spring-petclinic.jar"]