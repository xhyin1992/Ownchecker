fn cgen_lookup_insn(lm:#own(copy), prev_lm:#own(copy), link_ptr_ptr:#ref(a', #own()), ignore_first:#own(copy)) -> #own(copy){
    decl first;
	decl next_lm;
	lm; prev_lm;
	!{
	  decl new; 
	  decl errcode;
	  decl buffer;
	  transfer newResource(init) new; //分配点
	  transfer newResource( ) new;
	  transfer newResource(copy) next_lm;
	  ignore_first；new；
	  @{
	    transfer new first; //所有权转移
		deallocate new; //非法，使用旧所有者释放 xfree (new);
	  }，{ }；
	  new;
	  ...
	  first;
	  ...
	};
}


fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    decl link_ptr; 
	decl temple;
	temple mborrow link_ptr;
	decl value;
	transfer newResource(copy) value;
	call svr4_read_so_list(argc, argc, temple, value);
    val(newResource(copy)) newResource(copy) 
};

decl arg1;
decl argv1;


transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;