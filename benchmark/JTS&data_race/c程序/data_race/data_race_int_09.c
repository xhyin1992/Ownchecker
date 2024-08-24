/* 
Filename: Data_Race_09.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 02 Control flow: if(GLOBAL_CONST_TRUE) and if(GLOBAL_CONST_FALSE)
 *
 * */

#include <stdio.h>
#include <stdlib.h>

const int GLOBAL_CONST_TRUE = 1; /* true */
const int GLOBAL_CONST_FALSE = 0; /* false */

void Data_Race_09_bad()
{
    int *data1, *data2;
    int share_var = 1;
    if(GLOBAL_CONST_TRUE)
    {
      data1 = &share_var;
      data2 = &share_var;
    }
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    if(GLOBAL_CONST_TRUE){
        *data1 = 10;
    }
}

void Data_Race_09_good()
{
    int *data1, *data2;
    int share_var = 1;
    if(GLOBAL_CONST_TRUE)
    {
      data1 = &share_var;
      data2 = &share_var;
    }
    if(GLOBAL_CONST_FALSE){   /* the code below will never run*/
        ;
    }
    else{
      printf("%d\n", *data1);
      printf("%d\n", *data2);
    }
}

int main(int argc, char * argv[])
{
    printf("Calling good()...");
    Data_Race_09_good();
    printf("Finished good()");
    printf("Calling bad()...");
    Data_Race_09_bad();
    printf("Finished bad()");
    return 0;
}

