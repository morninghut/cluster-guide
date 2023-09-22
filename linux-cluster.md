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
python -c "import torch; print(torch.cuda.is_available())" # 运行一个使用GPU的测试程序
# 你应当看到终端输出了"True"，这表示我们成功使用了GPU运行了测试程序
# True
```

## 虚拟机模式

事实上，集群有两种模式：虚拟机模式和slurm作业调度系统模式。虚拟机模式更为直接，但可能需要等待资源分配（资源紧张时需要等待数天），同时三天后虚拟机就会被收回（意味着上面的程序最多跑三天）；slurm可以使用更长时间，资源分配较快，缺点是操作繁琐，需要学习slurm的使用方法。我们将先介绍虚拟机模式，再介绍slurm模式。

* 打开[集群网页](http://10.8.51.23)，在页面顶端点击“申请资源”来创建我们的虚拟机：
![img](https://i.pstorage.space/i/ODgne4jqD/original_vir1.png)

* 你应当看到这样的界面。该界面展示了可以选择的虚拟机种类。在这些种类中推荐的是“JupyterLab”和“Pytorch”这两个。他们是一个基于浏览器的交互式编程环境，我们不妨选择JupyterLab。请点击该卡片右下的“创建实例”。
![img](https://i.pstorage.space/i/61a3NXYgX/original_vir2.png)

* 你应当看到这样的界面。我们需要做的是给虚拟机起一个名字，并指定CPU核心数和内存大小。这里我们将虚拟机命名为“test”，CPU核心数为“4核”，内存大小为“8G”。随后选择“确定”
![img](https://i.pstorage.space/i/oy1VZgXXX/original_vir3.png)

* 在看到这样的界面后表明我们成功创建了自己的虚拟机。下面让我们启动它，点击红框部分以启动虚拟机：
![img](https://i.pstorage.space/i/xl5dZq8N3/original_vir4.png)

* 在点击后可能幼等待几秒到几十秒不等。当下图中红框中的图标由灰色改为亮起时代表虚拟机启动就绪。请点击红框部分来打开jupyter用户界面。
![img](https://i.pstorage.space/i/Q9YnLO1w6/original_vir6.png)

* 稍等几秒后你应当看到这样的界面：
![img](https://i.pstorage.space/i/npv8ZRzNN/original_vir7.png)
或许你和我的界面不完全一样，这是正常的。点击红框中的部分以新建一个jupyter notebook。

* 进入后可以创建cell以运行命令和代码：
![img](https://i.pstorage.space/i/8Y8mYMby/original_vir8.png)
鉴于本教程的主题是学院集群，就不再继续说明jupyter notebook的部分，请善用搜索引擎学习相关知识:)

## cluster 模式快速上手

以上介绍了虚拟机模式运行程序。或许看起来一切都很美好，但由于大家都觉得这种模式很不错，都在用这种模式，导致对应的GPU资源在高峰时期严重不足。往往在申请资源后需要排队等待几天甚至一周。这是不可接受的。因此我们需要学习slurm模式。这是一种基于作业的调度系统，可以让我们更好地使用集群资源。

提前说明，该模式对新手不太友好，需要一定的学习成本。请不要害怕。一旦学会，你将会发现它的强大之处。尤其是它可以保证即使在资源使用高峰期依旧能尽快运行实验程序。

* 首先请使用XShell登录集群。如果有问题，请参考前面的教程。

* 在正式进入slurm模式之前，我们先来了解一些该模式的概况。slurm模式下，资源（如GPU）会被分配到若干“节点”上。每个节点会包含几张乃至几十张显卡。我们想要使用显卡资源，需要向系统提出请求，指明我们要执行的程序，要使用哪个节点的显卡几张等等信息。集群管理系统会处理我们的请求，并将我们的程序分配到某个节点上的某张显卡上运行。这个过程是自动的，我们只需要向系统提出请求即可。这个请求的形式就是“作业”。

### sinfo

* 我们先来看看集群中有哪些节点。在XShell中输入如下命令并回车：

```bash
sinfo
```

你应当看到类似这样的输出：
```bash
(base) [zhangxiaochen@workstation ~]$ sinfo
PARTITION     AVAIL  TIMELIMIT  NODES  STATE NODELIST
cpu*             up 30-00:00:0      1   idle cpu1
gpu-rtx3080ti    up 30-00:00:0      3    mix gpu[1-3]
gpu-rtx3080ti    up 30-00:00:0      4  alloc gpu[6-7,9-10]
gpu-rtx3090      up 30-00:00:0      3    mix gpu[4-5,8]
```
看起来有好多不认识的英文名词是吧？不要怕，一步一步来。

首先，sinfo是查看节点状态的命令，使用它我们可以查看都有哪些节点？节点是否繁忙？节点是否有显卡等等信息。

我们可以看到第一列“PARTITION”，表示集群中有四个节点，分别是cpu、gpu-rtx3080ti、gpu-rtx3080ti、和gpu-rtx3090。

第二列、第三列和第四列可以不管，第五列的STATE中，我们可以看到有“idle”“mix”等状态。他们的含义是：drain: 排空状态，表示该类节点不再分配到其他；idle: 空闲状态；alloc: 被分配状态; mix:部分被占用，但是仍有可用资源； down停机。
可以发现，cpu、3080ti、3090都有空闲的节点，我们可以向这些节点申请资源。

### squeue

* 只是知道节点情况还不够，我们还想知道当前有哪些作业在运行。在XShell中输入如下命令并回车：

```bash
squeue
```

你应当看到类似这样的输出：
```bash
(base) [zhangxiaochen@workstation ~]$ squeue
JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
 7724 gpu-rtx30     bash jiaminli  R 5-03:46:33      1 gpu4
 7745 gpu-rtx30     bash zhangwei  R 4-23:04:57      1 gpu1
 7777 gpu-rtx30      6_1 lyy_snnu  R 4-10:51:52      1 gpu3
```
可以看到，有三个作业在运行，分别是“bash”“bash”和“6_1”。他们是我们的同学在运行的作业。我们可以看到他们的状态都是“R”，表示正在运行。我们可以看到他们的运行时间，以及他们运行在哪个节点上。

### sbatch

* 我们现在来运行一个作业。首先让我们准备一个测试脚本。在XShell中输入如下命令并回车：

```bash
# echo为输出命令，>为重定向
# 将echo的输出重定向到test.py文件中，我们就得到了一个内容为print("test slurm")的test.py文件
echo 'print("test slurm")'>test.py
```
我们想要把它提交给slurm管理平台，让它运行。那么我们该如何与这个平台沟通呢？答案是使用提交脚本。提交脚本是一个文本文件，其中包含了我们的作业信息，如我们要运行的程序，要使用的节点，要使用的显卡等等。本项目中包含了一个提交脚本模板job.sh。它的内容是这样的：

```bash
#!/bin/bash
#SBATCH -o job.%j.out
#SBATCH --partition=gpu-rtx3080ti
#SBATCH --qos=normal
#SBATCH -J NO-N
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-core=1
#SBATCH --gpus=1
python test.py
sleep 15 # 15秒后自动退出
```
不需要害怕这么多不认识的东西。我们只需要在这些“#SBATCHxxx”之后填写我们要执行的操作即可。在这里，我们要运行一个python脚本test.py。

我们已经有了提交脚本，接下来我们需要将它提交给slurm管理平台。在XShell中输入如下命令并回车：

```bash
sbatch job.sh
```
你应当看到类似这样的输出：
```bash
(base) [zhangxiaochen@workstation ~]$ sbatch job.sh
Submitted batch job 7780
```
这表示我们成功提交了一个作业。它的ID是7780。我们可以使用squeue命令查看作业的运行情况。在XShell中输入如下命令并回车：

```bash
squeue
```
你应当看到类似这样的输出：
```bash
(base) [zhangxiaochen@workstation ~]$ squeue
JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
 7724 gpu-rtx30     bash jiaminli  R 5-03:46:33      1 gpu4
 7745 gpu-rtx30     bash zhangwei  R 4-23:04:57      1 gpu1
 7777 gpu-rtx30      6_1 lyy_snnu  R 4-10:51:52      1 gpu3
 7780 gpu-rtx30     NO-N zhangxia  R       0:01      1 gpu1
```

我们可以看到，我们的作业7780已经在运行了。在你的操作中，或许你并没有看到队列中有刚刚提交的作业。这是因为我们的程序执行太快，还没来得及查看就已经运行完毕了。

### 作业输出

好像有哪里不对？我们的作业已经运行完毕了，但我们并没有看到任何输出。这是因为我们的作业的输出被重定向到了job.7780.out文件中。我们可以使用cat命令查看这个文件。在XShell中输入如下命令并回车：

```bash
cat job.7780.out
```
你应当看到类似这样的输出：
```bash
(base) [zhangxiaochen@workstation ~]$ cat job.7780.out
test slurm
```
这就是我们的程序的输出。我们的程序成功运行了。

以上就是slurm模式的基本使用方法。我们可以使用squeue查看作业的运行情况，使用sbatch提交作业，使用cat查看作业的输出。

事实上slurm的配置非常丰富，进一步了解可以查看学院集群的文档，遇到文档中没有说到的部分，可以去[上海交大HPC文档](https://docs.hpc.sjtu.edu.cn/job/slurm.html)，[北大HPC文档](https://hpc.pku.edu.cn/_book/)和[中科大HPC文档](http://hmli.ustc.edu.cn/doc/userguide/slurm-userguide.pdf)查找答案。搜索能力也是很重要的能力:)

## 可能遇到的小坑

* 反馈与联系
集群的反馈渠道是微信群。出于敏感考虑，不在这里提供二维码。如有需要，请联系你的老师或已入群的同学。需要注意的是入群后尽快实名，否则会被踢出群。

* 3090不兼容
尽管3090的性能好于3080，但有时会在配置环境上遇到兼容性问题。如果你的程序在3090上运行不正常，可以尝试在3080上运行。个人经验是3080会很好地降低你配置环境时的血压:)

* 端口转发
有时我们需要在集群上运行一个服务器，但我们又想在本地访问这个服务器。这时我们可以使用端口转发。这部分的内容请参考集群官方文档。
但实际上的转发体验并不好，经常会出现各种奇怪的连接问题。建议对这种程序做修改，使其不需要转发端口。

* 使用VSCode连接集群
这部分其实也没啥好说的，就是在本地安装VSCode，安装Remote-SSH插件，然后连接集群。如果需要详细的教程，请自行搜索:)


## 传输文件

~~如何使用XFTP传文件~~

## Linux 常用操作

* cp cd ls 等常见命令
* pytorch常见操作
* nvidia-smi
* nohup 
* vim，nano
* proxy
* ...


