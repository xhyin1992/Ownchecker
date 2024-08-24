/* 
Filename: Ownership_Constraints_02.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 02 Control flow: if(1) and if(0)
 *
 * */



fn Ownership_Constraints_02_bad() ->#voidTy{
    decl data1;
decl data2;

    decl share_var:#own(copy); transfer newResource(copy) share_var;
    transfer bot data1;
    transfer bot data2;
    @ {   //if statement
      data1 mborrow share_var;
      data2 borrow share_var;
    };
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    @ {   //if statement
        transfer newResource(copy) *data1;
    };
};

fn Ownership_Constraints_02_good() ->#voidTy{
    decl data3;
decl data4;

    decl share_var:#own(copy); transfer newResource(copy) share_var;
    transfer bot data3;
    transfer bot data4;
    @ {   //if statement
      data3 mborrow share_var;
      data4 borrow share_var;
    };
    @ {   //if statement   /* the code below will never run*/
        transfer newResource(copy) *data3;
    };
    *data3;   //printf arguments
    *data4;   //printf arguments
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    
    call Ownership_Constraints_02_good();
    
    
    call Ownership_Constraints_02_bad();
    
    val(newResource(copy))    // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;