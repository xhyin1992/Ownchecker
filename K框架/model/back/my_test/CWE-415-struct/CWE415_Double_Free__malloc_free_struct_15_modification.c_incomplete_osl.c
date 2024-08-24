/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE415_Double_Free__malloc_free_struct_15.c
Label Definition File: CWE415_Double_Free__malloc_free.label.xml
Template File: sources-sinks-15.tmpl.c
*/
/*
 * @description
 * CWE: 415 Double Free
 * BadSource:  Allocate data using malloc() and Deallocate data using free()
 * GoodSource: Allocate data using malloc()
 * Sinks:
 *    GoodSink: do nothing
 *    BadSink : Deallocate data using free()
 * Flow Variant: 15 Control flow: switch(6) and switch(7)
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>

//#ifndef OMITBAD
//#include<time.h>


fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};

fn CWE415_Double_Free__malloc_free_struct_15_bad() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    
    @{
   //switch case statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
        
    };
    
    
    @{
   //switch case statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
        
    };
    
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G1() - use badsource and goodsink by changing the second switch to switch(8) */
fn goodB2G1() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    
    @{
   //switch case statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
        
    };
    
    
    @{
   //switch case statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
        
    }
    ,{
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
     //   ; /* empty statement needed for some flow variants */
        
    };
    
};

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the second switch */
fn goodB2G2() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    
    @{
   //switch case statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
        
    };
    
    
    @{
   //switch case statement
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
     //   ; /* empty statement needed for some flow variants */
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
        
    };
    
};

/* goodG2B1() - use goodsource and badsink by changing the first switch to switch(5) */
fn goodG2B1() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    
    @{
   //switch case statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
        
    },{
        transfer newResource() data;      //malloc function
        /* FIX: Do NOT free data in the source - the bad sink frees data */
        
    
    };
    
    
    @{
   //switch case statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
        
    };
    
};

/* goodG2B2() - use goodsource and badsink by reversing the blocks in the first switch */
fn goodG2B2() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    
    @{
   //switch case statement
        transfer newResource() data;      //malloc function
        /* FIX: Do NOT free data in the source - the bad sink frees data */
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
        
    };
    
    
    @{
   //switch case statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call printLine("Benign, fixed string");
        
    };
    
};

fn CWE415_Double_Free__malloc_free_struct_15_good() -> #voidTy{
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
    call CWE415_Double_Free__malloc_free_struct_15_good();
    //call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    //call printLine("Calling bad()...");
    call CWE415_Double_Free__malloc_free_struct_15_bad();
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
