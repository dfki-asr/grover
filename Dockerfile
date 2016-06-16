FROM maven:3.3.9-jdk-8

RUN mkdir -p /usr/src/grover
WORKDIR /usr/src/grover

ADD . /usr/src/grover

RUN mvn clean package
CMD mvn tomcat7:run
