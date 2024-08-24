/*
 * @description
 * Flow Variant: 03 Control flow: if(5==5) and if(5!=5)
 *
 * */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>


void *increse_num(int *i) {
      *i = 1;
}

void data_race_muiltithreading_03_bad()
{
    if(5==5)
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

    data_race_muiltithreading_03_bad();
    return 0;
}


