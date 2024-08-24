fn cgen_lookup_insn(cd:#own(), insn:#own(), insn_int_value:#own(copy), insn_bytes_value:#own()) -> #own(){
    decl length;
	decl buf;
	decl base_insn;
	cd.0;
	@{
	  transfer newResource( ) buf;
	  transfer newResource(init) buf;
	  transfer insn_int_value base_insn;
	  deallocate buf; //free (buf); 释放点
	}, {
	  transfer insn_bytes_value buf;
	  transfer newResource(copy) base_insn;
	};
	insn;
	@{
	 decl insn_list;
	 buf;  //UAF
	 base_insn;
	 transfer newResource( ) insn_list;
	 !{
	   transfer insn_list.0 insn;
	   transfer insn_list.1 insn_list; 
	 };
	},{ };
	val(newResource())
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    decl cd; 
	decl insn_bytes_value; 
	transfer newResource(init) insn_bytes_value;
	transfer newResource(init) cd.0;
	decl temple;
	transfer newResource(copy) temple;
	call cgen_lookup_insn(cd, NULL, temple, insn_bytes_value);
    val(newResource(copy)) newResource(copy) 
};

decl arg1;
decl argv1;


transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;