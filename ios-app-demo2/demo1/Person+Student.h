#import "Person.h"

NS_ASSUME_NONNULL_BEGIN
/**
 分类中只能添加“方法”，不能增加成员变量；
 分类中可以访问原来类中的成员变量，但是只能访问@protect和@public形式的成员变量。如果想要访问本类中的私有变量，分类和子类一样，只能通过方法来访问。 如果一定要在分类中添加成员变量，可以通过getter，setter手段进行添加。

 */

/**
 扩展
 扩展（extension）可以看作是分类的一个特例（匿名分类），定义在类文件中的没有名字的分类。
 1、和分类不同，类扩展即可以声明成员变量又可以声明方法；
 2、类扩展中添加的新方法，一定要实现，分类中则没有这种限制。
 */

/**
 分类无法添加属性
 
 
 不要用分类去重写已经存在的方法。
 
 通过使用分类添加的方法，不仅针对该类有效，对于其子类也有效，例如：给UIView添加了分类，UIImageView、UIButton等子类也可以使用。
 
 类＋分类名称必须唯一。
 */

@interface Person (Student)

// 注意：分类无法添加属性 在分类的方法中不能访问添加的属性
@property(nonatomic,assign)int score;



-(void)printStudentInfo;



@end

NS_ASSUME_NONNULL_END
