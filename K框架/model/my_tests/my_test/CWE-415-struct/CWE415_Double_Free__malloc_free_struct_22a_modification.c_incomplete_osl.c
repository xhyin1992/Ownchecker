fn printLine(line:#own())-> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};
/* The global variable below is used to drive control flow in the sink function */
decl CWE415_Double_Free__malloc_free_struct_22_badGlobal; transfer newResource(copy) CWE415_Double_Free__malloc_free_struct_22_badGlobal;
/* The global variables below are used to drive control flow in the sink functions. */
decl CWE415_Double_Free__malloc_free_struct_22_goodB2G1Global; transfer newResource(copy) CWE415_Double_Free__malloc_free_struct_22_goodB2G1Global;
decl CWE415_Double_Free__malloc_free_struct_22_goodB2G2Global; transfer newResource(copy) CWE415_Double_Free__malloc_free_struct_22_goodB2G2Global;
decl CWE415_Double_Free__malloc_free_struct_22_goodG2BGlobal; transfer newResource(copy) CWE415_Double_Free__malloc_free_struct_22_goodG2BGlobal;

fn CWE415_Double_Free__malloc_free_struct_22_badSink(data:#own())-> #voidTy{
    CWE415_Double_Free__malloc_free_struct_22_badGlobal; @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

/* goodB2G1() - use badsource and goodsink by setting the static variable to false instead of true */
fn CWE415_Double_Free__malloc_free_struct_22_goodB2G1Sink(data:#own())-> #voidTy{
    CWE415_Double_Free__malloc_free_struct_22_goodB2G1Global; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        call printLine(newResource(copy));
    }
     , {
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
     //  ; /* empty statement needed for some flow variants */
    };
};

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the if in the sink function */
fn CWE415_Double_Free__malloc_free_struct_22_goodB2G2Sink(data:#own())-> #voidTy{
    CWE415_Double_Free__malloc_free_struct_22_goodB2G2Global; @{   //if statement
        /* do nothing */
        /* FIX: Don't attempt to free the memory */
      //  ; /* empty statement needed for some flow variants */
    };
};

/* goodG2B() - use goodsource and badsink */
fn CWE415_Double_Free__malloc_free_struct_22_goodG2BSink(data:#own())-> #voidTy{
    CWE415_Double_Free__malloc_free_struct_22_goodG2BGlobal; @{   //if statement
        /* POTENTIAL FLAW: Possibly freeing memory twice */
        deallocate data;      // free function
    };
};

fn CWE415_Double_Free__malloc_free_struct_22_bad() -> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    transfer newResource(copy) CWE415_Double_Free__malloc_free_struct_22_badGlobal; /* true */
    call CWE415_Double_Free__malloc_free_struct_22_badSink(data);
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD
fn goodB2G1()-> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;     // free function
    transfer newResource(copy) CWE415_Double_Free__malloc_free_struct_22_goodB2G1Global; /* false */
    call CWE415_Double_Free__malloc_free_struct_22_goodB2G1Sink(data);
};

fn goodB2G2()-> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    transfer newResource(copy) CWE415_Double_Free__malloc_free_struct_22_goodB2G2Global; /* true */
    call CWE415_Double_Free__malloc_free_struct_22_goodB2G2Sink(data);
};

fn goodG2B() -> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* FIX: Do NOT free data in the source - the bad sink frees data */
    transfer newResource(copy) CWE415_Double_Free__malloc_free_struct_22_goodG2BGlobal; /* true */
    call CWE415_Double_Free__malloc_free_struct_22_goodG2BSink(data);
};

fn CWE415_Double_Free__malloc_free_struct_22_good()-> #voidTy{
    call goodB2G1();
    call goodB2G2();
    call goodG2B();
};

//#endif /* OMITGOOD */

/* Below is the main(). It is only used when building this testcase on
   its own for testing or for building a binary to use in testing binary
   analysis tools. It is not used when compiling all the testcases as one
   application, which is how source code analysis tools are tested. */

//#ifdef INCLUDEMAIN

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    /* seed randomness */
//    srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_struct_22_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_struct_22_bad();
    call printLine(newResource(copy));
//#endif /* OMITBAD */
    val(newResource(copy))   // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
//#endif
