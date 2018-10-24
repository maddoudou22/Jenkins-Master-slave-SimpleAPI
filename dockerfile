FROM java:8
ADD API-javaSpringboot-0.1.0.jar API-javaSpringboot-0.1.0.jar
EXPOSE 8080
CMD java -jar API-javaSpringboot-0.1.0.jar
