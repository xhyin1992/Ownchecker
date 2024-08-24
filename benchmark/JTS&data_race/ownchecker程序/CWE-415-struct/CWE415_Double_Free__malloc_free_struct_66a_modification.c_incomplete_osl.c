fn printLine(line:#own()) -> #voidTy {
    line; @{   //if statement
        line;   //printf arguments
    },{
    };
};
/* bad function declaration */
fn CWE415_Double_Free__malloc_free_struct_66b_badSink(dataArray:#own()) -> #voidTy{
    /* copy data out of dataArray */
    decl data; transfer dataArray data;
    /* POTENTIAL FLAW: Possibly freeing memory twice */
    deallocate data;      // free function
};

/* goodG2B uses the GoodSource with the BadSink */
fn CWE415_Double_Free__malloc_free_struct_66b_goodG2BSink(dataArray:#own()) -> #voidTy{
    decl data; transfer dataArray data;
    /* POTENTIAL FLAW: Possibly freeing memory twice */
    deallocate data;      // free function
};

/* goodB2G uses the BadSource with the GoodSink */
fn CWE415_Double_Free__malloc_free_struct_66b_goodB2GSink(dataArray:#own()) -> #voidTy{
    decl data; transfer dataArray data;
    /* do nothing */
    /* FIX: Don't attempt to free the memory */
//    ; /* empty statement needed for some flow variants */
};

fn CWE415_Double_Free__malloc_free_struct_66_bad() -> #voidTy{
    decl data;
    decl dataArray;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    /* put data in array */
    transfer data dataArray;     // array element assignment
    call CWE415_Double_Free__malloc_free_struct_66b_badSink(dataArray);
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

fn goodG2B() -> #voidTy{
    decl data;
    decl dataArray;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* FIX: Do NOT free data in the source - the bad sink frees data */
    transfer data dataArray;     // array element assignment
    call CWE415_Double_Free__malloc_free_struct_66b_goodG2BSink(dataArray);
};

fn goodB2G() -> #voidTy{
    decl data;
    decl dataArray;
    transfer #uninit data;
    transfer newResource() data;      //malloc function
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    deallocate data;      // free function
    transfer data dataArray;     // array element assignment
    call CWE415_Double_Free__malloc_free_struct_66b_goodB2GSink(dataArray);
};

fn CWE415_Double_Free__malloc_free_struct_66_good() -> #voidTy{
    call goodG2B();
    call goodB2G();
};

//#endif /* OMITGOOD */

/* Below is the main(). It is only used when building this testcase on
   its #own for testing or for building a binary to use in testing binary
   analysis tools. It is not used when compiling all the testcases as one
   application, which is how source code analysis tools are tested. */

//#ifdef INCLUDEMAIN

fn main(argc:#own(copy), argv:#own()) -> #own(copy) {
    /* seed randomness */
//    srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_struct_66_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE415_Double_Free__malloc_free_struct_66_bad();
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
