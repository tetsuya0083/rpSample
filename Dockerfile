# Dockerfile

# Java 17이 포함된 베이스 이미지
FROM openjdk:17-jdk-slim

# JAR 파일을 컨테이너에 복사
ARG JAR_FILE=build/libs/rpSample-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

# 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "/app.jar"]
