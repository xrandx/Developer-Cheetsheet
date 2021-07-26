## 初始化

```bash
git config --global user.name ”xrandx”

git config --global user.email ”kevtyle@hotmail.com”

ssh-keygen -t rsa -C ”kevtyle@hotmail.com”
```

## 关联

```bash
git clone git@github.com:xrandx/Developer-Cheetsheet.git

git pull origin master
```

以后获取用：

```bash
git pull origin master 
#	or
git pull origin main
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





