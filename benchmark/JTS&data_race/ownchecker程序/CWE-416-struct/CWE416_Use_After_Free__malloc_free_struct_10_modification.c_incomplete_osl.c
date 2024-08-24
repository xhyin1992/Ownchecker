/* The variables below are not defined as "const", but are never
   assigned any other value, so a tool should be able to identify that
   reads of these will always return their initialized values. */
decl globalTrue; transfer newResource(copy) globalTrue; /* true */
decl globalFalse; transfer newResource(copy) globalFalse; /* false */


fn printLine(line:#own()) -> #voidTy {
    line; @{   //if statement
        line;   //printf arguments
    },{
    };
};

fn printStructLine(structTwoIntsStruct:#own()) -> #voidTy{
    structTwoIntsStruct;structTwoIntsStruct;   //printf arguments
};
fn CWE416_Use_After_Free__malloc_free_struct_10_bad() -> #voidTy{
    decl data;
    transfer #uninit data;
    globalTrue; @{   //if statement
        transfer newResource() data;      //malloc function
        {
            decl i;
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;
                transfer newResource() data;
            i; transfer newResource(copy) i;
            };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
    },{};
    globalTrue; @{   //if statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        call printStructLine(data);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    },{};
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G1() - use badsource and goodsink by changing the second globalTrue to globalFalse */
fn goodB2G1() -> #voidTy{
    decl data;
    transfer #uninit data;
    globalTrue; @{   //if statement
        transfer newResource() data;      //malloc function
        {
            decl i;
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;
                transfer newResource() data;
            i; transfer newResource(copy) i;
            };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
    },{};
    globalFalse; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        call printLine(newResource(copy));
    }
     , {
        /* FIX: Don't use data that may have been freed already */
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        /* do nothing */
    //    ; /* empty statement needed for some flow variants */
    };
};

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the second if */
fn goodB2G2() -> #voidTy{
    decl data;
    transfer #uninit data;
    globalTrue; @{   //if statement
        transfer newResource() data;      //malloc function
        {
            decl i;
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;
                transfer newResource() data;
            i; transfer newResource(copy) i;
           };
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        deallocate data;      // free function
    },{};
    globalTrue; @{   //if statement
        /* FIX: Don't use data that may have been freed already */
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
        /* do nothing */
    //    ; /* empty statement needed for some flow variants */
    },{};
};

/* goodG2B1() - use goodsource and badsink by changing the first globalTrue to globalFalse */
fn goodG2B1() -> #voidTy{
    decl data;
    transfer #uninit data;
    globalFalse; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        call printLine(newResource(copy));
    }
     , {
        transfer newResource() data;      //malloc function
        {
            decl i;
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;
                transfer newResource() data;
            i; transfer newResource(copy) i;
            };
        }
        /* FIX: Do not free data in the source */
    };
    globalTrue; @{   //if statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        call printStructLine(data);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    },{};
};

/* goodG2B2() - use goodsource and badsink by reversing the blocks in the first if */
fn goodG2B2() -> #voidTy{
    decl data;
    transfer #uninit data;
    globalTrue; @{   //if statement
        transfer newResource() data;      //malloc function
        {
            decl i;
            transfer newResource(copy) i;
i; !{   //for statement
                transfer newResource() data;
                transfer newResource() data;
            i; transfer newResource(copy) i;
            };
        }
        /* FIX: Do not free data in the source */
    },{};
    globalTrue; @{   //if statement
        /* POTENTIAL FLAW: Use of data that may have been freed */
        call printStructLine(data);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    },{};
};

fn CWE416_Use_After_Free__malloc_free_struct_10_good() -> #voidTy{
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
    call printLine(newResource(copy));
    call CWE416_Use_After_Free__malloc_free_struct_10_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE416_Use_After_Free__malloc_free_struct_10_bad();
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
