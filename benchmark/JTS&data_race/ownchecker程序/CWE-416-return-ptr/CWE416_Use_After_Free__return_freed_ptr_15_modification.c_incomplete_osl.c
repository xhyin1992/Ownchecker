fn printLine(line:#own()) -> #voidTy {
    line; @{           
	line;       
	},{
    };
};
fn helperBad(aString1:#own()) -> #own(){
    decl i; 
	transfer newResource(copy) i;
    decl j;
    decl reversedString; 
	transfer #uninit reversedString;
    aString1; @{   //if statement
        aString1; 
		transfer newResource(copy) i;
        transfer newResource() reversedString;      //malloc function
        transfer newResource(copy) j;
j; i; !{   //for statement
            transfer aString1 reversedString;
        j; 
		transfer newResource(copy) j;
        };
        transfer newResource() reversedString;      // array element assignment
        deallocate reversedString;      // free function
        reversedString; 
		val(newResource())     // return value
    }
     , {
    };
};
fn helperGood(aString1:#own()) -> #own(){
    decl i; 
	transfer newResource(copy) i;
    decl j;
    decl reversedString; 
	transfer #uninit reversedString;
    aString1; @{   //if statement
        aString1; 
		transfer newResource(copy) i;
        transfer newResource() reversedString;      //malloc function
        transfer newResource(copy) j;
j; i; !{   //for statement
            transfer aString1 reversedString;
        j; 
		transfer newResource(copy) j;
        };
        transfer newResource() reversedString;      // array element assignment
        reversedString; val(newResource())     // return value
    }
     , {
    };
};
fn CWE416_Use_After_Free__return_freed_ptr_15_bad() -> #voidTy{
    @{
       {
        decl reversedString; 
        decl aString;
        transfer newResource() aString;
        call helperBad(aString); 
                call printLine(reversedString);
    }
}
    ,{
     call printLine(newResource(copy));
    };
};
fn good1() -> #voidTy{
    @{
        call printLine(newResource(copy));
    }
    ,{
    {
        decl reversedString; 
        decl aString;
        transfer newResource() aString;
        call helperGood(aString); 
        transfer newResource() reversedString;
        call printLine(reversedString);
    }
    };
};
fn good2() -> #voidTy{
    @{
    {
        decl reversedString; 
        transfer newResource() reversedString;
        call printLine(reversedString);
    }
}
    ,{
        call printLine(newResource(copy));
    };
};
fn CWE416_Use_After_Free__return_freed_ptr_15_good() -> #voidTy{
    call good1();
    call good2();
};
fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    call printLine(newResource(copy));
    call CWE416_Use_After_Free__return_freed_ptr_15_good();
    call printLine(newResource(copy));
    call printLine(newResource(copy));
    call CWE416_Use_After_Free__return_freed_ptr_15_bad();
    call printLine(newResource(copy));
    val(newResource(copy))    };
decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1) ;