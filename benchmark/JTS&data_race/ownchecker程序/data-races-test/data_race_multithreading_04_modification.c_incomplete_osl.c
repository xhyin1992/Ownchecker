/*
 * @description
 * Flow Variant: 04 Control flow: if(STATIC_CONST_TRUE) and if(STATIC_CONST_FALSE)
 *
 * */

//#include <stdio.h>
//#include <stdlib.h>
//#include <pthread.h>

decl STATIC_CONST_TRUE; transfer newResource(copy) STATIC_CONST_TRUE; /* true */
 
fn thrd2(i:#own())-> #own(){
  transfer newResource(copy) *i;
};

fn thrd1(i:#own())-> #own(){
  transfer newResource(copy) *i;
};

fn increse_num(i:#own()) -> #own(){
      transfer newResource(copy) *i;
};

fn data_race_muiltithreading_04_bad() -> #voidTy{
    STATIC_CONST_TRUE; @{
       decl sharedi; transfer newResource(copy) sharedi;
       decl ret1;
       decl ret2;
       decl thrd1;
       decl thrd2;

       call thrd1(sharedi); transfer newResource(copy) ret1;
       call thrd2(sharedi); transfer newResource(copy) ret2;

       sharedi;
       
    },{
      
    };
};


fn main(argc:#own(copy), argv:#own()) -> #own(copy)

    call data_race_muiltithreading_04_bad();
    val(newResource(copy))    // return value
};
decl arg1;
decl argv1;
 
transfer newResource(copy) arg1;
transfer newResource() argv1;
 
call main(arg1, argv1);

