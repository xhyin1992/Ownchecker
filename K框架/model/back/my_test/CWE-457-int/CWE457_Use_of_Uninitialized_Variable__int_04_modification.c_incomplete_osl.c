/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE457_Use_of_Uninitialized_Variable__int_04.c
Label Definition File: CWE457_Use_of_Uninitialized_Variable.c.label.xml
Template File: sources-sinks-04.tmpl.c
*/
/*
 * @description
 * CWE: 457 Use of Uninitialized Variable
 * BadSource: no_init Don't initialize data
 * GoodSource: Initialize data
 * Sinks: use
 *    GoodSink: Initialize then use data
 *    BadSink : Use data
 * Flow Variant: 04 Control flow: if(STATIC_CONST_TRUE) and if(STATIC_CONST_FALSE)
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>
//#include <time.h>
fn printLine(line:#own()) -> #voidTy{
    line; @{   //if statement
        line;   //printf arguments
    };
};
fn printIntLine(intNumber:#own(copy)) -> #voidTy{
    intNumber;   //printf arguments
};
/* The two variables below are declared "const", so a tool should
   be able to identify that reads of these will always return their
   initialized values. */
decl STATIC_CONST_TRUE:#own(copy); transfer newResource(copy) STATIC_CONST_TRUE; /* true */
decl STATIC_CONST_FALSE:#own(copy); transfer newResource(copy) STATIC_CONST_FALSE; /* false */

//#ifndef OMITBAD

fn CWE457_Use_of_Uninitialized_Variable__int_04_bad() -> #voidTy{
    decl data:#own(copy);
    STATIC_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Don't initialize data */
    //    ; /* empty statement needed for some flow variants */
    };
    STATIC_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
    };
};

//#endif /* OMITBAD */

//#ifndef OMITGOOD

/* goodB2G1() - use badsource and goodsink by changing the second STATIC_CONST_TRUE to STATIC_CONST_FALSE */
fn goodB2G1() -> #voidTy{
    decl data:#own(copy);
    STATIC_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Don't initialize data */
    //    ; /* empty statement needed for some flow variants */
    };
    STATIC_CONST_FALSE; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
    //    call printLine("Benign, fixed string");
    }
     , {
        /* FIX: Ensure data is initialized before use */
        transfer newResource(copy) data;
        call printIntLine(data);
    };
};

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the second if */
fn goodB2G2() -> #voidTy{
    decl data:#own(copy);
    STATIC_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Don't initialize data */
     //   ; /* empty statement needed for some flow variants */
    };
    STATIC_CONST_TRUE; @{   //if statement
        /* FIX: Ensure data is initialized before use */
        transfer newResource(copy) data;
        call printIntLine(data);
    };
};

/* goodG2B1() - use goodsource and badsink by changing the first STATIC_CONST_TRUE to STATIC_CONST_FALSE */
fn goodG2B1() -> #voidTy{
    decl data:#own(copy);
    STATIC_CONST_FALSE; @{   //if statement
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
    //    call printLine("Benign, fixed string");
    }
     , {
        /* FIX: Initialize data */
        transfer newResource(copy) data;
    };
    STATIC_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
    };
};

/* goodG2B2() - use goodsource and badsink by reversing the blocks in the first if */
fn goodG2B2() -> #voidTy{
    decl data:#own(copy);
    STATIC_CONST_TRUE; @{   //if statement
        /* FIX: Initialize data */
        transfer newResource(copy) data;
    };
    STATIC_CONST_TRUE; @{   //if statement
        /* POTENTIAL FLAW: Use data without initializing it */
        call printIntLine(data);
    };
};

fn CWE457_Use_of_Uninitialized_Variable__int_04_good() -> #voidTy{
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
    ////srand( (unsigned)time(NULL) );
//#ifndef OMITGOOD
//    call printLine("Calling good()...");
    call CWE457_Use_of_Uninitialized_Variable__int_04_good();
//    call printLine("Finished good()");
//#endif /* OMITGOOD */
//#ifndef OMITBAD
//    call printLine("Calling bad()...");
    call CWE457_Use_of_Uninitialized_Variable__int_04_bad();
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
