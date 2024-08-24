/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE416_Use_After_Free__malloc_free_int_12.c
Label Definition File: CWE416_Use_After_Free__malloc_free.label.xml
Template File: sources-sinks-12.tmpl.c
*/
/*
 * @description
 * CWE: 416 Use After Free
 * BadSource:  Allocate data using malloc(), initialize memory block, and Deallocate data using free()
 * GoodSource: Allocate data using malloc() and initialize memory block
 * Sinks:
 *    GoodSink: Do nothing
 *    BadSink : Use data
 * Flow Variant: 12 Control flow: if(globalReturnsTrueOrFalse())
 *
 * */


//#include<time.h>

fn globalReturnsTrueOrFalse() -> #own(copy){
    decl a:#own(copy); call rand(); transfer newResource(copy) a;
    decl b:#own(copy); transfer newResource(copy) b;
    b; val(newResource(copy))     // return value
};

fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};

fn printIntLine(intNumber:#own(copy)) -> #voidTy{
    intNumber;   //printf arguments
};

fn CWE416_Use_After_Free__malloc_free_int_12_bad() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    call globalReturnsTrueOrFalse(); @{   //if statement
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
     , {
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
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        call printIntLine(data);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    }
     , {
        /* FIX: Don't use data that may have been freed already */
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        /* do nothing */
    //    ; /* empty statement needed for some flow variants */
    };
};

/* goodB2G() - use badsource and goodsink by changing the first "if" so that
   both branches use the BadSource and the second "if" so that both branches
   use the GoodSink */
fn goodB2G() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    call globalReturnsTrueOrFalse(); @{   //if statement
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
     , {
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
    };
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* FIX: Don't use data that may have been freed already */
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        /* do nothing */
    //    ; /* empty statement needed for some flow variants */
    }
     , {
        /* FIX: Don't use data that may have been freed already */
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        /* do nothing */
    //    ; /* empty statement needed for some flow variants */
    };
};

/* goodG2B() - use goodsource and badsink by changing the first "if" so that
   both branches use the GoodSource and the second "if" so that both branches
   use the BadSink */
fn goodG2B() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    call globalReturnsTrueOrFalse(); @{   //if statement
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
     , {
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
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        call printIntLine(data);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    }
     , {
        /* POTENTIAL FLAW: Use of data that may have been freed */
        call printIntLine(data);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    };
};

fn CWE416_Use_After_Free__malloc_free_int_12_good() -> #voidTy{
    call goodB2G();
    call goodG2B();
};

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
    call CWE416_Use_After_Free__malloc_free_int_12_good();
    //call priNtline("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    //call priNtline("Calling bad()...");
    call CWE416_Use_After_Free__malloc_free_int_12_bad();
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
