/* 
Filename: Data_Race_01.c
*/
/*
 * @description
 * Two variables borrow the same variable and at least one writing 
 * operation on variable through reference, that is one reference is mutable.
 * Flow Variant: 01 Baseline
 *
 * */



fn Data_Race_01_bad() -> #voidTy{
    decl data1;
decl data2;

    decl share_var; transfer newResource(copy) share_var;
    transfer #uninit data1;
    transfer #uninit data2;
    data1 mborrow share_var;
    data2 borrow share_var;
    /* POTENTIAL FLAW: potential data race will happen because 
     * both variables data1 and data2 borrow the variable share_var, 
     * but the variable data1 mutably borrows the variable share_var, 
     * since there is a writing operation through data1 with *data1 = 10; 
     */
    transfer newResource(copy) *data1;
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){

    
    call Data_Race_01_bad();
    
    val(newResource(copy))    // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
