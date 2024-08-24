fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};

fn printStructLine(structTwoIntsStruct:#own()) -> #voidTy{
    structTwoIntsStruct;structTwoIntsStruct;   //printf arguments
};

fn CWE416_Use_After_Free__malloc_free_struct_01_bad() -> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    {
        decl i;
        transfer newResource(copy) i;
//i; !{   //for statement
            transfer newResource() data;
            transfer newResource() data;
       // i; transfer i newResource(copy);
      //  };
    }
    /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
    deallocate data;      // free function
    /* POTENTIAL FLAW: Use of data that may have been freed */
    call printStructLine(data);
    /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
};

/* goodG2B uses the GoodSource with the BadSink */
fn goodG2B() -> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    {
        decl i;
        transfer newResource(copy) i;
//i; !{   //for statement
            transfer newResource() data;
            transfer newResource() data;
       // i; transfer i newResource(copy);
      //  };
    }
    /* FIX: Do not free data in the source */
    /* POTENTIAL FLAW: Use of data that may have been freed */
    call printStructLine(data);
    /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
};

/* goodB2G uses the BadSource with the GoodSink */
fn goodB2G() -> #voidTy{
    decl data;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    {
        decl i;
        transfer newResource(copy) i;
//i; !{   //for statement
            transfer newResource() data;
            transfer newResource() data;
       // i; transfer i newResource(copy);
       // };
    }
    /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
    deallocate data;      // free function
    /* FIX: Don't use data that may have been freed already */
    /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    /* do nothing */
//    ; /* empty statement needed for some flow variants */
};

fn CWE416_Use_After_Free__malloc_free_struct_01_good() -> #voidTy{
    call goodG2B();
    call goodB2G();
};

/* Below is the main(). It is only used when building this testcase on
   its #own for testing or for building a binary to use in testing binary
   analysis tools. It is not used when compiling all the testcases as one
   application, which is how source code analysis tools are tested. */

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    call printLine(newResource(copy));
    call CWE416_Use_After_Free__malloc_free_struct_01_good();
    call printLine(newResource(copy));
    call printLine(newResource(copy));
    call CWE416_Use_After_Free__malloc_free_struct_01_bad();
    call printLine(newResource(copy));
    val(newResource(copy))    // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
