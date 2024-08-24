fn client_suspend_self(bin:#own(), bout:#own(), berr:#own()) -> #voidTy{
   //...
   deallocate bin;
   deallocate bout;
   deallocate berr;
   transfer newResource(copy) received_window_change_signal;
   bin; //UAF
   bout; //UAF
   berr; //UAF
   //...
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    decl c;
	//...
	transfer newResource(init) c; //for语句
	call client_suspend_self(c,c,c);
	//...
    val(newResource(copy)) 
};

decl arg1;
decl argv1;
decl received_window_change_signal;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1) ;