/* 
Filename: Data_Race_18.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 02 Control flow: void pointer to data passed from one function to another in different source files
 *
 * */

#include <stdio.h>
#include <stdlib.h>

void assign_value(int *data)
{
  *data = 10;
}

void Data_Race_18_bad()
{
    int *data1, *data2;
    int share_var = 1;
    
    data1 = &share_var;
    data2 = &share_var;
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    
    
    assign_value(data1);
    
}

int main(int argc, char * argv[])
{
    printf("Calling bad()...");
    Data_Race_18_bad();
    printf("Finished bad()");
    return 0;
}

