fn process_mux_new_session(ac:#own(copy), av:#own()) -> #own(copy){
   decl cp;
   decl cmd;
   decl i;
   transfer newResource(copy) i;
   transfer newResource() cmd;
   @{
     deallocate cmd;
   },{
    i; ac;
   !{
      transfer newResource() cp;
	@{
	 deallocate cmd;
	 //...
	 deallocate cmd; //goto malf; double-free
	},{};
    };
   };
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
	call process_mux_new_session(argc, argv);
	val(newResource(copy))
};

decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1);