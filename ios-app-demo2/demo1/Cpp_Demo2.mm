#import "Cpp_Demo2.h"

__attribute__((constructor)) void load_file() {
    printf("@@@@@@ Constructor is called ......");
}

__attribute__((constructor(101))) static   void before1(){
    printf("before1\n");
}

static __attribute__((constructor(102))) void before2(){
    printf("before2\n");
}

static __attribute__((constructor(102))) void before3(){
    printf("before3\n");
}

@implementation Cpp_Demo2

@end
