fn printLine(line:#own()) -> #voidTy {
    line; @{   //if statement
        line;   //printf arguments
    },{
    };
};

fn helperBad(aString1:#own()) -> #own(){
    decl i; transfer newResource(copy) i;
    decl j;
    decl reversedString; transfer #uninit reversedString;
    aString1; @{   //if statement
        aString1; transfer newResource(copy) i;
        transfer newResource() reversedString;      //malloc function
        transfer newResource(copy) j;
j; i; !{   //for statement
            transfer aString1 reversedString;
        j; transfer newResource(copy) j;
        };
        transfer newResource() reversedString;      // array element assignment
        /* FLAW: Freeing a memory block and then returning a pointer to the freed memory */
        deallocate reversedString;      // free function
        reversedString; val(newResource())     // return value
    }
     , {
        
    };
};

fn helperGood(aString1:#own()) -> #own(){
    decl i; transfer newResource(copy) i;
    decl j;
    decl reversedString; transfer #uninit reversedString;
    aString1; @{   //if statement
        aString1; transfer newResource(copy) i;
        transfer newResource() reversedString;      //malloc function
        transfer newResource(copy) j;
j; i; !{   //for statement
            transfer aString1 reversedString;
        j; transfer newResource(copy) j;
        };
        transfer newResource() reversedString;      // array element assignment
        /* FIX: Do not free the memory before returning */
        reversedString; val(newResource())     // return value
    }
     , {
        
    };
};

/* The two function below always return the same value, so a tool
   should be able to identify that calls to the functions will always
   return a fixed value. */
fn staticReturnsTrue() -> #own(copy){
    val(newResource(copy))    // return value
};

fn staticReturnsFalse() -> #own(copy){
    val(newResource(copy))    // return value
};

//#ifndef OMITBAD

fn CWE416_Use_After_Free__return_freed_ptr_08_bad() -> #voidTy{
    call staticReturnsTrue(); @{   //if statement
        {
            /* Call the bad helper function */
            decl reversedString; 
            decl aString;
            transfer newResource() aString;
            call helperBad(aString);
            //transfer newResource() reversedstring;
            call printLine(reversedString);
            /* free(reversedString);
             * This call to free() was removed because we want the tool to detect the use after free,
             * but we don't want that function to be free(). Essentially we want to avoid a double free
             */
        }
    },{};
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* good1() uses if(staticReturnsFalse()) instead of if(staticReturnsTrue()) */
fn good1() -> #voidTy{
    call staticReturnsFalse(); @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        call printLine(newResource(copy));
    }
     , {
        {
            /* Call the good helper function */
            decl reversedString; 
            decl aString;
            transfer newResource() aString;
            call helperGood(aString);
            transfer newResource() reversedString;
            call printLine(reversedString);
            /* free(reversedString);
             * This call to free() was removed because we want the tool to detect the use after free,
             * but we don't want that function to be free(). Essentially we want to avoid a double free
             */
        }
    };
};

/* good2() reverses the bodies in the if statement */
fn good2() -> #voidTy{
    call staticReturnsTrue(); @{   //if statement
        {
            /* Call the good helper function */
            decl reversedString;  
            decl aString;
            transfer newResource() aString;
            call helperGood(aString);
            transfer newResource() reversedString;
            call printLine(reversedString);
            /* free(reversedString);
             * This call to free() was removed because we want the tool to detect the use after free,
             * but we don't want that function to be free(). Essentially we want to avoid a double free
             */
        }
    },{};
};

fn CWE416_Use_After_Free__return_freed_ptr_08_good() -> #voidTy{
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
    call printLine(newResource(copy));
    call CWE416_Use_After_Free__return_freed_ptr_08_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE416_Use_After_Free__return_freed_ptr_08_bad();
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
