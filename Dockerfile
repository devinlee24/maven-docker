#依赖JDK环境(镜像)
FROM openjdk:8-jdk-alpine
RUN mkdir -p /project
WORKDIR /project
#构建参数(mvn自定义变量)
ARG JAR_FILE_PATH
#复制本地文件至容器里指定的路径(跟ADD指令功能相似)
ADD ${JAR_FILE_PATH} /project/maven-docker.jar
#指定挂载的目录(共享)
VOLUME /project
#指定docker容器启动时执行的命令(为了缩短Tomcat启动时间，添加一个系统属性指向 “/dev/./urandom” 作为Entropy Source)
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "maven-docker.jar"]

#启动命令：docker run --name maven-docker -p 80:8080 -v /Users/devinlee/project:/project -d 58319096d218