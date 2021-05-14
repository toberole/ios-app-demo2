重启USB
    sudo killall -STOP -c usbd

LLDB命令
bt 10，堆栈打印 thread backtrace 10层堆栈信息

thread return 跳出当前方法的执行
//跳出方法
(lldb) thread return
//让带有返回int值的方法直接跳出，并返回值10
(lldb) thread return 10

image lookup -address 查找崩溃位置
image lookup -a 0x00000001009a9f3a

image lookup -name 查找方法来源

image lookup –type 查看成员
