#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void printLine (const char * line)
{
    if(line != NULL) 
    {
        printf("%s\n", line);
    }
}
void CWE415_Double_Free__malloc_free_int_66b_badSink(int * dataArray[])
{
    int * data = dataArray[2];
    free(data);
}
void CWE415_Double_Free__malloc_free_int_66b_goodG2BSink(int * dataArray[])
{
    int * data = dataArray[2];
    free(data);
}
void CWE415_Double_Free__malloc_free_int_66b_goodB2GSink(int * dataArray[])
{
    int * data = dataArray[2];
    ; 
}
void CWE415_Double_Free__malloc_free_int_66_bad()
{
    int * data;
    int * dataArray[5];
    data = NULL;
    data = (int *)malloc(100*sizeof(int));
    free(data);
    dataArray[2] = data;
    CWE415_Double_Free__malloc_free_int_66b_badSink(dataArray);
}
static void goodG2B()
{
    int * data;
    int * dataArray[5];
    data = NULL;
    data = (int *)malloc(100*sizeof(int));
    dataArray[2] = data;
    CWE415_Double_Free__malloc_free_int_66b_goodG2BSink(dataArray);
}
static void goodB2G()
{
    int * data;
    int * dataArray[5];
    data = NULL;
    data = (int *)malloc(100*sizeof(int));
    free(data);
    dataArray[2] = data;
    CWE415_Double_Free__malloc_free_int_66b_goodB2GSink(dataArray);
}
void CWE415_Double_Free__malloc_free_int_66_good()
{
    goodG2B();
    goodB2G();
}
int main(int argc, char * argv[])
{
    printLine("Calling good()...");
    CWE415_Double_Free__malloc_free_int_66_good();
    printLine("Finished good()");
    printLine("Calling bad()...");
    CWE415_Double_Free__malloc_free_int_66_bad();
    printLine("Finished bad()");
    return 0;
}
