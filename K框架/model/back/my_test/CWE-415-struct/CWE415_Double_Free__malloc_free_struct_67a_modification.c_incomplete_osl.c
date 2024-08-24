/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE415_Double_Free__malloc_free_struct_67a.c
Label Definition File: CWE415_Double_Free__malloc_free.label.xml
Template File: sources-sinks-67a.tmpl.c
*/
/*
 * @description
 * CWE: 415 Double Free
 * BadSource:  Allocate data using malloc() and Deallocate data using free()
 * GoodSource: Allocate data using malloc()
 * Sinks:
 *    GoodSink: do nothing
 *    BadSink : Deallocate data using free()
 * Flow Variant: 67 Data flow: data passed in a struct from one function to another in different source files
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>
//#include<time.h>


fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};


//#ifndef OMITBAD

/* bad function declaration */
fn CWE415_Double_Free__malloc_free_struct_67b_badSink(myStruct:#own(copy)) -> #voidTy{
    decl data; transfer myStruct data;
    /* POTENTIAL FLAW: Possibly freeing memory twice */
    deallocate data;      // free function
};

/* goodG2B uses the GoodSource with the BadSink */
fn CWE415_Double_Free__malloc_free_struct_67b_goodG2BSink(myStruct:#own(copy)) -> #voidTy{
    decl data; transfer myStruct data;
    /* POTENTIAL FLAW: Possibly freeing memory twice */
    deallocate data;      // free function
};

/* goodB2G uses the BadSource with the GoodSink */
fn CWE415_Double_Free__malloc_free_struct_67b_goodB2GSink(myStruct:#own(copy)) -> #voidTy{
    decl data; transfer myStruct data;
    /* do nothing */
    /* FIX: Don't attempt to free the memory */
//    ; /* empty statement needed for some flow variants */
};

fn CWE415_Double_Free__malloc_free_struct_67_bad() -> #voidTy{
    decl data;
    decl myStruct:#own(copy);
    /* Initialize data */
    transfer bot data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    transfer data myStruct;    // member variable assign
    call CWE415_Double_Free__malloc_free_struct_67b_badSink(myStruct);
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodG2B uses the GoodSource with the BadSink */
fn CWE415_Double_Free__malloc_free_struct_67b_goodG2BSink(myStruct:#own(copy))-> #voidTy{};

fn goodG2B() -> #voidTy{
    decl data;
    decl myStruct:#own(copy);
    /* Initialize data */
    transfer bot data;
    transfer newResource() data;      //malloc function
    /* FIX: Do NOT free data in the source - the bad sink frees data */
    transfer data myStruct;    // member variable assign
    call CWE415_Double_Free__malloc_free_struct_67b_goodG2BSink(myStruct);
};

/* goodB2G uses the BadSource with the GoodSink */
fn CWE415_Double_Free__malloc_free_struct_67b_goodB2GSink(myStruct:#own(copy))-> #voidTy{};

fn goodB2G() -> #voidTy{
    decl data;
    decl myStruct:#own(copy);
    /* Initialize data */
    transfer bot data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    transfer data myStruct;    // member variable assign
    call CWE415_Double_Free__malloc_free_struct_67b_goodB2GSink(myStruct);
};

fn CWE415_Double_Free__malloc_free_struct_67_good() -> #voidTy{
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
    //call priNtline("Calling good()...");
    call CWE415_Double_Free__malloc_free_struct_67_good();
    //call priNtline("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    //call priNtline("Calling bad()...");
    call CWE415_Double_Free__malloc_free_struct_67_bad();
    //call priNtline("Finished bad()");
//#endif /* OMITBAD */
    val(newResource(copy))    // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
//#endif
