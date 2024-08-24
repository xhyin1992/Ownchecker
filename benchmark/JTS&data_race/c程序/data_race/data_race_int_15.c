/* 
Filename: Data_Race_15.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 02 Control flow: switch(6) and switch(7)
 *
 * */

#include <stdio.h>
#include <stdlib.h>

void Data_Race_15_bad()
{
    int *data1, *data2;
    int share_var = 1;
    switch(6)
    {
      case 6:
         data1 = &share_var;
         data2 = &share_var;
         break;
       
       default:
          break;
       
    }
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    switch(7)
    {
      case 7:
        *data1 = 10;
        break;
      
      default:
        break;
      
    }
}

void Data_Race_15_good()
{
    int *data1, *data2;
    int share_var = 1;
    switch(6)
    {
      case 6:
         data1 = &share_var;
         data2 = &share_var;
         break;
       
       default:
          break;
       
    }

    switch(8)
    {
      case 7:
         break;
       
       default:
        printf("%d\n", *data1);
        printf("%d\n", *data2);
        break;
       
    }
}

int main(int argc, char * argv[])
{
    printf("Calling good()...");
    Data_Race_15_good();
    printf("Finished good()");
    printf("Calling bad()...");
    Data_Race_15_bad();
    printf("Finished bad()");
    return 0;
}

