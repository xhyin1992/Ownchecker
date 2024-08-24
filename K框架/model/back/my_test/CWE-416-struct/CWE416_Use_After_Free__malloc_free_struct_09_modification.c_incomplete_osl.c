/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE416_Use_After_Free__malloc_free_struct_09.c
Label Definition File: CWE416_Use_After_Free__malloc_free.label.xml
Template File: sources-sinks-09.tmpl.c
*/
/*
 * @description
 * CWE: 416 Use After Free
 * BadSource:  Allocate data using malloc(), initialize memory block, and Deallocate data using free()
 * GoodSource: Allocate data using malloc() and initialize memory block
 * Sinks:
 *    GoodSink: Do nothing
 *    BadSink : Use data
 * Flow Variant: 09 Control flow: if(GLOBAL_CONST_TRUE) and if(GLOBAL_CONST_FALSE)
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>

//#ifndef OMITBAD

//#include <time.h>

decl GLOBAL_CONST_TRUE:#own(copy); transfer newResource(copy) GLOBAL_CONST_TRUE; /* true */
decl GLOBAL_CONST_FALSE:#own(copy); transfer newResource(copy) GLOBAL_CONST_FALSE; /* false */


fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};

fn printStructLine(structTwoIntsStruct:#own()) -> #voidTy{
    structTwoIntsStruct;structTwoIntsStruct;   //printf arguments
};

fn CWE416_Use_After_Free__malloc_free_struct_09_bad() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    GLOBAL_CONST_TRUE; @{   //if statement
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;
                transfer newResource() data;
            i; transfer i newResource(copy);
            };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
    };
    GLOBAL_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        decl structTwoIntsStruct;
        structTwoIntsStruct borrow data;
        call printStructLine(structTwoIntsStruct);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G1() - use badsource and goodsink by changing the second GLOBAL_CONST_TRUE to GLOBAL_CONST_FALSE */
fn goodB2G1() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    GLOBAL_CONST_TRUE; @{   //if statement
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;
                transfer newResource() data;
            i; transfer i newResource(copy);
            };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
    };
    GLOBAL_CONST_FALSE; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
    //    call printLine("Benign, fixed string");
    }
     , {
        /* FIX: Don't use data that may have been freed already */
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        /* do nothing */
    //    ; /* empty statement needed for some flow variants */
    };
};

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the second if */
fn goodB2G2() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    GLOBAL_CONST_TRUE; @{   //if statement
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;
                transfer newResource() data;
            i; transfer i newResource(copy);
            };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
    };
    GLOBAL_CONST_TRUE; @{   //if statement
        /* FIX: Don't use data that may have been freed already */
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        /* do nothing */
    //    ; /* empty statement needed for some flow variants */
    };
};

/* goodG2B1() - use goodsource and badsink by changing the first GLOBAL_CONST_TRUE to GLOBAL_CONST_FALSE */
fn goodG2B1() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    GLOBAL_CONST_FALSE; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
    //    call printLine("Benign, fixed string");
    }
     , {
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;
                transfer newResource() data;
            i; transfer i newResource(copy);
            };
        }
        /* FIX: Do not free data in the source */
    };
    GLOBAL_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        decl structTwoIntsStruct;
        structTwoIntsStruct borrow data;
        call printStructLine(structTwoIntsStruct);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    };
};

/* goodG2B2() - use goodsource and badsink by reversing the blocks in the first if */
fn goodG2B2() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    GLOBAL_CONST_TRUE; @{   //if statement
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;
                transfer newResource() data;
            i; transfer i newResource(copy);
            };
        }
        /* FIX: Do not free data in the source */
    };
    GLOBAL_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        decl structTwoIntsStruct;
        structTwoIntsStruct borrow data;
        call printStructLine(structTwoIntsStruct);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    };
};

fn CWE416_Use_After_Free__malloc_free_struct_09_good() -> #voidTy{
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
 //   call printLine("Calling good()...");
    call CWE416_Use_After_Free__malloc_free_struct_09_good();
 //   call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
//    call printLine("Calling bad()...");
    call CWE416_Use_After_Free__malloc_free_struct_09_bad();
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
