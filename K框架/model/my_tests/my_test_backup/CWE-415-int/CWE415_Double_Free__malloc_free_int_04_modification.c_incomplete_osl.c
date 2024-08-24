decl STATIC_CONST_TRUE; transfer newResource(copy) STATIC_CONST_TRUE; /* true */
decl STATIC_CONST_FALSE; transfer newResource(copy) STATIC_CONST_FALSE; /* false */

//#ifndef OMITBAD
fn printLine(line:#own())-> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};

fn CWE415_Double_Free__malloc_free_int_04_bad()-> #voidTy{
    decl data;
    transfer #uninit data;
    STATIC_CONST_TRUE; @{   //if statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
    };
    STATIC_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G1() - use badsource and goodsink by changing the second STATIC_CONST_TRUE to STATIC_CONST_FALSE */
fn goodB2G1()-> #voidTy{
    decl data;
    transfer #uninit data;
    STATIC_CONST_TRUE; @{   //if statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
    };
    STATIC_CONST_FALSE; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        call printLine(newResource(copy));
    }
     , {
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
 //       ; /* empty statement needed for some flow variants */
    };
};

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the second if */
fn goodB2G2()-> #voidTy{
    decl data;
    transfer #uninit data;
    STATIC_CONST_TRUE; @{   //if statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
    };
    STATIC_CONST_TRUE; @{   //if statement
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
     //   ; /* empty statement needed for some flow variants */
    };
};

/* goodG2B1() - use goodsource and badsink by changing the first STATIC_CONST_TRUE to STATIC_CONST_FALSE */
fn goodG2B1()-> #voidTy{
    decl data;
    transfer #uninit data;
    STATIC_CONST_FALSE; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        call printLine(newResource(copy));
    }
     , {
        transfer newResource() data;      //malloc function
        /* FIX: Do NOT free data in the source - the bad sink frees data */
    };
    STATIC_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

/* goodG2B2() - use goodsource and badsink by reversing the blocks in the first if */
fn goodG2B2()-> #voidTy{
    decl data;
    transfer #uninit data;
    STATIC_CONST_TRUE; @{   //if statement
        transfer newResource() data;      //malloc function
        /* FIX: Do NOT free data in the source - the bad sink frees data */
    };
    STATIC_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

fn CWE415_Double_Free__malloc_free_int_04_good()-> #voidTy{
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
 //   srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_int_04_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_int_04_bad();
    call printLine(newResource(copy));
//#endif /* OMITBAD */
    val(newResource(copy))  // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
//#endif
