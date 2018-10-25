ARG VERSION=coucou
FROM java:8
COPY /target/API-javaSpringboot-${VERSION}.jar API-javaSpringboot-${VERSION}.jar
EXPOSE 8080
CMD java -jar API-javaSpringboot-${VERSION}.jar
