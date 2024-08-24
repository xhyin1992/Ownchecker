/* 
Filename: Data_Race_08.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 02 Control flow: if(staticReturnsTrue()) and if(staticReturnsFalse())
 *
 * */

#include <stdio.h>
#include <stdlib.h>

/* The two function below always return the same value, so a tool
   should be able to identify that calls to the functions will always
   return a fixed value. */
static int staticReturnsTrue()
{
    return 1;
}

static int staticReturnsFalse()
{
    return 0;
}

void Data_Race_08_bad()
{
    int *data1, *data2;
    int share_var = 1;
    if(staticReturnsTrue())
    {
      data1 = &share_var;
      data2 = &share_var;
    }
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    if(staticReturnsTrue()){
        *data1 = 10;
    }
}

void Data_Race_08_good()
{
    int *data1, *data2;
    int share_var = 1;
    if(staticReturnsTrue())
    {
      data1 = &share_var;
      data2 = &share_var;
    }
    if(staticReturnsFalse()){   /* the code below will never run*/
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
    Data_Race_08_good();
    printf("Finished good()");
    printf("Calling bad()...");
    Data_Race_08_bad();
    printf("Finished bad()");
    return 0;
}

