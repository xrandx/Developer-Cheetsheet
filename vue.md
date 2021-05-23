```bash
vue init webpack chunk
```



安装 tailwindcss

```bash
npm install -D tailwindcss@npm:@tailwindcss/postcss7-compat @tailwindcss/postcss7-compat postcss@^7 autoprefixer@^9
```



vue 搭建脚手架的时候报以下错误：

`Error: spawn yarn ENOENT `

没有安装`yarn`

```bash 
npm install yarn -g
```



Vue 安装 Tailwindcss

[超简单！怎样在Vue2中使用TailWind Css - baby i tell you](http://www.babyitellyou.com/details?id=6072734f0a6c640f8b461939)



`Couldn't parse bundle asset "C:\Users\....js".
Analyzer will use module sizes from stats file.`

在我的 `C:\Users\用户文件夹` 下的 .vuerc 里

`"packageManager": "yarn"` 改成 `npm`，原因可能是安装 yarn 时文件被改了。

