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

//#include <stdio.h>
//#include <stdlib.h>

fn assign_value(data:#own()) -> #voidTy{
  transfer newResource(copy) *data;
};

fn Data_Race_18_bad() -> #voidTy{
    decl data1;
decl data2;

    decl share_var; transfer newResource(copy) share_var;
    
    data1 borrow share_var;
    data2 borrow share_var;
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    
    
    call assign_value(data1);
    
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    
    call Data_Race_18_bad();
    
    val(newResource(copy))    // return value
};
decl arg1;
decl argv1;
 
transfer newResource(copy) arg1;
transfer newResource() argv1;
 
call main(arg1, argv1);

