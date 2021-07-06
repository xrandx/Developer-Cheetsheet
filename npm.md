

# 配置环境

## NVM

https://github.com/coreybutler/nvm-windows/releases

如果没什么特别要求，无脑下一步即可

如果之前已安装`node`,作者的建议是卸载原有的 `node`版本,避免发生冲突

配置setting.txt文件,主要是配置为国内镜像源镜像源
配置文件在：`%appdata%\nvm` 下

```json
node_mirror: https://npm.taobao.org/mirrors/node/
npm_mirror: https://npm.taobao.org/mirrors/npm/
```

```bash
nvm ls #可列出已安装的node版本

nvm install latest # 安装指定版本的node nvm install [arch]
nvm uninstall 13.6.0 # 卸载指定版本 nvm uninstall
```

设置镜像源 nvm node_mirror <node_mirror_url>

- 设置`node`镜像源

```
nvm node_mirror https://npm.taobao.org/mirrors/node/
```

- 设置`npm`镜像源

```
nvm npm_mirror https://npm.taobao.org/mirrors/node/
```

切换 node

```bash
C:\Users\kevty>nvm use 16.4.2
Now using node v16.4.2 (64-bit)
```



```bash
nvm list #查看自己当前电脑安装了哪些版本的 Node
nvm list available #查看目前可安装的 LTS 和 current  Node 版本
nvm install latest #安装最新 current 版本 的 Node 
nvm install lts #安装最新 LTS 版本 的 Node，该命令仅限 32 位操作系统
nvm install Node版本号 #安装指定版本号的 Node 
nvm uninstall Node版本号 #卸载指定版本号的 Node
nvm use Node版本号 #使用指定版本号的 Node
```

## NRM



```bash
npm install -g nrm

nrm ls
* npm -------- https://registry.npmjs.org/
yarn ------- https://registry.yarnpkg.com/
cnpm ------- http://r.cnpmjs.org/
taobao ----- https://registry.npm.taobao.org/
nj --------- https://registry.nodejitsu.com/
npmMirror -- https://skimdb.npmjs.com/registry/
edunpm ----- http://registry.enpmjs.org/
```

使用 taobao 源作为默认的 npm 源

```bash
nrm use taobao
    # Registry has been set to: https://registry.npm.taobao.org/
```

- 测试一个源

```bash
nrm test npm
```

- 测试所有源

```bash
nrm test
```

添加/刪除 一个源

- 添加源：nrm add [home]，home参数主要用于访问源的主页（可选）

```bash
nrm add gating http://npm.gatings.com/  http://gatings.cn/   
```

- 刪除源：nrm del

```bash
nrm del gating
```



## NPM 

安装 cnpm

```bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
```


设置代理

```bash
npm config set proxy=http://127.0.0.1:1080
npm config set registry=http://registry.npmjs.org

set http_proxy=http://127.0.0.1:1080
set https_proxy=http://127.0.0.1:1080

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









如何从Windows中删除Node.js

1.开始-搜索: node – 点击 uninstall node.js, 或者 从卸载程序卸载程序和功能。

2.重新启动（或者您可能会从任务管理器中杀死所有与节点相关的进程）。

3.寻找这些文件夹并删除它们（及其内容）（如果还有）。根据您安装的版本，UAC设置和CPU架构，这些可能或可能不存在：

```bash
C:\Program Files (x86)\Nodejs
C:\Program Files\Nodejs
C:\Users\{User}\AppData\Roaming\npm（或%appdata%\npm）
C:\Users\{User}\AppData\Roaming\npm-cache（或%appdata%\npm-cache）
```

4.检查您的%PATH%环境变量以确保没有引用Nodejs或npm存在。

5.如果仍然没有卸载，请where node在命令提示符下键入，您将看到它所在的位置 – 删除（也可能是父目录）。



## BUG


报错`The operation was rejected by your operating system`

解决办法：删除用户目录下的 `.npmrc` 文件

