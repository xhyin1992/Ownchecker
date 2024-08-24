fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};

/* The static variable below is used to drive control flow in the sink function */
decl badStatic; transfer newResource(copy) badStatic;

fn badSink(data:#own()) -> #voidTy{
    badStatic; @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

fn CWE415_Double_Free__malloc_free_struct_21_bad() -> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    transfer newResource(copy) badStatic; /* true */
    call badSink(data);
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* The static variables below are used to drive control flow in the sink functions. */
decl goodB2G1Static; transfer newResource(copy) goodB2G1Static;
decl goodB2G2Static; transfer newResource(copy) goodB2G2Static;
decl goodG2BStatic; transfer newResource(copy) goodG2BStatic;

/* goodB2G1() - use badsource and goodsink by setting the static variable to false instead of true */
fn goodB2G1Sink(data:#own()) -> #voidTy{
    goodB2G1Static; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        call printLine(newResource(copy));
    }
     , {
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
    //    ; /* empty statement needed for some flow variants */
    };
};

fn goodB2G1() -> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    transfer newResource(copy) goodB2G1Static; /* false */
    call goodB2G1Sink(data);
};

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the if in the sink function */
fn goodB2G2Sink(data:#own()) -> #voidTy{
    goodB2G2Static; @{   //if statement
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
     //   ; /* empty statement needed for some flow variants */
    };
};

fn goodB2G2() -> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    transfer newResource(copy) goodB2G2Static; /* true */
    call goodB2G2Sink(data);
};

/* goodG2B() - use goodsource and badsink */
fn goodG2BSink(data:#own()) -> #voidTy{
    goodG2BStatic; @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

fn goodG2B() -> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* FIX: Do NOT free data in the source - the bad sink frees data */
    transfer newResource(copy) goodG2BStatic; /* true */
    call goodG2BSink(data);
};

fn CWE415_Double_Free__malloc_free_struct_21_good() -> #voidTy{
    call goodB2G1();
    call goodB2G2();
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
    call CWE415_Double_Free__malloc_free_struct_21_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_struct_21_bad();
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
