fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    },
	{
    };
};
fn printIntLine(intNumber:#own(copy)) -> #voidTy{
    intNumber;   //printf arguments
};
fn CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_15_bad() -> #voidTy{
    decl data;
    transfer newResource() data;      //malloc function
    @{
    ; 
	}
    ,{
        call printLine(newResource(copy));
	};
    @{
    {
        decl i;
        transfer newResource(copy) i;
i; !{   //for statement
            call printIntLine(data);
        i; 
		transfer newResource(copy) i;
       };
    }
	}
    ,{
     call printLine(newResource(copy));
	};
};
fn goodB2G1() -> #voidTy{
    decl data;
    transfer newResource() data;      //malloc function
    @{
     ; 
	}
    ,{
        call printLine(newResource(copy));
	};
    @{
        call printLine(newResource(copy));
	}
    ,{
    {
        decl i;
        transfer newResource(copy) i;
i; !{               
        transfer newResource(copy) data;     // array element assignment
        i; 
		transfer newResource(copy) i;
       };
    }
    {
        decl i;
        transfer newResource(copy) i;
i; !{   //for statement
            call printIntLine(data);
        i; 
		transfer newResource(copy) i;
       };
    }
	};
};
fn goodB2G2() -> #voidTy{
    decl data;
    transfer newResource() data;      //malloc function
    @{
     ; 
	}
    ,{
        call printLine(newResource(copy));
	};
    @{
    {
        decl i;
        transfer newResource(copy) i;
i; !{   //for statement
            transfer newResource(copy) data;     // array element assignment
        i; 
		transfer newResource(copy) i;
        };
    }
    {
        decl i;
        transfer newResource(copy) i;
i; !{   //for statement
            call printIntLine(data);
        i; 
		transfer newResource(copy) i;
        };
    }
	}
    ,{
        call printLine(newResource(copy));
	};
};
fn goodG2B1() -> #voidTy{
    decl data;
    transfer newResource() data;      //malloc function
    @{
        call printLine(newResource(copy));
	}
    ,{
    {
        decl i;
        transfer newResource(copy) i;
i; !{   //for statement
            transfer newResource(copy) data;     // array element assignment
        i; 
		transfer newResource(copy) i;
        };
    }
	};
    @{
    {
        decl i;
        transfer newResource(copy) i;
i; !{   //for statement
            call printIntLine(data);
        i; 
		transfer newResource(copy) i;
       };
    }
	}
    ,{
        call printLine(newResource(copy));
	};
};
fn goodG2B2() -> #voidTy{
    decl data;
    transfer newResource() data;      //malloc function
    @{
    {
        decl i;
        transfer newResource(copy) i;
i; !{   //for statement
            transfer newResource(copy) data;     // array element assignment
        i; 
		transfer newResource(copy) i;
       };
    }
	}
    ,{
        call printLine(newResource(copy));
	};
    @{
    {
        decl i;
        transfer newResource(copy) i;
i; !{   //for statement
            call printIntLine(data);
        i; 
		transfer newResource(copy) i;
       };
    }
	}
    ,{
        call printLine(newResource(copy));
	};
};
fn CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_15_good() -> #voidTy{
    call goodB2G1();
    call goodB2G2();
    call goodG2B1();
    call goodG2B2();
};
fn main(argc:#own(copy), argv:#own()) -> #own(copy){
        call printLine(newResource(copy));
    call CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_15_good();
    call printLine(newResource(copy));
    call printLine(newResource(copy));
    call CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_15_bad();
    call printLine(newResource(copy));
    val(newResource(copy))    // return value
};
decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1) ;