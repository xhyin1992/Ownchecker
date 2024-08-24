/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE457_Use_of_Uninitialized_Variable__struct_pointer_02.c
Label Definition File: CWE457_Use_of_Uninitialized_Variable.c.label.xml
Template File: sources-sinks-02.tmpl.c
*/
/*
 * @description
 * CWE: 457 Use of Uninitialized Variable
 * BadSource: no_init Don't initialize data
 * GoodSource: Initialize data
 * Sinks: use
 *    GoodSink: Initialize then use data
 *    BadSink : Use data
 * Flow Variant: 02 Control flow: if(1) and if(0)
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>

//#ifndef OMITBAD
//#include <time.h>

/* struct used in some test cases as a custom type */

fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};
fn printIntLine(intNumber:#own(copy)) -> #voidTy{
    intNumber;   //printf arguments
};

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_02_bad() -> #voidTy{
    decl data;
    @ {   //if statement
        /* POTENTIAL FLAW: Don't initialize data */
    //    ; /* empty statement needed for some flow variants */
    };
    @ {   //if statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
        call printIntLine(data);
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G1() - use badsource and goodsink by changing the second 1 to 0 */
fn goodB2G1() -> #voidTy{
    decl data;
    @ {   //if statement
        /* POTENTIAL FLAW: Don't initialize data */
     //   ; /* empty statement needed for some flow variants */
    };
    @ {   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
     //   call printLine("Benign, fixed string");
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

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the second if */
fn goodB2G2() -> #voidTy{
    decl data;
    @ {   //if statement
        /* POTENTIAL FLAW: Don't initialize data */
     //   ; /* empty statement needed for some flow variants */
    };
    @ {   //if statement
        /* FIX: Ensure data is initialized before use */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
        call printIntLine(data);
        call printIntLine(data);
    };
};

/* goodG2B1() - use goodsource and badsink by changing the first 1 to 0 */
fn goodG2B1() -> #voidTy{
    decl data;
    @ {   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
     //   call printLine("Benign, fixed string");
    }
     , {
        /* FIX: Initialize data */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
    };
    @ {   //if statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
        call printIntLine(data);
    };
};

/* goodG2B2() - use goodsource and badsink by reversing the blocks in the first if */
fn goodG2B2() -> #voidTy{
    decl data;
    @ {   //if statement
        /* FIX: Initialize data */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
    };
    @ {   //if statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
        call printIntLine(data);
    };
};

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_02_good() -> #voidTy{
    call goodB2G1();
    call goodB2G2();
    call goodG2B1();
    call goodG2B2();
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
//    call printLine("Calling good()...");
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_02_good();
//    call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
//    call printLine("Calling bad()...");
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_02_bad();
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
