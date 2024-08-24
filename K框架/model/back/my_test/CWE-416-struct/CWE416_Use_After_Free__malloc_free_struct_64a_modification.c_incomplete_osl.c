/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE416_Use_After_Free__malloc_free_struct_64a.c
Label Definition File: CWE416_Use_After_Free__malloc_free.label.xml
Template File: sources-sinks-64a.tmpl.c
*/
/*
 * @description
 * CWE: 416 Use After Free
 * BadSource:  Allocate data using malloc(), initialize memory block, and Deallocate data using free()
 * GoodSource: Allocate data using malloc() and initialize memory block
 * Sinks:
 *    GoodSink: Do nothing
 *    BadSink : Use data
 * Flow Variant: 64 Data flow: void pointer to data passed from one function to another in different source files
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>

//#ifndef OMITBAD
//#include <time.h>


fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};

fn printStructLine(structTwoIntsStruct:#own()) -> #voidTy{
    structTwoIntsStruct;structTwoIntsStruct;   //printf arguments
};
/* bad function declaration */
fn CWE416_Use_After_Free__malloc_free_struct_64b_badSink(dataVoidPtr:#own()) -> #voidTy{
    /* cast void pointer to a pointer of the appropriate type */
    decl dataPtr; transfer dataVoidPtr dataPtr;
    /* dereference dataPtr into data */
    decl data; transfer *dataPtr *data;
    /* POTENTIAL FLAW: Use of data that may have been freed */
    decl structTwoIntsStruct;
    structTwoIntsStruct borrow data;
    call printStructLine(structTwoIntsStruct);
    /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
};

/* goodG2B uses the GoodSource with the BadSink */
fn CWE416_Use_After_Free__malloc_free_struct_64b_goodG2BSink(dataVoidPtr:#own()) -> #voidTy{
    /* cast void pointer to a pointer of the appropriate type */
    decl dataPtr; transfer dataVoidPtr dataPtr;
    /* dereference dataPtr into data */
    decl data; transfer *dataPtr *data;
    /* POTENTIAL FLAW: Use of data that may have been freed */
    decl structTwoIntsStruct;
    structTwoIntsStruct borrow data;
    call printStructLine(structTwoIntsStruct);
    /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
};

/* goodB2G uses the BadSource with the GoodSink */
fn CWE416_Use_After_Free__malloc_free_struct_64b_goodB2GSink(dataVoidPtr:#own()) -> #voidTy{
    /* cast void pointer to a pointer of the appropriate type */
    decl dataPtr; transfer dataVoidPtr dataPtr;
    /* dereference dataPtr into data */
    decl data; transfer *dataPtr *data;
    /* FIX: Don't use data that may have been freed already */
    /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    /* do nothing */
//    ; /* empty statement needed for some flow variants */
};

fn CWE416_Use_After_Free__malloc_free_struct_64_bad() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    transfer newResource() data;      //malloc function
    {
        decl i:#own(copy);
        transfer newResource(copy) i;
i; !{   //for statement
            transfer newResource() date;
            transfer newResource() date;
        i; transfer i newResource(copy);
        };
    }
    /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
    deallocate data;      // free function
    decl dataVoidPtr;
    dataVoidPtr borrow data;
    call CWE416_Use_After_Free__malloc_free_struct_64b_badSink(dataVoidPtr);
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

fn goodG2B() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    transfer newResource() data;      //malloc function
    {
        decl i:#own(copy);
        transfer newResource(copy) i;
i; !{   //for statement
            transfer newResource() date;
            transfer newResource() date;
        i; transfer i newResource(copy);
        };
    }
    /* FIX: Do not free data in the source */
    decl dataVoidPtr;
    dataVoidPtr borrow data;
    call CWE416_Use_After_Free__malloc_free_struct_64b_goodG2BSink(dataVoidPtr);
};


fn goodB2G() -> #voidTy{
    decl data;
    /* Initialize data */
    transfer bot data;
    transfer newResource() data;      //malloc function
    {
        decl i:#own(copy);
        transfer newResource(copy) i;
i; !{   //for statement
            transfer newResource() date;
            transfer newResource() date;
        i; transfer i newResource(copy);
        };
    }
    /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
    deallocate data;      // free function
    decl dataVoidPtr;
    dataVoidPtr borrow data;
    call CWE416_Use_After_Free__malloc_free_struct_64b_goodB2GSink(dataVoidPtr);
};

fn CWE416_Use_After_Free__malloc_free_struct_64_good() -> #voidTy{
    call goodG2B();
    call goodB2G();
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
//    call printLine("Calling good()...");
    call CWE416_Use_After_Free__malloc_free_struct_64_good();
//    call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
//    call printLine("Calling bad()...");
    call CWE416_Use_After_Free__malloc_free_struct_64_bad();
//    call printLine("Finished bad()");
//#endif /* OMITBAD */
    val(newResource(copy))    // return value
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
//#endif
