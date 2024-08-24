/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE457_Use_of_Uninitialized_Variable__struct_pointer_64a.c
Label Definition File: CWE457_Use_of_Uninitialized_Variable.c.label.xml
Template File: sources-sinks-64a.tmpl.c
*/
/*
 * @description
 * CWE: 457 Use of Uninitialized Variable
 * BadSource: no_init Don't initialize data
 * GoodSource: Initialize data
 * Sinks: use
 *    GoodSink: Initialize then use data
 *    BadSink : Use data
 * Flow Variant: 64 Data flow: void pointer to data passed from one function to another in different source files
 *
 * */

//#include "std_testcase.h"

//#include <wchar.h>

#ifndef OMITBAD
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/* struct used in some test cases as a custom type */
typedef struct _twoIntsStruct
{
    int intOne;
    int intTwo;
} twoIntsStruct;

void printLine (const char * line)
{
    if(line != NULL) 
    {
        printf("%s\n", line);
    }
}
void printIntLine (int intNumber)
{
    printf("%d\n", intNumber);
}

void CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_badSink(void * dataVoidPtr)
{
    /* cast void pointer to a pointer of the appropriate type */
    twoIntsStruct * * dataPtr = (twoIntsStruct * *)dataVoidPtr;
    /* dereference dataPtr into data */
    twoIntsStruct * data = (*dataPtr);
    /* POTENTIAL FLAW: Use data without initializing it */
    printIntLine(data->intOne);
    printIntLine(data->intTwo);
}

/* goodG2B uses the GoodSource with the BadSink */
void CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_goodG2BSink(void * dataVoidPtr)
{
    /* cast void pointer to a pointer of the appropriate type */
    twoIntsStruct * * dataPtr = (twoIntsStruct * *)dataVoidPtr;
    /* dereference dataPtr into data */
    twoIntsStruct * data = (*dataPtr);
    /* POTENTIAL FLAW: Use data without initializing it */
    printIntLine(data->intOne);
    printIntLine(data->intTwo);
}

/* goodB2G uses the BadSource with the GoodSink */
void CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_goodB2GSink(void * dataVoidPtr)
{
    /* cast void pointer to a pointer of the appropriate type */
    twoIntsStruct * * dataPtr = (twoIntsStruct * *)dataVoidPtr;
    /* dereference dataPtr into data */
    twoIntsStruct * data = (*dataPtr);
    /* FIX: Ensure data is initialized before use */
    /* initialize both the pointer and the data pointed to */
    data = (twoIntsStruct *)malloc(sizeof(twoIntsStruct));
    data->intOne = 5;
    data->intTwo = 6;
    printIntLine(data->intOne);
    printIntLine(data->intTwo);
}

void CWE457_Use_of_Uninitialized_Variable__struct_pointer_64_bad()
{
    twoIntsStruct * data;
    /* POTENTIAL FLAW: Don't initialize data */
    ; /* empty statement needed for some flow variants */
    CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_badSink(&data);
}

#endif /* OMITBAD */

#ifndef OMITGOOD
static void goodG2B()
{
    twoIntsStruct * data;
    /* FIX: Initialize data */
    /* initialize both the pointer and the data pointed to */
    data = (twoIntsStruct *)malloc(sizeof(twoIntsStruct));
    data->intOne = 5;
    data->intTwo = 6;
    CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_goodG2BSink(&data);
}

static void goodB2G()
{
    twoIntsStruct * data;
    /* POTENTIAL FLAW: Don't initialize data */
    ; /* empty statement needed for some flow variants */
    CWE457_Use_of_Uninitialized_Variable__struct_pointer_64b_goodB2GSink(&data);
}

void CWE457_Use_of_Uninitialized_Variable__struct_pointer_64_good()
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
    CWE457_Use_of_Uninitialized_Variable__struct_pointer_64_good();
    printLine("Finished good()");
#endif /* OMITGOOD */
#ifndef OMITBAD
    printLine("Calling bad()...");
    CWE457_Use_of_Uninitialized_Variable__struct_pointer_64_bad();
    printLine("Finished bad()");
#endif /* OMITBAD */
    return 0;
}

#endif
