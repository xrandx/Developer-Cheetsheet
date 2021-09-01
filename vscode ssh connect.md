# 使用 VScode 远程 ssh 连接

## 服务器安装 ssh 

以 Ubuntu 为例，通过使用`Ctrl+Alt+T`键盘快捷键或单击终端图标打开终端，然后`openssh-server`通过键入以下命令安装软件包：

```bash
sudo apt update
sudo apt install openssh-server
```

安装完成后，SSH服务将自动启动。要验证安装是否成功并且SSH服务正在运行，请键入以下命令，该命令将显示SSH服务器状态：

```bash
sudo systemctl status ssh
```

Ubuntu附带了一个名为 UFW 的防火墙配置工具。如果系统上启用了防火墙，请确保打开SSH端口：

```bash
sudo ufw allow ssh
```

`username`使用实际用户名和`ip_address`安装SSH的Ubuntu计算机的IP地址更改。

如果您不知道IP地址：

```bash
ip a
```

修改 ssh 配置，在目录 `/etc/ssh/sshd_config` 

```bash
PermitRootLogin yes
PubkeyAuthentication yes
AuthorizedKeysFile	.ssh/authorized_keys
PasswordAuthentication no
ChallengeResponseAuthentication no
```

什么意思看英文就知道了。具体查看 [OpenSSH服务嚣的配置和使用 - APWABC](https://apwabc.net/openssh-server-practices/)，如下：

将**PasswordAuthentication**密码验证关闭，并同时关闭**ChallengeResponseAuthentication**键盘交互方式

```xml
#PasswordAuthentication yes
PasswordAuthentication no

#ChallengeResponseAuthentication no
ChallengeResponseAuthentication no
```

通过**PubkeyAuthentication**开启密钥验证

```xml
#PubkeyAuthentication yes
PubkeyAuthentication yes
```

由于想要无密码登录，我们需要生成公钥和私钥，把 `id_rsa.pub` 改成 `~/.ssh/authorized_keys` （若没有该目录,请执行`mkdir ~/.ssh`创建）



```bash
sudo service ssh start
```

## 客户端使用 vscode 连接 ssh

vscode 需要安装 `Remote SSH` 等。

vscode 编辑 `settings.json`，添加`"remote.SSH.showLoginTerminal": true`

然后点击远程资源管理器，新建连接并且 

```bash
ssh username@ip_address
```

就大功告成了。

## 在Ubuntu上禁用SSH

如果出于某种原因要在Ubuntu计算机上禁用SSH，则可以通过运行以下命令停止SSH服务：

```bash
sudo systemctl stop ssh
```

要再次启动它，请运行：

```bash
sudo systemctl start ssh
```

要禁用SSH服务在系统引导运行期间启动：

```bash
sudo systemctl disable ssh
```

要再次启用它，请输入：

```bash
sudo systemctl enable ssh
```

### 参考链接

> [VSCode远程编辑,Remote-SSH,Remote Development - 亱_風 - 博客园](https://www.cnblogs.com/nightwindnw/p/11097178.html)
>
> [ubuntu 安装ssh - SegmentFault 思否](https://segmentfault.com/a/1190000022103074)