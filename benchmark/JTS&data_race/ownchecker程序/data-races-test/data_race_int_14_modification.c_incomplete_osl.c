/* 
Filename: Data_Race_14.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 14 Control flow: if(globalFive==5) and if(globalFive!=5)
 *
 * */

//#include <stdio.h>
//#include <stdlib.h>

decl globalFive; transfer newResource(copy) globalFive; 

fn Data_Race_14_bad() -> #voidTy{
    decl data1;
decl data2;

    decl share_var; transfer newResource(copy) share_var;
    globalFive; @{   //if statement
      data1 mborrow share_var;
      data2 borrow share_var;
    },{};
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    globalFive; @{   //if statement
        transfer newResource(copy) *data1;
    },{};
};

fn Data_Race_14_good() -> #voidTy{
    decl data1;
decl data2;

    decl share_var; transfer newResource(copy) share_var;
    globalFive; @{   //if statement
      data1 borrow share_var;
      data2 borrow share_var;
    },{};
    globalFive; @{   //if statement   
        /* the code below will never run*/
      
    }  , {  
      *data1;   //printf arguments
      *data2;   //printf arguments
    };
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    
    call Data_Race_14_good();
    
    
    call Data_Race_14_bad();
    
    val(newResource(copy))    // return value
};
decl arg1;
decl argv1;
 
transfer newResource(copy) arg1;
transfer newResource() argv1;
 
call main(arg1, argv1);

