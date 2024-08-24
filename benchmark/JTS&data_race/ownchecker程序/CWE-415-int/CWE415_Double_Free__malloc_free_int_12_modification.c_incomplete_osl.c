fn globalReturnsTrueOrFalse() -> #own(copy){
    decl a; 
    transfer newResource(copy) a;
    decl b; transfer newResource(copy) b;
    b; val(newResource(copy))     // return value
};

fn printLine(line:#own()) -> #voidTy {
    line; @{   //if statement
        line;   //printf arguments
    },{
    };
};
fn CWE415_Double_Free__malloc_free_int_12_bad()-> #voidTy{
    decl data;
    transfer #uninit data;
    call globalReturnsTrueOrFalse(); @{   //if statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
    }
     , {
        transfer newResource() data;      //malloc function
        /* FIX: Do NOT free data in the source - the bad sink frees data */
    };
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    }
     , {
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
 //       ; /* empty statement needed for some flow variants */
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G() - use badsource and goodsink by changing the first "if" so that
   both branches use the BadSource and the second "if" so that both branches
   use the GoodSink */
fn goodB2G()-> #voidTy{
    decl data;
    transfer #uninit data;
    call globalReturnsTrueOrFalse(); @{   //if statement
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
    }
     , {
        transfer newResource() data;      //malloc function
        /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
        deallocate data;      // free function
    };
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
  //      ; /* empty statement needed for some flow variants */
    }
     , {
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
 //       ; /* empty statement needed for some flow variants */
    };
};

/* goodG2B() - use goodsource and badsink by changing the first "if" so that
   both branches use the GoodSource and the second "if" so that both branches
   use the BadSink */
fn goodG2B()-> #voidTy{
    decl data;
    transfer #uninit data;
    call globalReturnsTrueOrFalse(); @{   //if statement
        transfer newResource() data;      //malloc function
        /* FIX: Do NOT free data in the source - the bad sink frees data */
    }
     , {
        transfer newResource() data;      //malloc function
        /* FIX: Do NOT free data in the source - the bad sink frees data */
    };
    call globalReturnsTrueOrFalse(); @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    }
     , {
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

fn CWE415_Double_Free__malloc_free_int_12_good()-> #voidTy{
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
 //   srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_int_12_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_int_12_bad();
    call printLine(newResource(copy));
//#endif /* OMITBAD */
    val(newResource(copy))    // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
//#endif
