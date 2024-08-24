/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE415_Double_Free__malloc_free_int_61a.c
Label Definition File: CWE415_Double_Free__malloc_free.label.xml
Template File: sources-sinks-61a.tmpl.c
*/
/*
 * @description
 * CWE: 415 Double Free
 * BadSource:  Allocate data using malloc() and Deallocate data using free()
 * GoodSource: Allocate data using malloc()
 * Sinks:
 *    GoodSink: do nothing
 *    BadSink : Deallocate data using free()
 * Flow Variant: 61 Data flow: data returned from one function to another in different source files
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>

#ifndef OMITBAD
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void printLine (const char * line)
{
    if(line != NULL) 
    {
        printf("%s\n", line);
    }
}
/* bad function declaration */
int * CWE415_Double_Free__malloc_free_int_61b_badSource(int * data)
{
    data = (int *)malloc(100*sizeof(int));
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    free(data);
    return data;
}

/* goodG2B() uses the GoodSource with the BadSink */
int * CWE415_Double_Free__malloc_free_int_61b_goodG2BSource(int * data)
{
    data = (int *)malloc(100*sizeof(int));
    /* FIX: Do NOT free data in the source - the bad sink frees data */
    return data;
}

/* goodB2G() uses the BadSource with the GoodSink */
int * CWE415_Double_Free__malloc_free_int_61b_goodB2GSource(int * data)
{
    data = (int *)malloc(100*sizeof(int));
    /* POTENTIAL FLAW: Free data in the source - the bad sink frees data as well */
    free(data);
    return data;
}

void CWE415_Double_Free__malloc_free_int_61_bad()
{
    int * data;
    /* Initialize data */
    data = NULL;
    data = CWE415_Double_Free__malloc_free_int_61b_badSource(data);
    /* POTENTIAL FLAW: Possibly freeing memory twice */
    free(data);
}

#endif /* OMITBAD */

#ifndef OMITGOOD
static void goodG2B()
{
    int * data;
    /* Initialize data */
    data = NULL;
    data = CWE415_Double_Free__malloc_free_int_61b_goodG2BSource(data);
    /* POTENTIAL FLAW: Possibly freeing memory twice */
    free(data);
}

static void goodB2G()
{
    int * data;
    /* Initialize data */
    data = NULL;
    data = CWE415_Double_Free__malloc_free_int_61b_goodB2GSource(data);
    /* do nothing */
    /* FIX: Don't attempt to free the memory */
    ; /* empty statement needed for some flow variants */
}

void CWE415_Double_Free__malloc_free_int_61_good()
{
    goodG2B();
    goodB2G();
}

#endif /* OMITGOOD */

/* Below is the main(). It is only used when building this testcase on
   its own for testing or for building a binary to use in testing binary
   analysis tools. It is not used when compiling all the testcases as one
   application, which is how source code analysis tools are tested. */

#ifdef INCLUDEMAIN

int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );
#ifndef OMITGOOD
    printLine("Calling good()...");
    CWE415_Double_Free__malloc_free_int_61_good();
    printLine("Finished good()");
#endif /* OMITGOOD */
#ifndef OMITBAD
    printLine("Calling bad()...");
    CWE415_Double_Free__malloc_free_int_61_bad();
    printLine("Finished bad()");
#endif /* OMITBAD */
    return 0;
}

#endif
