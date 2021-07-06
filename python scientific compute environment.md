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
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
show_channel_urls: true
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
proxy_servers:
  http://127.0.0.1:1080
  https://127.0.0.1:1080
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
```



可以在 `pip.conf` 中直接添加 trusted-host:

```json
[global]
index-url = http://pypi.douban.com/simple
[install]
trusted-host = pypi.douban.com
```

