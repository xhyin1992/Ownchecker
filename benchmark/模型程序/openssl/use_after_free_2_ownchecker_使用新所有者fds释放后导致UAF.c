fn wait_for_async() -> #voidTy{
   decl fds;
   transfer newResource() fds;
   @{
    deallocate fds; //OPENSSL_free(fds); 释放
   },{};
   !{ //while循环
      fds; //UAF
   };
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
	call wait_for_async(); 
	val(newResource(copy))
};

decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1);