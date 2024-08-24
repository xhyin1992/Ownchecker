fn attach_command(args:#own(), from_tty:#own(copy)) -> #voidType{
  decl async_exec;
  transfer newResource(init) args; //分配点 args = strip_bg_char (args, &async_exec);
  transfer newResource(copy) async_exec;
  ...
  deallocate args;        //do_cleanups (args_chain);	/* 释放新所有者args */
  @{
    decl a;
	transfer newResource() a;
	args; //UAF
	transfer newResource() a.0;
	transfer from_tty a.1;
	transfer async_exec a.2;
  },{};
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    decl i; 
	transfer newResource(copy) i;
	argc;
	!{
	  call attach_command(argv, i);
	};
    val(newResource(copy)) newResource(copy) 
};

decl arg1;
decl argv1;


transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;