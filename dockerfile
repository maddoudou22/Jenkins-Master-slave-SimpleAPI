ARG package_version="0.1.0&
FROM java:8
COPY /target/API-javaSpringboot-${package_version}.jar API-javaSpringboot-${package_version}.jar
EXPOSE 8080
CMD java -jar API-javaSpringboot-${package_version}.jar
