fn printLine(line:#own()) -> #voidTy {
    line; @{   //if statement
        line;   //printf arguments
    },{
    };
};

fn helperBad(aString:#own()) -> #own(){
    decl i; transfer newResource(copy) i;
    decl j;
    decl reversedString; transfer #uninit reversedString;
    aString; @{   //if statement
        aString; transfer newResource(copy) i;
        transfer newResource() reversedString;      //malloc function
        transfer newResource(copy) j;
j; i; !{   //for statement
            transfer aString reversedString;
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

fn helperGood(aString:#own()) -> #own(){
    decl i; transfer newResource(copy) i;
    decl j;
    decl reversedString; transfer #uninit reversedString;
    aString; @{   //if statement
        aString; transfer newResource(copy) i;
        transfer newResource() reversedString;      //malloc function
        transfer newResource(copy) j;
j; i; !{   //for statement
            transfer aString reversedString;
        j; transfer newResource(copy) j;
        };
        transfer newResource() reversedString;      // array element assignment
        /* FIX: Do not free the memory before returning */
        reversedString; val(newResource())     // return value
    }
     , {
        
    };
};

//#ifndef OMITBAD

fn CWE416_Use_After_Free__return_freed_ptr_16_bad() -> #voidTy{
    ! {   //while statement
        {
            /* Call the bad helper function */
            decl reversedString; 
            decl aString;
            transfer newResource() aString;
            call helperBad(newResource()); 
            //transfer newResource() reversedString;
            call printLine(reversedString);
            /* free(reversedString);
             * This call to free() was removed because we want the tool to detect the use after free,
             * but we don't want that function to be free(). Essentially we want to avoid a double free
             */
        }
        
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* good1() uses the GoodSinkBody in the while loop */
fn good1() -> #voidTy{
   ! {   //while statement
        {
            /* Call the good helper function */
            decl reversedString; 
            decl aString;
            transfer newResource() aString;
            call helperGood(newResource());  
            transfer newResource() reversedString;
            call printLine(reversedString);
            /* free(reversedString);
             * This call to free() was removed because we want the tool to detect the use after free,
             * but we don't want that function to be free(). Essentially we want to avoid a double free
             */
        }
        
    };
};

fn CWE416_Use_After_Free__return_freed_ptr_16_good() -> #voidTy{
    call good1();
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
    call CWE416_Use_After_Free__return_freed_ptr_16_good();
    call printLine(newResource(copy));
//#endif /* OMITGOOD */
//#ifndef OMITBAD
    call printLine(newResource(copy));
    call CWE416_Use_After_Free__return_freed_ptr_16_bad();
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
