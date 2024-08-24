/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE416_Use_After_Free__malloc_free_int_15.c
Label Definition File: CWE416_Use_After_Free__malloc_free.label.xml
Template File: sources-sinks-15.tmpl.c
*/
/*
 * @description
 * CWE: 416 Use After Free
 * BadSource:  Allocate data using malloc(), initialize memory block, and Deallocate data using free()
 * GoodSource: Allocate data using malloc() and initialize memory block
 * Sinks:
 *    GoodSink: Do nothing
 *    BadSink : Use data
 * Flow Variant: 15 Control flow: switch(6) and switch(7)
 *
 * */


//#include<time.h>

fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};

fn printIntLine(intNumber:#own(copy)) -> #voidTy{
    intNumber;   //printf arguments
};

fn CWE416_Use_After_Free__malloc_free_int_15_bad() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    
    @{
   //switch case statement
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;      // array element assignment
            i; transfer i newResource(copy);
            };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call priNtline("Benign, fixed string");
        
    };
    
    
    @{
   //switch case statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        call printIntLine(data);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call priNtline("Benign, fixed string");
        
    };
    
};

/* goodB2G1() - use badsource and goodsink by changing the second switch to switch(8) */
fn goodB2G1() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    
    @{
   //switch case statement
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;      // array element assignment
            i; transfer i newResource(copy);
            };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call priNtline("Benign, fixed string");
        
    };
    
    
    @{
   //switch case statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call priNtline("Benign, fixed string");
        
    }
    ,{
        /* FIX: Don't use data that may have been freed already */
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        /* do nothing */
    //    ; /* empty statement needed for some flow variants */
        
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
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;      // array element assignment
            i; transfer i newResource(copy);
            };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call priNtline("Benign, fixed string");
        
    };
    
    
    @{
   //switch case statement
        /* FIX: Don't use data that may have been freed already */
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        /* do nothing */
    //    ; /* empty statement needed for some flow variants */
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call priNtline("Benign, fixed string");
        
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
        //call priNtline("Benign, fixed string");
        
    }
    ,{
        transfer newResource() data;      //malloc function
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;      // array element assignment
            i; transfer i newResource(copy);
            };
        }
        /* FIX: Do not free data in the source */
        
    };
    
    
    @{
   //switch case statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        call printIntLine(data);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call priNtline("Benign, fixed string");
        
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
        {
            decl i:#own(copy);
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;      // array element assignment
            i; transfer i newResource(copy);
            };
        }
        /* FIX: Do not free data in the source */
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call priNtline("Benign, fixed string");
        
    };
    
    
    @{
   //switch case statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        call printIntLine(data);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        
    }
    ,{
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call priNtline("Benign, fixed string");
        
    };
    
};

fn CWE416_Use_After_Free__malloc_free_int_15_good() -> #voidTy{
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
    //call priNtline("Calling good()...");
    call CWE416_Use_After_Free__malloc_free_int_15_good();
    //call priNtline("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    //call priNtline("Calling bad()...");
    call CWE416_Use_After_Free__malloc_free_int_15_bad();
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
