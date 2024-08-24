fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};
fn printIntLine(intNumber:#own(copy)) -> #voidTy{
    intNumber;   //printf arguments
};

/* The two functions always return 1 or 0, so a tool should be able to 
   identify that uses of these functions will always return these values */
fn globalReturnsTrueOrFalse() -> #own(copy){
    decl a; transfer newResource(copy) a;
	decl b; transfer newResource(copy) b;
	b; val(newResource(copy))     // return value
};

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_12_bad() -> #voidTy{
    decl data;
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* POTENTIAL FLAW: Don't initialize data */
    //    ; /* empty statement needed for some flow variants */
    }
     , {
        /* FIX: Initialize data */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
    };
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
        call printIntLine(data);
    }
     , {
        /* FIX: Ensure data is initialized before use */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
        call printIntLine(data);
        call printIntLine(data);
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G() - use badsource and goodsink by changing the first "if" so that
   both branches use the BadSource and the second "if" so that both branches
   use the GoodSink */
fn goodB2G() -> #voidTy{
    decl data;
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* POTENTIAL FLAW: Don't initialize data */
    //    ; /* empty statement needed for some flow variants */
    }
     , {
        /* POTENTIAL FLAW: Don't initialize data */
    //    ; /* empty statement needed for some flow variants */
    };
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* FIX: Ensure data is initialized before use */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
        call printIntLine(data);
        call printIntLine(data);
    }
     , {
        /* FIX: Ensure data is initialized before use */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
        call printIntLine(data);
        call printIntLine(data);
    };
};

/* goodG2B() - use goodsource and badsink by changing the first "if" so that
   both branches use the GoodSource and the second "if" so that both branches
   use the BadSink */
fn goodG2B() -> #voidTy{
    decl data;
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* FIX: Initialize data */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
    }
     , {
        /* FIX: Initialize data */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
    };
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
        call printIntLine(data);
    }
     , {
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
        call printIntLine(data);
    };
};

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_12_good() -> #voidTy{
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
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_12_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_12_bad();
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
