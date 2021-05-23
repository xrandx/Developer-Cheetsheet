



# Ubuntu系统

## 一、开放

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







## 二、安装 NGINX 和 MariaDB

使用下面命令进行安装：

```
$ sudo apt update && sudo apt install -y nginx mariadb-server
```

## 三、配置 MariaDB

安装完成后，首次运行 MySQL / MariaDB 的设置，默认会问我们输入密码，我们直接回车即可。

然后输入 `N` 并且回车，就可以重置密码。

```
$ sudo mysql_secure_installation
```

连接到 MariaDB 监控器：

```
$ sudo mariadb
```

新建一个数据库：

```
CREATE DATABASE example_db;
```

赋予权限（注意修改其中的用户名和密码）：

```bash
GRANT ALL PRIVILEGES  ON example_db.* TO 'username'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;

GRANT ALL PRIVILEGES  ON *.* TO 'root'@'localhost' IDENTIFIED BY '962464sql' WITH GRANT OPTION;

mysql -u root -p -h 152.67.216.95  

```

更新权限：

```
FLUSH PRIVILEGES;
exit
```

再次连接：

```bash
$ mariadb -u username -p
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

