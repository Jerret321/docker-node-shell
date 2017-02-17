FROM registry.cn-hangzhou.aliyuncs.com/jerret/node-dev:v0.1.1
MAINTAINER imjiangtao.com
WORKDIR /var/www/blog
ADD https://raw.githubusercontent.com/Jerret321/firekylin/blog/package.json /var/www/blog/package.json
RUN npm install -g webpack pm2 && npm install
EXPOSE 8360
