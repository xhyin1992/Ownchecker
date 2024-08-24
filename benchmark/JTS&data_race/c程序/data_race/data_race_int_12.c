/* 
Filename: Data_Race_12.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 02 Control flow: if(globalReturnsTrueOrFalse())
 *
 * */

#include <stdio.h>
#include <stdlib.h>

int globalReturnsTrueOrFalse() 
{
    int a = rand();
    int b = a % 2;
    return b;
}

void Data_Race_12_bad()
{
    int *data1, *data2;
    int share_var = 1;
    if(globalReturnsTrueOrFalse())
    {
      data1 = &share_var;
      data2 = &share_var;
    }
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    if(globalReturnsTrueOrFalse()){
        *data1 = 10;
    }
}

void Data_Race_12_good()
{
    int *data1, *data2;
    int share_var = 1;
    if(globalReturnsTrueOrFalse())
    {
      data1 = &share_var;
      data2 = &share_var;
    }
    if(globalReturnsTrueOrFalse()){   
        ;
    } else{ 
        printf("%d\n", *data1);
        printf("%d\n", *data2);
    }
}

int main(int argc, char * argv[])
{
    printf("Calling good()...");
    Data_Race_12_good();
    printf("Finished good()");
    printf("Calling bad()...");
    Data_Race_12_bad();
    printf("Finished bad()");
    return 0;
}

