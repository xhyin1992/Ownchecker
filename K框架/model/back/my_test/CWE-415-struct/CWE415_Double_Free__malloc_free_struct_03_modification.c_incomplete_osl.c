/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE415_Double_Free__malloc_free_struct_03.c
Label Definition File: CWE415_Double_Free__malloc_free.label.xml
Template File: sources-sinks-03.tmpl.c
*/
/*
 * @description
 * CWE: 415 Double Free
 * BadSource:  Allocate data using malloc() and Deallocate data using free()
 * GoodSource: Allocate data using malloc()
 * Sinks:
 *    GoodSink: do nothing
 *    BadSink : Deallocate data using free()
 * Flow Variant: 03 Control flow: if(5==5) and if(5!=5)
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>

//#ifndef OMITBAD
//#include<time.h>


fn printLine(line:#own())-> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};

fn CWE415_Double_Free__malloc_free_struct_03_bad()-> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    @{   //if statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
    };
    @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G1() - use badsource and goodsink by changing the second 5==5 to 5!=5 */
fn goodB2G1()-> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    @{   //if statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
    };
    @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
    }
     , {
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
   //     ; /* empty statement needed for some flow variants */
    };
};

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the second if */
fn goodB2G2()-> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    @{   //if statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
    };
    @{   //if statement
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
 //       ; /* empty statement needed for some flow variants */
    };
};

/* goodG2B1() - use goodsource and badsink by changing the first 5==5 to 5!=5 */
fn goodG2B1()-> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
    }
     , {
        transfer newResource() data;      //malloc function
        /* FIX: Do NOT free data in the source - the bad sink frees data */
    };
    @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

/* goodG2B2() - use goodsource and badsink by reversing the blocks in the first if */
fn goodG2B2()-> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    @{   //if statement
        transfer newResource() data;      //malloc function
        /* FIX: Do NOT free data in the source - the bad sink frees data */
    };
    @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

fn CWE415_Double_Free__malloc_free_struct_03_good()-> #voidTy{
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
//    srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
    //call printLine("Calling good()...");
    call CWE415_Double_Free__malloc_free_struct_03_good();
    //call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    //call printLine("Calling bad()...");
    call CWE415_Double_Free__malloc_free_struct_03_bad();
    //call printLine("Finished bad()");
//#endif /* OMITBAD */
    val(newResource(copy))   // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
//#endif
