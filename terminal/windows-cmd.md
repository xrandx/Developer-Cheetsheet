```powershell
netstat -ano

netstat -aon|findstr "8000"


taskkill /T /F /PID 9088 

```




在自己编PowerShell脚本的时候突然遇到这个问题：

```powershell
nvs : 无法加载文件 C:\Users\Administrator\AppData\Local\nvs\nvs.ps1，因为在此系统上禁止运行脚本。有关详细信息，请参阅 h
ttps:/go.microsoft.com/fwlink/?LinkID=135170 中的 about_Execution_Policies。
所在位置 行:1 字符: 1
```

查了查之后发现是在计算机上启动 Windows PowerShell 时，执行策略很可能是 Restricted（默认设置）。

> Restricted 执行策略不允许任何脚本运行。 
>
> AllSigned 和 RemoteSigned 执行策略可防止 Windows PowerShell 运行没有数字签名的脚本。
>
> 本主题说明如何运行所选未签名脚本（即使在执行策略为 RemoteSigned 的情况下），还说明如何对 脚本进行签名以便您自己使用。
>
> 有关 Windows PowerShell 执行策略的详细信息，请参阅 about_Execution_Policy。

想了解 计算机上的现用执行策略，打开PowerShell 然后输入 

```powershell
get-executionpolicy
```

以管理员身份打开PowerShell 输入 

```powershell
set-executionpolicy remotesigned
```

选择 Y 然后电脑上就可以执行自己编写的脚本文件

