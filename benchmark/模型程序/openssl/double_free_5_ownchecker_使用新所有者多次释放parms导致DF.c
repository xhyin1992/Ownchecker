fn main(infile:#own(), chtype:#own(copy)) -> #own(copy){
    decl parms;
	transfer newResource(init) parms; //parms = CONF_load(NULL, infile, &errline);
	@{
	  deallocate parms; //CONF_free(parms);	/* freed */
	  //goto end;
	  deallocate parms; //CONF_free(parms); /* double-free */
	  val(newResource(copy))
	},{};
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
	call certify_spkac(argv, argc); 
	val(newResource(copy))
};

decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1);