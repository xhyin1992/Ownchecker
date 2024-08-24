fn find_separate_debug_file(temple:#ref('a,#own())) -> #own(){
    decl basename;
	decl dir;
	decl debugfile;
	decl canon_name;
	decl i;
	decl build_id; transfer newResource(init) build_id;
	build_id;
	@{
	  decl build_id_name;
	  transfer newResource(init) build_id_name;
	  deallocate build_id; //xfree (build_id);
	  build_id_name;
	  @{
	    deallocate build_id_name;
	  },{
	    val(newResource())
	  };
	},{
	  transfer newResource(init) basename;
	  transfer newResource() dir;
	  transfer newResource(init) dir; /*for*/
	  transfer newResource() canon_name;
	  transfer newResource(copy) i;
	  canon_name; 
	  @{
	    transfer newResource(copy) i;
	  },{
	    transfer newResource(copy) debugfile;
		transfer newResource(copy) debugfile; /*strcpy*/
		transfer newResource(copy) debugfile; /*strcat*/
		debugfile;
		@{
		  deallocate basename; //free
		  deallocate dir; //free
		  deallocate canon_name; //free
		  val(newResource()) //return
		},{
		  canon_name;
		  transfer newResource(copy) debugfile;
		  transfer newResource(copy) debugfile;
		  transfer newResource(copy) debugfile;
		  transfer newResource(copy) debugfile;
		  debugfile;
		  @{
		    deallocate canon_name; //free
			deallocate basename;
			deallocate dir;
			deallocate canon_name; //double-free
			val(newResource())
		  },{	  
		  };
		};
	  };
	};
}

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    decl objfile; 
    decl temple;
	temple mborrow objfile;
	call find_separate_debug_file(temple);
    val(newResource(copy)) newResource(copy) 
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;