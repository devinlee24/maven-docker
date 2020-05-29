#依赖JDK环境(alpine docker为了精简体积，默认没有安装bash)
FROM openjdk:8-jdk-alpine
#同步容器时间地区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#指定工作目录(设置后任何指令将在此目录下进行，不存在将自动创建)
WORKDIR /project

#构建参数(maven自定义传递参数)
ARG JAR_FILE_PATH
#复制本地文件至容器里指定的路径(跟ADD指令功能相似)
ADD ${JAR_FILE_PATH} demo/maven-docker.jar
#指定挂载的目录(共享)
VOLUME ["/project"]
RUN chmod 777 /project
#指定docker容器启动时执行的命令(为了缩短Tomcat启动时间，添加一个系统属性指向 “/dev/./urandom” 作为Entropy Source)
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "demo/maven-docker.jar"]

#1.打包命令：mvn clean package dockerfile:build -DskipTests
#2.启动命令：docker run --name maven-docker -p 80:8080 -v /Users/devinlee/project:/project -d 58319096d218