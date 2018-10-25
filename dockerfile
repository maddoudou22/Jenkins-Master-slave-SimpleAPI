ARG package_version
FROM java:8
COPY /target/API-javaSpringboot-${package_version}.jar API-javaSpringboot-${package_version}.jar
EXPOSE 8080
CMD java -jar API-javaSpringboot-${package_version}.jar
