/*
 * @description
 * Flow Variant: 04 Control flow: if(STATIC_CONST_TRUE) and if(STATIC_CONST_FALSE)
 *
 * */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

static const int STATIC_CONST_TRUE = 1; /* true */
 
void *increse_num(int *i) {
      *i = 1;
}

void data_race_muiltithreading_04_bad()
{
    if(STATIC_CONST_TRUE)
    {
       int sharedi = 0;
       int ret1;
       int ret2;
       pthread_t thrd1;
       pthread_t thrd2;

       ret1 = pthread_create(&thrd1, NULL, (void *)increse_num, &sharedi);
       ret2 = pthread_create(&thrd2, NULL, (void *)increse_num, &sharedi);

       printf("sharedi = %d\n", sharedi);
       pthread_join(thrd1, NULL);
       pthread_join(thrd2, NULL);
    }else{
      ;
    }
}


int main(int argc, char * argv[])
{

    data_race_muiltithreading_04_bad();
    return 0;
}


