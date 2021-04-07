

Dockerfile

拉来体积最小的 node 环境容器，配置源安装 vue ，创建工作目录。

```bash
FROM node:lts-alpine as build-stage
RUN \
npm config set registry https://registry.npm.taobao.org \
&& npm install -g @vue/cli \
&& npm install -g vue
## 创建一个目录
RUN mkdir /vue-workplace
## 指定工作目录
WORKDIR /vue-workplace
```

若通过 json 安装

```bash
# Install app dependencies
COPY package*.json ./
RUN npm install
```





用 Dockerfile 生成镜像并命名

```bash
docker image build ./ -t spec-vue:1.0
```

运行容器，映射文件夹和端口，Windows 下 `CHOKIDAR_USEPOLLING=true` 保持热更新

```bash
docker run --name spec-vue-container --rm -p 8000:8000 -p 8080:8080 -v C:\docker\vue-workplace:/vue-workplace -e "HOST=0.0.0.0" -e "CHOKIDAR_USEPOLLING=true" -it spec-vue:1.0
```



在容器中运行 vue-cli 并分开 0.0.0.0

```bash
vue ui --headless --port 8000 --host 0.0.0.0
```

