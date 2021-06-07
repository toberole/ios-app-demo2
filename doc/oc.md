消息转发三部曲
接下来的内容都和消息转发有关, 所以有必要先简单介绍一下OC的消息转发机制:

＋ (BOOL)resolveInstanceMethod:(SEL)sel

当向对象发送消息而对象没有对应的实现时, 消息会通过+(BOOL)resolveInstanceMethod:方法询问具体的接收类: 没有实现的话, 你能不能现在造一个实现出来?
通常现场造出消息实现都是走的class_addMethod添加对应的实现, 然后回答YES, 那么此次消息发送算是成功的, 否则进入下一步.

－ (id)forwardingTargetForSelector:(SEL)aSelector

上一步没有结果的话消息会进行二次询问: 造不出来没关系, 你告诉我谁有这个消息的对应实现? 我去它那找也行的.
此时如果返回一个能响应该消息的对象, 那么消息会转发到返回对象那里, 如果返回nil或者返回对象不能相应此消息, 进行最后一步.

－ (void)forwardInvocation:(NSInvocation *)anInvocation

到了这一步, 消息发送其实算是失败了, 不会再有询问过程, 而是直接将消息携带的一切信息包裹在NSInvocation中交给对象自己处理. 另外, forwardInvocation:在构造Invocation时会调用methodSignatureForSelector:获取方法签名, 所以一般情况下还需要实现这个方法返回相应的方法签名.
此时如果对象拿到invocation中的信息有能力发起[Invacation invoke], 那么消息对应的实现还是能正常进行, 只是相对于正常的发送过程稍微麻烦耗时些, 否则就会触发消息不识别的异常返回.


消息传递
1. 对象、类对象、元类对象

实例对象是objc_object数据结构；
类对象和元类对象，都是属于objc_class数据结构，而objc_class数据结构又是继承自objc_object数据结构。
实例对象可以通过isa指针找到它的类对象，类对象存储实例方法列表等信息；
类对象可以通过isa指针找到它的元类对象，元类对象存储类方法列表等信息；
根类对象的superClass指针指向nil；
所有元类对象的isa指针，都指向根元类对象，包括根元类自己；
根元类对象的superClass指针指向根类对象；

2. 实例方法的消息传递

当我们调用实例方法时，系统会先根据当前实例的isa指针找到它的类对象；
在类对象中先查找缓存，再遍历方法列表查找同名的方法实现；
如果没有查找到，则会按照类对象的superClass指向，依次遍历父类的方法列表，直到根类对象；
如果一直到根类对象也没有查找到该方法，则进入消息转发流程。

3. 类方法的消息传递

当我们调用类方法时，系统会通过类对象的isa指针找到它的元类对象；
在元类对象中先查找缓存，再遍历方法列表查找同名的方法实现；
如果没有查找到，则会按照元类对象的superClass指向，依次遍历父元类的方法列表，直到根元类对象；
如果一直到根元类对象也没有查找到该方法，因为根元类的superClass指向根类对象，则会在根类对象中找同名的实例方法实现；
如果根类对象中有同名的实例方法，则会执行该实例方法；
如果根类对象中没有同名的实例方法，则进入消息转发流程。

4. [self class]、[super class]

[self class] ==> objc_msgSend(self, @selector(class))
[super class] ==> objc_msgSendSuper(super, @selector(class))

虽然在调用super的方法时，runtime中传递的参数是super，但这里的super其实是一个objc_super类型的结构体，该结构体中包含了一个receiver对象，指的是当前对象，而不是其父类对象。所以[self class]和[super class]的返回都是当前对象的class，区别是super调用时，跳过了在当前类对象的方法列表遍历@selector(class)的过程，直接从父类的方法列表开始查。

作者：Hao_Orz
链接：https://juejin.cn/post/6969392279677042724
来源：掘金
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。










