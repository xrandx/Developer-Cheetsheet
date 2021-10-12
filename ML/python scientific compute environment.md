下载 [Miniconda — Conda documentation](https://docs.conda.io/en/latest/miniconda.html)



设置国内镜像

设置搜索时显示通道地址

```bash
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes
```



anaconda 的配置文件 `Windows 下的 C:\Users\用户名\.condarc`：



```yaml
channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/win-64/
  - defaults
show_channel_urls: true
channel_alias: https://mirrors.tuna.tsinghua.edu.cn/anaconda
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
ssl_verify: true
```





```bash
#	创建 python 3.8.9 虚拟环境
conda create -n py38 python=3.8

#	删除
conda remove -n py38 --all

#	激活
conda activate py38

#	update
conda update --all


#	退出
conda deactivate

#	安装 requirements.txt
conda install --yes --file requirements.txt
```



安装科学计算几件套

```bash
conda install numpy pandas scipy scikit-learn matplotlib

conda install -c conda-forge jupyterlab
```



安装多标签学习库、arff读取

```bash
pip install scikit-multilearn
pip install liac-arff
pip install xgboost
```



为了和conda保持一致，选择还是清华的镜像源。步骤如下：

（1）修改 ~/.pip/pip.conf 文件。

```bash
vi ~/.pip/pip.conf
```



可以在 `pip.conf` 中直接添加 trusted-host:

```json
[global]
index-url = http://pypi.douban.com/simple
[install]
trusted-host = pypi.douban.com
```



打开终端时自动激活 conda 默认环境：

```bash
conda config --set auto_activate_base true
```



最近在创建新的 Python Virtualenv 时出现了 `Missing dependencies for SOCKS support` 的错误，经检查后发现为 Python 本身在没有安装 pysocks 时并不支持 socks5 代理，而环境变量中则设置了 socks5 的代理。

解决方法：

```bash
# unset all_proxy && unset ALL_PROXY ]
# 取消所有 socks 代理

conda install pysocks
```





### 防止Google Colab自动断开代码

每60分钟自动运行代码刷新，解除90分钟断开限制.

使用方法：colab页面按下 F12或者 Ctrl+Shift+I (mac按 Option+Command+I) 在console（控制台） 输入以下代码并回车.

复制以下代码粘贴在浏览器console！！不要关闭浏览器以免失效

```javascript
function ConnectButton(){  
    console.log("Connect pushed");   
    document.querySelector("#connect").click() 
}
setInterval(ConnectButton,60000);
```

