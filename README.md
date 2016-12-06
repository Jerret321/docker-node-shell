### 使用docker管理博客 项目之间彼此隔离
####  创建属于自己的docker镜像

根据自己的爱好，搭建一个base环境，以博主为例，搭建centos，node，npm基础环境镜像。避免"墙"的影响，使用[阿里云docker镜像](https://cr.console.aliyun.com)托管。具体的过程可以参考[这篇文章](https://github.com/widuu/chinese_docker/blob/master/userguide/dockerimages.md)

注：由于使用的是国内的阿里云镜像，修改保存镜像后上传到阿里云镜像。[点击可查看生成新镜像和操作阿里云](https://cr.console.aliyun.com/#/dockerImage/19398/detail)

#### 配置dockerfile 安装必要依赖
```bash
# 拉取一个源
FROM registry.cn-hangzhou.aliyuncs.com/jerret/node-dev:v0.1.1
# 作者信息
MAINTAINER 321jiangtao@gmail.com
# 安装依赖包
RUN npm install -g pm2 webpack
# 设置docker container执行之后的工作目录
WORKDIR /var/www/blog
# 对外暴露的端口
EXPOSE 8360
```

#### 运行程序
配置完Dockerfile后，编译成一个images
```bash
docker build -t jt/blog .
```
此时使用`docker images` 可查看到
```bash
REPOSITORY                                                  TAG                 IMAGE ID            CREATED             SIZE
jt/blog                                                     latest              aca0b53b6bdf        21 hours ago        1.66 GB
```
运行生成的images
```bash
# -v 宿主机和docker container之间的目录映射 理解为软连接即可
# -p 宿主机和docker之间的端口映射
# -t container 别名
# -d 挂载docker container
docker run -p 8360:8360 -v $PWD/blog:/var/www/blog -idt jt/blog
```
运行后会生成一个container id, 使用tmux维护进程
```bash
tmux new-session -s 'docker' // 开启一个前台进程
docker attach container_id // 进去docker container
npm start // 启动web服务
```

### 问题
- [ ] 如何维护docker container一直运行，目前使用tmux来维护，很糙, 且机子重启后docker需要重新启动，重新进行一系列操作
- [ ] 多个端口 多个服务目前实现不了，需要用docker compose解决
