FROM java:8
ARG VERSION=coucou
COPY /target/API-javaSpringboot-${VERSION}.jar API-javaSpringboot-${VERSION}.jar
EXPOSE 8080
CMD java -jar API-javaSpringboot-${VERSION}.jar
