#依赖JDK环境(镜像)
FROM openjdk:8-jdk-alpine
#指定挂载的目录(共享)
VOLUME /tmp
#构建参数(mvn自定义变量)
ARG JAR_FILE_PATH
#复制本地文件至容器里指定的路径(跟ADD指令功能相似)
COPY ${JAR_FILE_PATH} maven-docker.jar
#指定docker容器启动时执行的命令
ENTRYPOINT ["java", "-jar","maven-docker.jar"]