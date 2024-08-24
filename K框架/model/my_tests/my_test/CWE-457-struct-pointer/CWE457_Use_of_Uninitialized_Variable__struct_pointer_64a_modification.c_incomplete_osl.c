fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};
fn printIntLine(intNumber:#own(copy)) -> #voidTy{
    intNumber;   //printf arguments
};

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_badSink(dataVoidPtr:#own()) -> #voidTy{
    /* cast void pointer to a pointer of the appropriate type */
    decl dataPtr; transfer dataVoidPtr dataPtr;
    /* dereference dataPtr into data */
    decl data; transfer *dataPtr *data;
    /* POTENTIAL FLAW: Use data without initializing it */
    call printIntLine(data);
    call printIntLine(data);
};

/* goodG2B uses the GoodSource with the BadSink */
fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_goodG2BSink(dataVoidPtr:#own()) -> #voidTy{
    /* cast void pointer to a pointer of the appropriate type */
    decl dataPtr; transfer dataVoidPtr dataPtr;
    /* dereference dataPtr into data */
    decl data; transfer *dataPtr *data;
    /* POTENTIAL FLAW: Use data without initializing it */
    call printIntLine(data);
    call printIntLine(data);
};

/* goodB2G uses the BadSource with the GoodSink */
fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_goodB2GSink(dataVoidPtr:#own()) -> #voidTy{
    /* cast void pointer to a pointer of the appropriate type */
    decl dataPtr; transfer dataVoidPtr dataPtr;
    /* dereference dataPtr into data */
    decl data; transfer *dataPtr *data;
    /* FIX: Ensure data is initialized before use */
    /* initialize both the pointer and the data pointed to */
    transfer newResource() data;      //malloc function
    transfer newResource(copy) data;    // member variable assign
    transfer newResource(copy) data;    // member variable assign
    call printIntLine(data);
    call printIntLine(data);
};

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_64_bad() -> #voidTy{
    decl data;
    /* POTENTIAL FLAW: Don't initialize data */
   // ; /* empty statement needed for some flow variants */
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_badSink(data);
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD
fn goodG2B() -> #voidTy{
    decl data;
    /* FIX: Initialize data */
    /* initialize both the pointer and the data pointed to */
    transfer newResource() data;      //malloc function
    transfer newResource(copy) data;    // member variable assign
    transfer newResource(copy) data;    // member variable assign
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_goodG2BSink(data);
};

fn goodB2G() -> #voidTy{
    decl data;
    /* POTENTIAL FLAW: Don't initialize data */
 //   ; /* empty statement needed for some flow variants */
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_goodB2GSink(data);
};

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_64_good() -> #voidTy{
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
    //srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
    call printLine(newResource(copy));
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_64_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_64_bad();
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
