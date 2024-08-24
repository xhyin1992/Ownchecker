fn printLine(line:#own()) -> #voidTy {
    line; 
	@{           
	line;       
	},
	{
    };
};
fn printStructLine(structTwoIntsStruct:#own()) -> #voidTy{
    structTwoIntsStruct;
	structTwoIntsStruct;   
	};
fn CWE416_Use_After_Free__malloc_free_struct_15_bad() -> #voidTy{
    decl data;
    transfer #uninit data;
    @{
           transfer newResource() data;              {
            decl i;
            transfer newResource(copy) i;
i; !{                   
transfer newResource() date;
                transfer newResource() date;
            i; 
			transfer newResource(copy) i;
            			};
        }
        deallocate data;              
    }
    ,{
        call printLine(newResource(copy));
    };
    @{
        call printStructLine(data);
    }
    ,{
        call printLine(newResource(copy));
    };
};
fn goodB2G1() -> #voidTy{
    decl data;
    transfer #uninit data;
    @{
           transfer newResource() data;              {
            decl i;
            transfer newResource(copy) i;
i; !{                   
transfer newResource() date;
                transfer newResource() date;
            i; 
			transfer newResource(copy) i;
                    }
        deallocate data;              
    }
    ,{
        call printLine(newResource(copy));
    };
    @{
        call printLine(newResource(copy));
    }
    ,{
    };
};
fn goodB2G2() -> #voidTy{
    decl data;
    transfer #uninit data;
    @{
           transfer newResource() data;              {
            decl i;
            transfer newResource(copy) i;
i; !{                   
transfer newResource() date;
                transfer newResource() date;
            i; 
			transfer newResource(copy) i;
                    }
        deallocate data;              
    }
    ,{
        call printLine(newResource(copy));
    };
    @{
    }
    ,{
        call printLine(newResource(copy));
    };
};
fn goodG2B1() -> #voidTy{
    decl data;
    transfer #uninit data;
    @{
        call printLine(newResource(copy));
    }
    ,{
        transfer newResource() data;              {
            decl i;
            transfer newResource(copy) i;
i; !{                   
transfer newResource() date;
                transfer newResource() date;
            i; 
			transfer newResource(copy) i;
                    }
    };
    @{
        call printStructLine(data);
    }
    ,{
        call printLine(newResource(copy));
    };
};
fn goodG2B2() -> #voidTy{
    decl data;
    transfer #uninit data;
    @{
           transfer newResource() data;              {
            decl i;
            transfer newResource(copy) i;
i; !{                   
transfer newResource() date;
                transfer newResource() date;
            i; 
			transfer newResource(copy) i;
                   }
    }
    ,{
        call printLine(newResource(copy));
    };
    @{
        call printStructLine(data);
    }
    ,{
        call printLine(newResource(copy));
    };
};
fn CWE416_Use_After_Free__malloc_free_struct_15_good() -> #voidTy{
    call goodB2G1();
    call goodB2G2();
    call goodG2B1();
    call goodG2B2();
};
fn main(argc:#own(copy), argv:#own()) -> #own(copy){
        call printLine(newResource(copy));
    call CWE416_Use_After_Free__malloc_free_struct_15_good();
    call printLine(newResource(copy));
    call printLine(newResource(copy));
    call CWE416_Use_After_Free__malloc_free_struct_15_bad();
    call printLine(newResource(copy));
    val(newResource(copy))    };
decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1) ;