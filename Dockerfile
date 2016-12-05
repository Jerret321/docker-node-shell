FROM registry.cn-hangzhou.aliyuncs.com/jerret/node-dev:v0.1.1
MAINTAINER 321jiangtao@gmail.com
RUN npm install -g pm2 webpack
WORKDIR /var/www/blog
EXPOSE 8360
