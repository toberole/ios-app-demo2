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













