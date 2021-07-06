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
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
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

