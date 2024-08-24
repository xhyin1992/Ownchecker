/* 
Filename: Ownership_Constraints_06.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 02 Control flow: if(STATIC_CONST_FIVE==5) and if(STATIC_CONST_FIVE!=5)
 *
 * */



/* The variable below is declared "const", so a tool should be able
   to identify that reads of this will always give its initialized
   value. */
decl STATIC_CONST_FIVE:#own(copy); transfer newResource(copy) STATIC_CONST_FIVE;

fn Ownership_Constraints_06_bad() ->#voidTy{
    decl data1;
decl data2;

    decl share_var:#own(copy); transfer newResource(copy) share_var;
    transfer bot data1;
    transfer bot data2;
    STATIC_CONST_FIVE; @{   //if statement
      data1 mborrow share_var;
      data2 borrow share_var;
    };
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    STATIC_CONST_FIVE; @{   //if statement
        transfer newResource(copy) *data1;
    };
};

fn Ownership_Constraints_06_good() ->#voidTy{
    decl data3;
decl data4;

    decl share_var:#own(copy); transfer newResource(copy) share_var;
    transfer bot data3;
    transfer bot data4;
    STATIC_CONST_FIVE; @{   //if statement
      data3 mborrow share_var;
      data4 borrow share_var;
    };
    STATIC_CONST_FIVE; @{   //if statement   /* the code below will never run*/
        transfer newResource(copy) *data3;
    }
     , {
      *data3;   //printf arguments
      *data4;   //printf arguments
    };
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    
    call Ownership_Constraints_06_good();
    
    
    call Ownership_Constraints_06_bad();
    
    val(newResource(copy))    // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;