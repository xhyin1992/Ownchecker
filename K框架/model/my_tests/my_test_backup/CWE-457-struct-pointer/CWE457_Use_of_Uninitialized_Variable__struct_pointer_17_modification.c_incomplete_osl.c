fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};
fn printIntLine(intNumber:#own(copy)) -> #voidTy{
    intNumber;   //printf arguments
};

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_17_bad() -> #voidTy{
    decl i;
decl j;

    decl data;
    transfer newResource(copy) i;
i; !{   //for statement
        /* POTENTIAL FLAW: Don't initialize data */
    //    ; /* empty statement needed for some flow variants */
    i; transfer i newResource(copy);
    };
    transfer newResource(copy) j;
j; !{   //for statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
        call printIntLine(data);
    j; transfer j newResource(copy);
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G() - use badsource and goodsink in the for statements */
fn goodB2G() -> #voidTy{
    decl i;
decl k;

    decl data;
    transfer newResource(copy) i;
i; !{   //for statement
        /* POTENTIAL FLAW: Don't initialize data */
     //   ; /* empty statement needed for some flow variants */
    i; transfer i newResource(copy);
    };
    transfer newResource(copy) k;
k; !{   //for statement
        /* FIX: Ensure data is initialized before use */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
        call printIntLine(data);
        call printIntLine(data);
    k; transfer k newResource(copy);
    };
};

/* goodG2B() - use goodsource and badsink in the for statements */
fn goodG2B() -> #voidTy{
    decl h;
decl j;

    decl data;
    transfer newResource(copy) h;
h; !{   //for statement
        /* FIX: Initialize data */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
    h; transfer h newResource(copy);
    };
    transfer newResource(copy) j;
j; !{   //for statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
        call printIntLine(data);
    j; transfer j newResource(copy);
    };
};

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_17_good() -> #voidTy{
    call goodB2G();
    call goodG2B();
};

//#endif /* OMITGOOD */

/* Below is the main(). It is only used when building this testcase on
   its #own for testing or for building a binary to use in testing binary
   analysis tools. It is not used when compiling all the testcases as one
   application, which is how source code analysis tools are tested. */

//#ifdef INCLUDEMAIN

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    /* seed randomness */
    //srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
    call printLine(newResource(copy));
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_17_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_17_bad();
    call printLine(newResource(copy));
//#endif /* OMITBAD */
    val(newResource(copy))    // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
//#endif
