fn riscv_set_arch(s:#own(copy)) -> #voidTy{
   decl all_subsets;
   transfer newResource(copy) all_subsets;
   decl extension;
   decl p;
   transfer s p;
   p;
   @{
     transfer newResource(copy) xlen;
	 transfer newResource(copy) p;
   },{
     transfer newResource(copy) xlen;
	 transfer newResource(copy) p;
   },{
     
   };
   p;
   @{
    
   },{
      transfer newResource(copy) p;
	  all_subsets; 
	  !{
	    transfer newResource(copy) riscv_subsets; //riscv_add_subset (subset);
	  };
   },{
   
   };
   p;
   !{
     *p;
	 @{
	  transfer newResource(init) subset; //char *subset = xstrdup (p);
	  transfer subset q;
	  transfer subset extension; //所有权转移，subset失效
	  transfer newResource(copy) riscv_subsets;
	  deallocate subset; //free (subset); 非法，使用旧所有者释放
	  extension; //UAF
	 },{
	  transfer newResource(copy) p;
	 },{
	  all_subsets; 
	  *p;
	  decl subset; 
	  transfer newResource(copy) subset;
	  transfer newResource(copy) riscv_subsets;
	  transfer newResource(copy) all_subsets;
	  transfer newResource(copy) p;
	 },{
	  decl subset; 
	  transfer newResource(copy) subset;
	  transfer newResource(copy) riscv_subsets;
	  transfer newResource(copy) p;
	 },{ };
   };
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    decl string; 
	transfer newResource(copy) string;
	call riscv_set_arch(string);
    val(newResource(copy)) newResource(copy) 
};

decl arg1;
decl argv1;
decl xlen;
decl riscv_subsets;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;