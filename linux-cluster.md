# 学院集群自制指南

尽管学院集群有官方的文档：[指南](http://10.8.51.23/help/), 但由于官方文档的不完善，以及学院集群的特殊性，我们还是需要自己制作一份指南。以下教程将假设你还不熟悉Linux系统，但已经有一定的计算机基础。

## 快速入门

以下步骤将假设你有一台Windows设备，已经安装了XShell和XFTP，已经获得了学院集群的账号，并在校园网环境下。你将配置好从本地到集群的登录，并在集群上运行一个使用GPU的测试程序。

如果你还没有XShell和XFTP，可以在[这里](https://www.xshell.com/zh/free-for-home-school/)下载。如果你还没有集群的账号，请在校园网环境下浏览器访问[这里](http://10.8.51.23)，使用校内邮箱来注册。

如果你的校园网流量已用完，不必紧张，校园网的流量限制仅针对访问校园以外的网络，集群属于校园内网，不计入流量限制。如果你确实在访问集群上遇到了网络问题，可以与本文档撰写者[联系](mailto:xiaochenzhang@snnu.edu.cn)。

### 登录集群

* 打开浏览器，输入[集群网页链接](http://10.8.51.23/home)，登录你的集群账号后，你应当会看到这样的界面： ![img](https://i.pstorage.space/i/27Wlj4ooA/original_login.png)

* 其中public_cluster为公共集群，是我们连接的目的地。点击红圈部分，你将看到这样的界面：

![img](https://i.pstorage.space/i/PAYRzJzvm/original_vnc-1.png)
* 此时，你已经在浏览器中“登录”到了公共集群。尽管你此时已经可以运行一些基本的操作，但这种方式下的体验并不好。请不要关闭浏览器页面，我们将在下面介绍如何使用XShell登录集群。

非浏览器内登录集群，需要使用密钥登录。接下来我们将配置借助Xshell，使用密钥登录集群。

* 打开Windows上的XShell，点击工具栏中的“新建用户密钥生成向导”
![img](https://i.pstorage.space/i/0by6dPLd8/original_xshell-genkey1.png)

* 你会看到如下的界面，直接点击“下一步”
![img](https://i.pstorage.space/i/m1QNkqKe7/original_xshell-genkey2.png)

* 看到如下界面后继续点击“下一步”
![img](https://i.pstorage.space/i/NZYakWW5w/original_xshell-genkey3.png)

* 看到如下界面后不需要任何额外的操作，直接点击“下一步”
![img](https://i.pstorage.space/i/1aLKzwxW6/original_xshell-genkey4.png)

* 你可能会遇到这样的提示，不用理会，直接“是”就好
![img](https://i.pstorage.space/i/jM2Ng1L6q/original_xshell-genkey5.png)

* 之后你应当看到类似如下的界面，此时请将红框内的部分全部复制（**强烈建议将复制好的内容粘贴到一个新的记事本中以防丢失**），再选择“完成”
![img](https://i.pstorage.space/i/8yRxLaRVO/original_xshell-genkey6.png)

* 看到如下界面后，就可以点击“关闭”了。
![img](https://i.pstorage.space/i/ab0NxOlwe/original_xshell-genkey7.png)

* 接下来，返回浏览器中集群的界面。你应当看到这样的界面。如果不是，请返回先前的浏览器登录部分，重新操作直至出现该界面：
![img](https://i.pstorage.space/i/PAYRzJzvm/original_vnc-1.png)

* 在这个黑框中，输入如下命令并回车：

```bash
echo "ssh-rsa AAA..." >> ~/.ssh/authorized_keys
```
请注意，其中`ssh-rsa AAA...`部分应该替换为你刚刚复制的内容。建议使用鼠标右键粘贴或“CTRL+SHIFT+V”粘贴。你粘贴出的内容开头应当为`ssh-rsa AAA`，如果不是，说明你并未正确复制密钥。请返回前面的步骤重新生成密钥并**完全**复制。
你应当看到类似这样的界面：
![img](https://i.pstorage.space/i/KQ76kQDq8/original_xshell-plaste-key.png)
`"ssh-rsa"`中的内容每个人都不一样，所以如果你和我的看起来不一样也不必担心。

* 此时我们已经成功配置了密钥。接下来我们将在本地配置XShell。首先选择新建：
![img](https://i.pstorage.space/i/knZLNOLJ/original_new-session.png)

* 你会看到这样的界面。不用为了看起来很多的选项头大，我们只需要配置这两个选项：
![img](https://i.pstorage.space/i/WNZV6OdK8/original_new-session2.png)
主机选项，请填写`10.8.51.23`
端口号，请填写`20019`，如下图所示：
![img](https://i.pstorage.space/i/1aLKvDAYP/original_new-session3.png)

* 填写完成后点击确定。你应当看到如下的界面，其中的“新建会话”就是我们新配置的集群连接：
![img](https://i.pstorage.space/i/6DQX8lPy/original_new-session4.png)

* 双击红圈中的部分。也许你会看到这样的界面，直接选择“接受并保存”即可。如果没有出现这个界面也无需担心，直接看下一步的操作即可。
![img](https://i.pstorage.space/i/X9NDK0yj6/original_new-session5.png)

* 你应当看到这样的界面。请按指示输入你注册集群时的用户名。
![img](https://i.pstorage.space/i/m1QNzZkbY/original_new-session6.png)

* 你应当看到这样的界面。
![img](https://i.pstorage.space/i/npvN39dO6/original_new-session7.png)

* 请选择第二位的“Public Key”，随后直接点击确定。
![img](https://i.pstorage.space/i/ab0NwPQR8/original_new-session8.png)

* 此时你应当看到这样的界面。这表示你成功登录到了集群，也表示你成功配置了密钥登录。之后登录时，只需要打开Xshell，双击“新建会话”，输入用户名，选择密钥登陆即可。
![img](https://i.pstorage.space/i/jM2N9W5vw/original_new-session9.png)

### 配置 conda 环境

* 安装conda
直接跟随[官方指南](https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html)的指导安装即可，建议选择miniconda安装
#### 换源
不换源的话安装软件包会从conda/pypi官方站点安装，由于是国外站点因此速度和稳定性都很差，建议换源为国内的清华源和中科大源

* conda换源

请直接跟随清华源官方教程进行换源，[清华源官方教程](https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/)

* pip换源

请直接跟随清华源官方教程进行换源，[清华源官方教程](https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/)

### 运行一个使用GPU的测试程序
我们运行一个使用GPU的测试程序，以验证我们的配置是否成功。请在Xshell中输入如下命令并回车：

```bash
salloc -p gpu-rtx3080ti -N 1 -n 2 --gres=gpu:1 -t 1:00:00 # 申请一个GPU资源
ssh gpu1 # 进入申请到的GPU资源，可能需要输入集群账号密码
conda create -n test python=3.8 -y # 创建一个名为test的conda环境
conda activate test # 激活test环境
pip install torch torchvision torchaudio # 安装pytorch
python -c "import torch; print(torch.cuda.is_available())" # 运行一个使用GPU的测试程序，你应当看到终端输出了"True"，这表示我们成功使用了GPU运行了测试程序
# True
```

### 虚拟机模式

~~介绍如何使用虚拟机跑程序和它的限制~~

### cluster 模式快速上手

~~介绍如何使用cluster模式跑程序~~

### 可能遇到的小坑

~~集群微信群，端口转发，3090不兼容，如何使用VSCode等坑~~

## 传输文件

~~如何使用XFTP传文件~~

## Linux 常用操作

* cp cd ls 等常见命令
* pytorch常见操作
* nvidia-smi
* nohup 
* vim，nano
* proxy
* 


