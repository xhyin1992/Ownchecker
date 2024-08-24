/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE415_Double_Free__malloc_free_int_53a.c
Label Definition File: CWE415_Double_Free__malloc_free.label.xml
Template File: sources-sinks-53a.tmpl.c
*/
/*
 * @description
 * CWE: 415 Double Free
 * BadSource:  Allocate data using malloc() and Deallocate data using free()
 * GoodSource: Allocate data using malloc()
 * Sinks:
 *    GoodSink: do nothing
 *    BadSink : Deallocate data using free()
 * Flow Variant: 53 Data flow: data passed as an argument from one function through two others to a fourth; all four functions are in different source files
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>

//#ifndef OMITBAD
//#include <time.h>

fn printLine(line:#own())-> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};
/* bad function declaration */
fn CWE415_Double_Free__malloc_free_int_53d_badSink(data:#own())-> #voidTy{
    /* POTENTIAL FLAW: Possibly freeing memory twice */
    deallocate data;      // free function
};

/* goodG2B uses the GoodSource with the BadSink */
fn CWE415_Double_Free__malloc_free_int_53d_goodG2BSink(data:#own())-> #voidTy{
    /* POTENTIAL FLAW: Possibly freeing memory twice */
    deallocate data;      // free function
};

/* goodB2G uses the BadSource with the GoodSink */
fn CWE415_Double_Free__malloc_free_int_53d_goodB2GSink(data:#own())-> #voidTy{
    /* do nothing */
    /* FIX: Don't attempt to free the memory */
 //   ; /* empty statement needed for some flow variants */
};

fn CWE415_Double_Free__malloc_free_int_53c_badSink(data:#own())-> #voidTy{
    call CWE415_Double_Free__malloc_free_int_53d_badSink(data);
};

fn CWE415_Double_Free__malloc_free_int_53c_goodG2BSink(data:#own())-> #voidTy{
    call CWE415_Double_Free__malloc_free_int_53d_goodG2BSink(data);
};

fn CWE415_Double_Free__malloc_free_int_53c_goodB2GSink(data:#own())-> #voidTy{
    call CWE415_Double_Free__malloc_free_int_53d_goodB2GSink(data);
};

fn CWE415_Double_Free__malloc_free_int_53b_badSink(data:#own())-> #voidTy{
    call CWE415_Double_Free__malloc_free_int_53c_badSink(data);
};

fn CWE415_Double_Free__malloc_free_int_53b_goodG2BSink(data:#own())-> #voidTy{
    call CWE415_Double_Free__malloc_free_int_53c_goodG2BSink(data);
};

fn CWE415_Double_Free__malloc_free_int_53b_goodB2GSink(data:#own())-> #voidTy{
    call CWE415_Double_Free__malloc_free_int_53c_goodB2GSink(data);
};

fn CWE415_Double_Free__malloc_free_int_53_bad()-> #voidTy{
    decl data;
    /* Initialize data */
    // transfer bot data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    call CWE415_Double_Free__malloc_free_int_53b_badSink(data);
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

fn goodG2B()-> #voidTy{
    decl data;
    /* Initialize data */
    // transfer bot data;
    transfer newResource() data;      //malloc function
    /* FIX: Do NOT free data in the source - the bad sink frees data */
    call CWE415_Double_Free__malloc_free_int_53b_goodG2BSink(data);
};

fn goodB2G()-> #voidTy{
    decl data;
    /* Initialize data */
    // transfer bot data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    call CWE415_Double_Free__malloc_free_int_53b_goodB2GSink(data);
};

fn CWE415_Double_Free__malloc_free_int_53_good()-> #voidTy{
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
 //   srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
    //call printLine("Calling good()...");
    call CWE415_Double_Free__malloc_free_int_53_good();
    //call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    //call printLine("Calling bad()...");
    call CWE415_Double_Free__malloc_free_int_53_bad();
    //call printLine("Finished bad()");
//#endif /* OMITBAD */
    val(newResource(copy))    // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
//#endif
