# NPM

## 配置环境

安装 cnpm

```bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
```


设置代理

```bash
npm config set proxy=http://127.0.0.1:21882
npm config set registry=http://registry.npmjs.org
```

删除代理

```bash
npm config delete proxy
npm config delete https-proxy
```

清理缓存

```bash
npm cache clean -force
```

## BUG


报错`The operation was rejected by your operating system`

解决办法：删除用户目录下的 `.npmrc` 文件

