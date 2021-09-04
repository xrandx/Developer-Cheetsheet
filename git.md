## 初始化

```bash
git config user.name ”username”

git config user.email ”username@domain.com”

ssh-keygen -t rsa -C ”username@domain.com”
```

## 关联

```bash
git clone git@github.com:xrandx/Developer-Cheetsheet.git
```

以后获取用：

```bash
git pull origin master 
#	or
git pull origin main
```

## reset 命令

git reset 命令用于回退版本，可以指定退回某一次提交的版本。

```bash
git reset [--soft | --mixed | --hard] [HEAD]
```



**HEAD 说明**

- HEAD 表示当前版本
- HEAD^ 上一个版本
- HEAD^^ 上上一个版本
- HEAD^^^ 上上上一个版本
- 以此类推...

可以使用 ～数字表示

- HEAD~0 表示当前版本
- HEAD~1 上一个版本
- HEAD^2 上上一个版本
- HEAD^3 上上上一个版本
- 以此类推...

`--hard` 参数撤销工作区中所有未提交的修改内容，将暂存区与工作区都回到上一次版本，并删除之前的所有信息提交：

在使用Git的过程中，有些时候我们只想要git服务器中的最新版本的项目，对于本地的项目中修改不做任何理会，就需要用到Git pull的强制覆盖，具体代码如下：

```bash
git fetch --all
git reset --hard origin/master 
git pull
```

## 查看

查看本地分支

```bash
git branch
```

查看远程分支

```bash
git branch -r
```

查看远程和本地分支

```bash
git branch -a
```

## 初始化

```bash
git remote add origin git@xx.git
```

```bash
git push origin main
```



建立追踪关系，在现有分支与指定的远程分支之间 

```bash
git branch --set-upstream [branch] [remote-branch]
```




增加一个新的远程仓库，并命名

`git remote add [shortname] [url]`


取回远程仓库的变化，并与本地分支合并

`git pull [remote] [branch]`



本地分支修改名称
`git branch -m [old_name] [new_name]`



丢弃工作区的 commit

```bash
git checkout --file
```

丢弃工作区的 add

```bash
git reset [filename]
```

## 自动化

```bash
cd ~/Developer-Cheetsheet
time=$(date "+%Y-%m-%d %H:%M:%S")
git add .
git commit -m "${time}"
git push
```



## 多个 ssh

```bash
ssh-keygen -t rsa -f ~/.ssh/id_rsa_gitlab -C "username@domain.com"
```


```bash
ssh-add ~/.ssh/id_rsa_gitlab
```


```bash
git config user.name "username"
git config user.email "username@domain.com"
```



 `C:\Users\Administrator\.ssh\id_rsa_gitlab`

[git配置多个不同邮箱](https://favoorr.github.io/2015/05/27/git-more-sshkeys-more-host/)


 [Windows下使用ssh-add报错 Error connecting to agent: No such file or directory - 进击的Milo - 博客园](https://www.cnblogs.com/attackingmilo/p/Windows-ssh-add-error.html)