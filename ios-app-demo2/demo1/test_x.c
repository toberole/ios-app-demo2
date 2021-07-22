#include "test_x.h"
#include <stdio.h>

__attribute__((constructor)) void test_xx() {
    printf("@@@@@@ test constructor ...... \n");
}

void test_xxx1(){
    printf("test_xxx1 ......\n");
}
