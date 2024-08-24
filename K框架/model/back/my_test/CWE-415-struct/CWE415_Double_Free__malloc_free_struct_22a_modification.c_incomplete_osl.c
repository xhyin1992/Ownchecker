/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE415_Double_Free__malloc_free_struct_22a.c
Label Definition File: CWE415_Double_Free__malloc_free.label.xml
Template File: sources-sinks-22a.tmpl.c
*/
/*
 * @description
 * CWE: 415 Double Free
 * BadSource:  Allocate data using malloc() and Deallocate data using free()
 * GoodSource: Allocate data using malloc()
 * Sinks:
 *    GoodSink: do nothing
 *    BadSink : Deallocate data using free()
 * Flow Variant: 22 Control flow: Flow controlled by value of a global variable. Sink functions are in a separate file from sources.
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>

//#ifndef OMITBAD
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include<time.h>


fn printLine(line:own()){
    line; @{   //if statement
        line;   //printf arguments
    }
}
/* The global variable below is used to drive control flow in the sink function */
decl CWE415_Double_Free__malloc_free_struct_22_badGlobal:own(copy); transfer (new_resource copy) CWE415_Double_Free__malloc_free_struct_22_badGlobal;
/* The global variables below are used to drive control flow in the sink functions. */
decl CWE415_Double_Free__malloc_free_struct_22_goodB2G1Global:own(copy); transfer (new_resource copy) CWE415_Double_Free__malloc_free_struct_22_goodB2G1Global;
decl CWE415_Double_Free__malloc_free_struct_22_goodB2G2Global:own(copy); transfer (new_resource copy) CWE415_Double_Free__malloc_free_struct_22_goodB2G2Global;
decl CWE415_Double_Free__malloc_free_struct_22_goodG2BGlobal:own(copy); transfer (new_resource copy) CWE415_Double_Free__malloc_free_struct_22_goodG2BGlobal;

fn CWE415_Double_Free__malloc_free_struct_22_badSink(data:own()){
    CWE415_Double_Free__malloc_free_struct_22_badGlobal; @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate(data);      // free function
    }
}

/* goodB2G1() - use badsource and goodsink by setting the static variable to false instead of true */
fn CWE415_Double_Free__malloc_free_struct_22_goodB2G1Sink(data:own()){
    CWE415_Double_Free__malloc_free_struct_22_goodB2G1Global; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        call printLine("Benign, fixed string");
    }
     , {
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
        ; /* empty statement needed for some flow variants */
    }
}

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the if in the sink function */
fn CWE415_Double_Free__malloc_free_struct_22_goodB2G2Sink(data:own()){
    CWE415_Double_Free__malloc_free_struct_22_goodB2G2Global; @{   //if statement
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
        ; /* empty statement needed for some flow variants */
    }
}

/* goodG2B() - use goodsource and badsink */
fn CWE415_Double_Free__malloc_free_struct_22_goodG2BSink(data:own()){
    CWE415_Double_Free__malloc_free_struct_22_goodG2BGlobal; @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate(data);      // free function
    }
}

fn CWE415_Double_Free__malloc_free_struct_22_bad(){
    decl data;
    /* Initialize data */
    transfer bot data;
    transfer new_resource data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate(data);      // free function
    transfer (new_resource copy) CWE415_Double_Free__malloc_free_struct_22_badGlobal; /* true */
    call CWE415_Double_Free__malloc_free_struct_22_badSink(data);
}

//#endif /* OMITBAD */

//#ifndef OMITGOOD
fn goodB2G1(){
    decl data;
    /* Initialize data */
    transfer bot data;
    transfer new_resource data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate(data);      // free function
    transfer (new_resource copy) CWE415_Double_Free__malloc_free_struct_22_goodB2G1Global; /* false */
    call CWE415_Double_Free__malloc_free_struct_22_goodB2G1Sink(data);
}

fn goodB2G2(){
    decl data;
    /* Initialize data */
    transfer bot data;
    transfer new_resource data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate(data);      // free function
    transfer (new_resource copy) CWE415_Double_Free__malloc_free_struct_22_goodB2G2Global; /* true */
    call CWE415_Double_Free__malloc_free_struct_22_goodB2G2Sink(data);
}

fn goodG2B(){
    decl data;
    /* Initialize data */
    transfer bot data;
    transfer new_resource data;      //malloc function
    /* FIX: Do NOT free data in the source - the bad sink frees data */
    transfer (new_resource copy) CWE415_Double_Free__malloc_free_struct_22_goodG2BGlobal; /* true */
    call CWE415_Double_Free__malloc_free_struct_22_goodG2BSink(data);
}

fn CWE415_Double_Free__malloc_free_struct_22_good(){
    call goodB2G1();
    call goodB2G2();
    call goodG2B();
}

//#endif /* OMITGOOD */

/* Below is the main(). It is only used when building this testcase on
   its own for testing or for building a binary to use in testing binary
   analysis tools. It is not used when compiling all the testcases as one
   application, which is how source code analysis tools are tested. */

//#ifdef INCLUDEMAIN

fn main(argc:own(copy), argv:own()) -> own(copy){
    /* seed randomness */
//    srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
    call printLine("Calling good()...");
    call CWE415_Double_Free__malloc_free_struct_22_good();
    call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine("Calling bad()...");
    call CWE415_Double_Free__malloc_free_struct_22_bad();
    call printLine("Finished bad()");
//#endif /* OMITBAD */
    val(new_resource copy);    // return value
}

//#endif
