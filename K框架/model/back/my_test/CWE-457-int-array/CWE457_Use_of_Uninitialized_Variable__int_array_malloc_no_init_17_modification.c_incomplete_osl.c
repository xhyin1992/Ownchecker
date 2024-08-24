/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_17.c
Label Definition File: CWE457_Use_of_Uninitialized_Variable.c_array.label.xml
Template File: sources-sinks-17.tmpl.c
*/
/*
 * @description
 * CWE: 457 Use of Uninitialized Variable
 * BadSource: no_init Don't initialize data
 * GoodSource: Initialize data
 * Sinks: use
 *    GoodSink: Initialize then use data
 *    BadSink : Use data
 * Flow Variant: 17 Control flow: for loops
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

fn CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_17_bad() -> #voidTy{
    decl i:#own(copy);
decl j:#own(copy);

    decl data;
    transfer newResource() data;      //malloc function
    transfer newResource(copy) i;
i; !{   //for statement
        /* POTENTIAL FLAW: Don't initialize data */
     //   ; /* empty statement needed for some flow variants */
    i; transfer i newResource(copy);
    };
    transfer newResource(copy) j;
j; !{   //for statement
        /* POTENTIAL FLAW: Use data without initializing it */
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                call printIntLine(data);
            i; transfer i newResource(copy);
            };
        }
    j; transfer j newResource(copy);
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G() - use badsource and goodsink in the for statements */
fn goodB2G() -> #voidTy{
    decl i:#own(copy);
decl k:#own(copy);

    decl data;
    transfer newResource() data;      //malloc function
    transfer newResource(copy) i;
i; !{   //for statement
        /* POTENTIAL FLAW: Don't initialize data */
     //   ; /* empty statement needed for some flow variants */
    i; transfer i newResource(copy);
    };
    transfer newResource(copy) k;
k; !{   //for statement
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
    k; transfer k newResource(copy);
    };
};

/* goodG2B() - use goodsource and badsink in the for statements */
fn goodG2B() -> #voidTy{
    decl h:#own(copy);
decl j:#own(copy);

    decl data;
    transfer newResource() data;      //malloc function
    transfer newResource(copy) h;
h; !{   //for statement
        /* FIX: Completely initialize data */
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer i data;     // array element assignment
            i; transfer i newResource(copy);
            };
        }
    h; transfer h newResource(copy);
    };
    transfer newResource(copy) j;
j; !{   //for statement
        /* POTENTIAL FLAW: Use data without initializing it */
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                call printIntLine(data);
            i; transfer i newResource(copy);
            };
        }
    j; transfer j newResource(copy);
    };
};

fn CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_17_good() -> #voidTy{
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
//    call printLine("Calling good()...");
    call CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_17_good();
//    call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
//    call printLine("Calling bad()...");
    call CWE457_Use_of_Uninitialized_Variable__int_array_malloc_no_init_17_bad();
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
