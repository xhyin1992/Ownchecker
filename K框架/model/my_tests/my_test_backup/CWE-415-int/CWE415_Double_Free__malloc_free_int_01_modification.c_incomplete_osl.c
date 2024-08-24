
fn printLine(line:#own()) -> #voidTy {
    line; 
    @{  
        line;   
    },{ 

    };
};

fn CWE415_Double_Free__malloc_free_int_01_bad() ->#voidTy {
    decl data;
    transfer #uninit data; 
    transfer newResource() data;      
    deallocate data;     
    deallocate data;      
};


fn goodG2B() -> #voidTy {
    decl data;
    transfer #uninit data; 
    transfer newResource() data;     

    deallocate data;      
};

fn goodB2G()-> #voidTy {
    decl data;
    transfer #uninit data; 
    transfer newResource() data;     
    deallocate data;      
};

fn CWE415_Double_Free__malloc_free_int_01_good() -> #voidTy {
    call goodG2B();
    call goodB2G();
};


fn main(argc:#own(copy), argv:#own()) -> #own(copy){

    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_int_01_good();
    call printLine(newResource(copy));
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_int_01_bad();
    call printLine(newResource(copy));
    val(newResource(copy))   
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
