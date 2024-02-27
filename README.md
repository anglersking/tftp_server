# tftp_server
本地测试是否安装成功
进入到服务器工作目录
$ cd /tftpboot/
创建一个文件
$ sudo touch test.txt
回到家目录
$ cd
使用 tftp 命令登录本机
$ tftp localhost
获取文件
$ get test.txt
退出
$ q
执行如下命令查看是否获取到
$ ls
当前目录下获取到了 test.txt 文件表示安装成