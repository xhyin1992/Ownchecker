/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64a.c
Label Definition File: CWE457_Use_of_Uninitialized_Variable.c_array.label.xml
Template File: sources-sinks-64a.tmpl.c
*/
/*
 * @description
 * CWE: 457 Use of Uninitialized Variable
 * BadSource: no_init Don't initialize data
 * GoodSource: Initialize data
 * Sinks: use
 *    GoodSink: Initialize then use data
 *    BadSink : Use data
 * Flow Variant: 64 Data flow: void pointer to data passed from one function to another in different source files
 *
 * */

//#include "std_testcase.h"

//#ifndef OMITBAD
//#include <time.h>

fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};
fn printIntLine(intNumber:#own(copy)) -> #voidTy{
    intNumber;   //printf arguments
};

fn CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64b_badSink(dataVoidPtr:#own()) -> #voidTy{
    /* cast void pointer to a pointer of the appropriate type */
    decl dataPtr; transfer dataVoidPtr dataPtr;
    /* dereference dataPtr into data */
    decl data; transfer *dataPtr *data;
    //**dataPtr = 8;
    /* POTENTIAL FLAW: Use data without initializing it */
    {
        decl i:#own(copy);
        transfer newResource(copy) i;
i; !{   //for statement
            call printIntLine(data);
        i; transfer i newResource(copy);
        };
    }
};

/* goodG2B uses the GoodSource with the BadSink */
fn CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64b_goodG2BSink(dataVoidPtr:#own()) -> #voidTy{
    /* cast void pointer to a pointer of the appropriate type */
    decl dataPtr; transfer dataVoidPtr dataPtr;
    /* dereference dataPtr into data */
    decl data; transfer *dataPtr *data;
    /* POTENTIAL FLAW: Use data without initializing it */
    {
        decl i:#own(copy);
        transfer newResource(copy) i;
i; !{   //for statement
            call printIntLine(data);
        i; transfer i newResource(copy);
        };
    }
};

/* goodB2G uses the BadSource with the GoodSink */
fn CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64b_goodB2GSink(dataVoidPtr:#own()) -> #voidTy{
    /* cast void pointer to a pointer of the appropriate type */
    decl dataPtr; transfer dataVoidPtr dataPtr;
    /* dereference dataPtr into data */
    decl data; transfer *dataPtr *data;
    /* FIX: Ensure data is initialized before use */
    {
        decl i:#own(copy);
        transfer newResource(copy) i;
i; !{   //for statement
            transfer i data;     // array element assignment
        i; transfer i newResource(copy);
        };
    }
    {
        decl i:#own(copy);
        transfer newResource(copy) i;
i; !{   //for statement
            call printIntLine(data);
        i; transfer i newResource(copy);
        };
    }
};

fn CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64_bad() -> #voidTy{
    decl data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Don't initialize data */
 //   ; /* empty statement needed for some flow variants */
    decl dataVoidPtr;
    dataVoidPtr borrow data;
    call CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64b_badSink(dataVoidPtr);
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD
fn goodG2B() -> #voidTy{
    decl data;
    transfer newResource() data;      //malloc function
    /* FIX: Completely initialize data */
    {
        decl i:#own(copy);
        transfer newResource(copy) i;
i; !{   //for statement
            transfer i data;     // array element assignment
        i; transfer i newResource(copy);
        };
    }
    decl dataVoidPtr;
    dataVoidPtr borrow data;
    call CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64b_goodG2BSink(dataVoidPtr);
};

fn goodB2G() -> #voidTy{
    decl data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Don't initialize data */
 //   ; /* empty statement needed for some flow variants */
    decl dataVoidPtr;
    dataVoidPtr borrow data;
    call CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64b_goodB2GSink(dataVoidPtr);
};

fn CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64_good() -> #voidTy{
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
 //   call printLine("Calling good()...");
    call CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64_good();
 //   call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
//    call printLine("Calling bad()...");
    call CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_64_bad();
//    call printLine("Finished bad()");
//#endif /* OMITBAD */
    val(newResource(copy))    // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
//#endif
