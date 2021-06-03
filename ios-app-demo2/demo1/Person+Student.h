#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

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
