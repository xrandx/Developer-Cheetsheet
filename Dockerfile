FROM node:lts-alpine as build-stage
RUN \
npm config set registry https://registry.npm.taobao.org \
&& npm install -g @vue/cli \
&& npm install -g vue
## 创建一个目录
RUN mkdir /vue-workplace
## 指定工作目录
WORKDIR /vue-workplace