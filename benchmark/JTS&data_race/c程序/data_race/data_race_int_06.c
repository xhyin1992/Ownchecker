/* 
Filename: Data_Race_06.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 02 Control flow: if(STATIC_CONST_FIVE==5) and if(STATIC_CONST_FIVE!=5)
 *
 * */

#include <stdio.h>
#include <stdlib.h>

/* The variable below is declared "const", so a tool should be able
   to identify that reads of this will always give its initialized
   value. */
static const int STATIC_CONST_FIVE = 5;

void Data_Race_06_bad()
{
    int *data1, *data2;
    int share_var = 1;
    if(STATIC_CONST_FIVE == 5)
    {
      data1 = &share_var;
      data2 = &share_var;
    }
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    if(STATIC_CONST_FIVE == 5){
        *data1 = 10;
    }
}

void Data_Race_06_good()
{
    int *data1, *data2;
    int share_var = 1;
    if(STATIC_CONST_FIVE == 5)
    {
      data1 = &share_var;
      data2 = &share_var;
    }
    if(STATIC_CONST_FIVE != 5){   /* the code below will never run*/
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
    Data_Race_06_good();
    printf("Finished good()");
    printf("Calling bad()...");
    Data_Race_06_bad();
    printf("Finished bad()");
    return 0;
}

