fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};
fn printIntLine(intNumber:#own(copy)) -> #voidTy{
    intNumber;   //printf arguments
};

fn CWE457_Use_of_Uninitialized_Variable__int_01_bad() -> #voidTy{
    decl data;
    /* POTENTIAL FLAW: Don't initialize data */
 //   ; /* empty statement needed for some flow variants */
    /* POTENTIAL FLAW: Use data without initializing it */
    call printIntLine(data);
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodG2B uses the GoodSource with the BadSink */
fn goodG2B() -> #voidTy{
    decl data;
    /* FIX: Initialize data */
    transfer newResource(copy) data;
    /* POTENTIAL FLAW: Use data without initializing it */
    call printIntLine(data);
};

/* goodB2G uses the BadSource with the GoodSink */
fn goodB2G() -> #voidTy{
    decl data;
    /* POTENTIAL FLAW: Don't initialize data */
 //   ; /* empty statement needed for some flow variants */
    /* FIX: Ensure data is initialized before use */
    transfer newResource(copy) data;
    call printIntLine(data);
};

fn CWE457_Use_of_Uninitialized_Variable__int_01_good() -> #voidTy{
    call goodG2B();
    call goodB2G();
};

//#endif /* OMITGOOD */

/* Below is the main(). It is only used when building this testcase on
   its #own for testing or for building a binary to use in testing binary
   analysis tools. It is not used when compiling all the testcases as one
   application, which is how source code analysis tools are tested. */

//#ifdef INCLUDEMAIN

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    /* seed randomness */
    ////srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
    call printLine(newResource(copy));
    call CWE457_Use_of_Uninitialized_Variable__int_01_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE457_Use_of_Uninitialized_Variable__int_01_bad(); 
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
