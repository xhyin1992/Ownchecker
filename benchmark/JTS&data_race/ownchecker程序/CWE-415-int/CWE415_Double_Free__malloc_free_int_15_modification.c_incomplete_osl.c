fn printLine(line:#own()) -> #voidTy {
    line; @{   //if statement
        line;   //printf arguments
    },{
    };
};
fn CWE415_Double_Free__malloc_free_int_15_bad()-> #voidTy{
    decl data;
    transfer #uninit data;
    @ {
        transfer newResource() data;      //malloc function
        deallocate data;      // free function   
	}
    ,{
        call printLine(newResource(copy));  
	};
    @ {
        deallocate data;      // free function  
	}
    ,{
        call printLine(newResource(copy));     
	};
};
fn goodB2G1()-> #voidTy{
    decl data;
    transfer #uninit data;
    @ {
        transfer newResource() data;      //malloc function
        deallocate data;      // free function    
	}
    ,{
        call printLine(newResource(copy));
	};
    @ {
        call printLine(newResource(copy));   
	}
    ,{
	};  
};
fn goodB2G2()-> #voidTy{
    decl data;
    transfer #uninit data;
    @ {
        transfer newResource() data;      //malloc function
        deallocate data;      // free function  
	}
    ,{
        call printLine(newResource(copy));
	};
    @ {
	}
    ,{
        call printLine(newResource(copy)); 
	};   
};
fn goodG2B1()-> #voidTy{
    decl data;
    transfer #uninit data;
    @ {
        call printLine(newResource(copy));
	}
    ,{
        transfer newResource() data;      //malloc function   
	};
    @ {
        deallocate data;      // free function 
	}
    ,{
        call printLine(newResource(copy));  
	};   
};
fn goodG2B2()-> #voidTy{
    decl data;
    transfer #uninit data; 
    @ {
        transfer newResource() data;      //malloc function   
	}
    ,{
        call printLine(newResource(copy));
	};
    @ {
        deallocate data;      // free function  
	}
    ,{
        call printLine(newResource(copy)); 
	}; 
};
fn CWE415_Double_Free__malloc_free_int_15_good()-> #voidTy{
    call goodB2G1();
    call goodB2G2();
    call goodG2B1();
    call goodG2B2();
};
fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_int_15_good();
    call printLine(newResource(copy));
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_int_15_bad();
    call printLine(newResource(copy));
    val(newResource(copy))    // return value
};
decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1) ;

