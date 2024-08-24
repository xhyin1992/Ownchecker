/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE457_Use_of_Uninitialized_Variable__struct_pointer_16.c
Label Definition File: CWE457_Use_of_Uninitialized_Variable.c.label.xml
Template File: sources-sinks-16.tmpl.c
*/
/*
 * @description
 * CWE: 457 Use of Uninitialized Variable
 * BadSource: no_init Don't initialize data
 * GoodSource: Initialize data
 * Sinks: use
 *    GoodSink: Initialize then use data
 *    BadSink : Use data
 * Flow Variant: 16 Control flow: while(1)
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

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_16_bad() -> #voidTy{
    decl data;
    ! {   //while statement
        /* POTENTIAL FLAW: Don't initialize data */
    //    ; /* empty statement needed for some flow variants */
        
    };
    ! {   //while statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
        call printIntLine(data);
        
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G() - use badsource and goodsink by changing the sinks in the second while statement */
fn goodB2G() -> #voidTy{
    decl data;
    ! {   //while statement
        /* POTENTIAL FLAW: Don't initialize data */
     //   ; /* empty statement needed for some flow variants */
        
    };
    ! {   //while statement
        /* FIX: Ensure data is initialized before use */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
        call printIntLine(data);
        call printIntLine(data);
        
    };
};

/* goodG2B() - use goodsource and badsink by changing the sources in the first while statement */
fn goodG2B() -> #voidTy{
    decl data;
    ! {   //while statement
        /* FIX: Initialize data */
        /* initialize both the pointer and the data pointed to */
        transfer newResource() data;      //malloc function
        transfer newResource(copy) data;    // member variable assign
        transfer newResource(copy) data;    // member variable assign
        
    };
    ! {   //while statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
        call printIntLine(data);
        
    };
};

fn CWE457_Use_of_Uninitialized_Variable__struct_pointer_16_good() -> #voidTy{
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
 //   call printLine("Calling good()...");
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_16_good();
//    call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
//    call printLine("Calling bad()...");
    call CWE457_Use_of_Uninitialized_Variable__struct_pointer_16_bad();
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
