# Ubuntu系统

## desktop 初始化

删除多余

```bash
sudo apt-get remove libreoffice-common
sudo apt-get remove thunderbird totem rhythmbox simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-sudoku
```

### 0 换源

编辑 `/etc/apt/sources.list`文件, 在文件最前面添加以下条目(操作前请做好相应备份)：

```bash
deb https://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
```

然后执行命令：

```bash
sudo apt-get update
sudo apt-get upgrade
```

清华

```bash
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
```

163

```bash
deb http://mirrors.163.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ bionic-backports main restricted universe multiverse
```

阿里

```bash
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
```

## 配置 Git

```bash
sudo apt install git-all
```



## WSL
### 配置 WSL2 访问 Windows 上的代理

有两个关键步骤： 1. WSL2 中配置的代理要指向 Windows 的 IP； 2. Windows 上的代理客户端需要允许来自本地局域网的请求；

由于 Linux 子系统也是通过 Windows 访问网络，所以 Linux 子系统中的网关指向的是 Windows，DNS 服务器指向的也是 Windows，基于这两个特性，我们可以将 Windows 的 IP 读取出来。

例如，在 Ubuntu 子系统中，通过 `cat /etc/resolv.conf` 查看 DNS 服务器 IP。

```bash
 172.18.0.1
```

可以看到 DNS 服务器是 ` 172.18.0.1`，通过环境变量 `ALL_PROXY` 配置代理：

```bash
export http_proxy="socks5://172.18.0.1:1080"
export https_proxy="socks5://172.18.0.1:1080"
curl ip.sb # 看看是不是代理成功
```



### 后台运行

在Linux终端运行命令的时候，在命令末尾加上 & 符号，就可以让程序在后台运行

```bash
python standalone.py &
```

对于所有运行的程序，我们可以用jobs –l 指令查看

```bash
jobs -l
```

也可以直接终止后台运行的程序，使用 kill 命令

```bash
kill %1
```

`ctrl + z`

可以将一个正在前台执行的命令放到后台，并且处于暂停状态。

## 查看端口占用

```bash
netstat -ap | grep 8001

lsof -i:8001

#	杀进程

kill -9 5921 #	+PID号
```





### 解决WSL2中Vmmem内存占用过大问题

> [解决WSL2中Vmmem内存占用过大问题](https://www.cnblogs.com/coding8832/p/14445835.html)

1. 按下Windows + R 键，输入 `%UserProfile%` 并运行进入用户文件夹
2. 新建文件 `.wslconfig` ，然后记事本编辑
3. 填入以下内容并保存, memory为系统内存上限，这里我限制最大2gb，可根据自身电脑配置设置

```
[wsl2]
memory=2GB
swap=0
localhostForwarding=true
```

4 然后启动cmd命令提示符，输入 `wsl --shutdown` 来关闭当前的子系统

## 配置 WordPress

### 一、开放

```
sudo -i
```

安装相关依赖

```bash
apt-get install wget
apt-get update -y && apt-get install curl -y
```

开放所有端口

```bash
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F
```

Ubuntu镜像默认设置了Iptable规则，关闭它

```bash
apt-get purge netfilter-persistent
reboot
```

或者强制删除

```bash
rm -rf /etc/iptables 
reboot
```

[自动安装 - OneinStack](https://oneinstack.com/auto/)

```bash
wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz && ./oneinstack/install.sh --nginx_option 1 --php_option 5 --phpcache_option 1 --php_extensions memcached --db_option 2 --dbinstallmethod 1 --dbrootpwd zz1f38f7 --pureftpd  --memcached  --reboot 
```

安装 WordPress

```bash
echo "LANG=zh_CN.utf-8" >> /etc/environment && \
echo "" && \
echo "LC_ALL=zh_CN.utf-8" >> /etc/environment 
source ~/.bashrc

```

```bash
cd /data/wwwroot/benearyou.com
wget http://wordpress.org/latest.tar.gz
tar xzvf latest*
cd wordpress*
sudo rsync -avz . /data/wwwroot/benearyou.com
cd ..
rm -rf latest.tar.gz
rm -rf wordpress
sudo chown -R www /data/wwwroot
sudo chgrp -R www /data/wwwroot
```

替换 WordPress Gravatar 为 v2ex 头像源

```php
// 替换 WordPress Gravatar 为 v2ex 头像源
function theme_get_avatar( $avatar ) {
    $avatar = preg_replace("/\/\/(www|\d|secure|cn).gravatar.com\/avatar\//", "//cdn.v2ex.com/gravatar/", $avatar);
    return $avatar;
}
add_filter('get_avatar', 'theme_get_avatar');
```



### 二、安装 Mysql

使用下面命令进行安装：

```
$ sudo apt update && sudo apt install -y nginx mariadb-server
```

### 三、配置 MySQL 

安装完成后，首次运行 MySQL / MariaDB 的设置，默认会问我们输入密码，我们直接回车即可。

连接到 MySQL 监控器：

```bash
sudo mysql
```

新建一个数据库：

```
CREATE DATABASE example_db;
```

赋予权限（注意修改其中的用户名和密码）：

```sql
GRANT ALL PRIVILEGES  ON wordpress.* TO 'wp_admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;

GRANT ALL PRIVILEGES  ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;

mysql -u root -p -h xxx.xxx.xxx.xx
```

更新权限：

```
FLUSH PRIVILEGES;
exit
```

再次连接：

```bash
mysql -u username -p
```

确保可以正常连接：

```
SHOW DATABASES;
```

设置为当前数据库：

```
USE example_db;
```

新建一个表以进行后续测试：

```bash
CREATE TABLE table1(column1 varchar(255));
INSERT INTO table1 VALUES("Database connection established successfully");
exit
```







