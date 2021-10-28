

# bash 常用命令

## 文件操作

复制时排除文件

```bash
rsync -av --exclude='alltrain_res/*' --exclude=''  ~/workspace/cuizhuo/fx/algo-bia-nlp-56-overlap-named-entity-recognition/  ~/workspace/tanghongjian/algo-baojie
```

[rsync 用法教程 - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2020/08/rsync.html)



```bash
rsync -av  --exclude='models/*' --exclude='.git/*'  ~/workspace/yy/algo-bia-nlp-paid-post-classification  ~/workspace/tanghongjian/algo-bia-nlp-paid-post-classification
```





复制多个文件到文件夹

```bash
cp skin_test.pickle skin_train.pickle file_dir
```



显示文件大小


方便阅读的格式显示test目录所占空间情况：

```bash
du -h test
```




[Tmux 使用教程 - 阮一峰的网络日志](https://www.ruanyifeng.com/blog/2019/10/tmux.html)

