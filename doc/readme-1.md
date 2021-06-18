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

IOS瘦身之armv7 armv7s arm64选用
xcode创建工程默认支持的指令集有下列三种
>armv7
  iPhone4
  iPhone4S
>armv7s
  iPhone5
  iPhone5C
>arm64
  iPhone5S(以上)

如果全部支持切不在乎包大小的话,Architecture的值选择：armv7 armv7s arm64

如果支持5以上切包不要求则选用 armv7s ,arm64

如果支持全机型,有不想ipa包太多就选择 armv7 , arm64

如果最小ipa的话,且抛弃5s以下,可以采用只用arm64

PS:选arm64时需要最低支持5.1.1:

1，如果想自己的app在各个机器都能够最高效率的运行，则需要将Build Active Architecture Only改为NO,Valid architectures选择对应的指令集：armv7 armv7s arm64。这个会为各个指令集编译对应的代码，因此最后的 ipa体积基本翻了3倍,Release版本必须NO。

2，如果想让app体积保持最小，则现阶段应该选择Valid architectures为armv64,这样Build Active Architecture Only选YES或NO就无所谓了


iOS项目中引用多个第三方库引发冲突的解决方法：
1、mkdir armv7：创建临时文件夹
2、lipo libALMovie.a -thin armv7 -output armv7/armv7.a：取出armv7平台的包
3、ar -t armv7/armv7.a：查看库中所包含的文件列表
4、cd armv7 && ar xv armv7.a：解压出object file（即.o后缀文件）
5、rm ALButton.o：找到冲突的包，删除掉（此步可以多次操作）
6、cd … && ar rcs armv7.a armv7/*.o：重新打包object file
多平台的SDK的话，需要多次操作第4步。操作完成后，合并多个平台的文件为一个.a文件：lipo -create armv7.a arm64.a -output new.a
将修改好的文件， 拖拽到原文件夹下，替换原文件即可。







