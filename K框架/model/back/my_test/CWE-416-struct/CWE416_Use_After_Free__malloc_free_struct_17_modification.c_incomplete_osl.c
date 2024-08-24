/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE416_Use_After_Free__malloc_free_struct_17.c
Label Definition File: CWE416_Use_After_Free__malloc_free.label.xml
Template File: sources-sinks-17.tmpl.c
*/
/*
 * @description
 * CWE: 416 Use After Free
 * BadSource:  Allocate data using malloc(), initialize memory block, and Deallocate data using free()
 * GoodSource: Allocate data using malloc() and initialize memory block
 * Sinks:
 *    GoodSink: Do nothing
 *    BadSink : Use data
 * Flow Variant: 17 Control flow: for loops
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>

//#ifndef OMITBAD
//#include <time.h>


fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};

fn printStructLine(structTwoIntsStruct:#own()) -> #voidTy{
    structTwoIntsStruct;structTwoIntsStruct;   //printf arguments
};

fn CWE416_Use_After_Free__malloc_free_struct_17_bad() -> #voidTy{
    decl i:#own(copy);
decl j:#own(copy);

    decl data;
    /* Initialize data */
    transfer bot data;
    transfer newResource(copy) i;
i; !{   //for statement
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() date;
                transfer newResource() date;
            i; transfer i newResource(copy);
            };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
    i; transfer i newResource(copy);
    };
    transfer newResource(copy) j;
j; !{   //for statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        decl structTwoIntsStruct;
        structTwoIntsStruct borrow data;
        call printStructLine(structTwoIntsStruct);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
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
    /* Initialize data */
    transfer bot data;
    transfer newResource(copy) i;
i; !{   //for statement
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() date;
                transfer newResource() date;
            i; transfer i newResource(copy);
            };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
    i; transfer i newResource(copy);
    };
    transfer newResource(copy) k;
k; !{   //for statement
        /* FIX: Don't use data that may have been freed already */
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        /* do nothing */
     //   ; /* empty statement needed for some flow variants */
    k; transfer k newResource(copy);
    };
};

/* goodG2B() - use goodsource and badsink in the for statements */
fn goodG2B() -> #voidTy{
    decl h:#own(copy);
decl j:#own(copy);

    decl data;
    /* Initialize data */
    transfer bot data;
    transfer newResource(copy) h;
h; !{   //for statement
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() date;
                transfer newResource() date;
            i; transfer i newResource(copy);
            };
        }
        /* FIX: Do not free data in the source */
    h; transfer h newResource(copy);
    };
    transfer newResource(copy) j;
j; !{   //for statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        decl structTwoIntsStruct;
        structTwoIntsStruct borrow data;
        call printStructLine(structTwoIntsStruct);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    j; transfer j newResource(copy);
    };
};

fn CWE416_Use_After_Free__malloc_free_struct_17_good() -> #voidTy{
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
    call CWE416_Use_After_Free__malloc_free_struct_17_good();
//    call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
//    call printLine("Calling bad()...");
    call CWE416_Use_After_Free__malloc_free_struct_17_bad();
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
