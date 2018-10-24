FROM java:8
COPY /var/lib/repositories/API-javaSpringboot_local/snapshot/API-javaSpringboot-0.1.0.jar /var/lib/repositories/API-javaSpringboot_local/snapshot/API-javaSpringboot-0.1.0.jar
EXPOSE 8080
CMD java -jar /var/lib/repositories/API-javaSpringboot_local/snapshot/API-javaSpringboot-0.1.0.jar
