/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE416_Use_After_Free__return_freed_ptr_03.c
Label Definition File: CWE416_Use_After_Free__return_freed_ptr.label.xml
Template File: point-flaw-03.tmpl.c
*/
/*
 * @description
 * CWE: 416 Use After Free
 * Sinks:
 *    GoodSink: Use a block of memory returned from a function
 *    BadSink : Use a block of memory returned from a function after it has been freed
 * Flow Variant: 03 Control flow: if(5==5) and if(5!=5)
 *
 * */

//#include "std_testcase.h"
//#include <time.h>

fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};
fn helperBad(aString:#own()) -> #own(){
    decl i:#own(copy); transfer newResource(copy) i;
    decl j:#own(copy);
    decl reversedString; transfer bot reversedString;
    aString; @{   //if statement
        call strlen(aString); transfer newResource(copy) i;
        transfer newResource() reversEdstring;      //malloc function
        transfer newResource(copy) j;
j; i; !{   //for statement
            transfer aString reversedString;
        j; transfer j newResource(copy);
        };
        transfer newResource() reversedString;      // array element assignment
        /* FLAW: Freeing a memory block and then returning a pointer to the freed memory */
        deallocate reversedString;      // free function
        reversedString; val(newResource())     // return value
    }
     , {
        
    };
};

fn helperGood(aString:#own()) -> #own(){
    decl i:#own(copy); transfer newResource(copy) i;
    decl j:#own(copy);
    decl reversedString; transfer bot reversedString;
    aString; @{   //if statement
        call strlen(aString); transfer newResource(copy) i;
        transfer newResource() reversedstring;      //malloc function
        transfer newResource(copy) j;
j; i; !{   //for statement
            transfer aString reversedString;
        j; transfer j newResource(copy);
        };
        transfer newResource() reversedString;      // array element assignment
        /* FIX: Do not free the memory before returning */
        reversedString; val(newResource())     // return value
    }
     , {
        
    };
};

//#ifndef OMITBAD

fn CWE416_Use_After_Free__return_freed_ptr_03_bad() -> #voidTy{
    @{   //if statement
        {
            /* Call the bad helper function */
            decl reversedString; 
            //call helperBad("BadSink"); 
            decl aString;
            transfer newResource() aString;
            call helperBad(aString);
            transfer newResource() reversedstring;
            call printline(reversedString);
            /* free(reversedString);
             * This call to free() was removed because we want the tool to detect the use after free,
             * but we don't want that function to be free(). Essentially we want to avoid a double free
             */
        }
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* good1() uses if(5!=5) instead of if(5==5) */
fn good1() -> #voidTy{
    @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        //call priNtline("Benign, fixed string");
    }
     , {
        {
            /* Call the good helper function */
            decl reversedString; 
            //call helperGood("GoodSink"); 
            decl aString;
            transfer newResource() aString;
            call helperGood(aString);
            transfer newResource() reversedstring;
            call printline(reversedString);
            /* free(reversedString);
             * This call to free() was removed because we want the tool to detect the use after free,
             * but we don't want that function to be free(). Essentially we want to avoid a double free
             */
        }
    };
};

/* good2() reverses the bodies in the if statement */
fn good2() -> #voidTy{
    @{   //if statement
        {
            /* Call the good helper function */
            decl reversedString; 
            //call helperGood("GoodSink"); 
            decl aString;
            transfer newResource() aString;
            call helperGood(aString);
            transfer newResource() reversedstring;
            call printline(reversedString);
            /* free(reversedString);
             * This call to free() was removed because we want the tool to detect the use after free,
             * but we don't want that function to be free(). Essentially we want to avoid a double free
             */
        }
    };
};

fn CWE416_Use_After_Free__return_freed_ptr_03_good() -> #voidTy{
    call good1();
    call good2();
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
    call CWE416_Use_After_Free__return_freed_ptr_03_good();
    //call priNtline("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    //call priNtline("Calling bad()...");
    call CWE416_Use_After_Free__return_freed_ptr_03_bad();
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
