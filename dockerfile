FROM java:8
ARG PACKAGE_VERSION
COPY /target/API-javaSpringboot-${PACKAGE_VERSION}.jar API-javaSpringboot-${PACKAGE_VERSION}.jar
EXPOSE 8080
CMD java -jar API-javaSpringboot-${PACKAGE_VERSION}.jar
