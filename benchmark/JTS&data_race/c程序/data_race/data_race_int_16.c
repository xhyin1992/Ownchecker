/* 
Filename: Data_Race_16.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 02 Control flow: while(1)
 *
 * */

#include <stdio.h>
#include <stdlib.h>

void Data_Race_16_bad()
{
    int *data1, *data2;
    int share_var = 1;
    while(1)
    {
      data1 = &share_var;
      data2 = &share_var;
      break;
    }
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    while(1)
    {
        *data1 = 10;
        break;
    }
}

void Data_Race_16_good()
{
    int *data1, *data2;
    int share_var = 1;
    while(1)
    {
      data1 = &share_var;
      data2 = &share_var;
      break;
    }
    while(1)
    {  
      printf("%d\n", *data1);
      printf("%d\n", *data2);
      break;
    }
}

int main(int argc, char * argv[])
{
    printf("Calling good()...");
    Data_Race_16_good();
    printf("Finished good()");
    printf("Calling bad()...");
    Data_Race_16_bad();
    printf("Finished bad()");
    return 0;
}

