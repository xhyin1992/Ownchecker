fn gdb_bfd_open(name:#own(copy)) -> #own(){
  @{
    decl abfd; transfer newResource() abfd; //malloc
	val(newResource())
  },{
    val(newResource())
  };
};

fn remote_filename_p(name:#own(copy)) -> #own(){
  name; call gdb_bfd_open(name);
  val(newResource())
};

fn symfile_bfd_open(name:#own(copy)) -> #own(){
   decl sym_bfd;
   decl absolute_name;
   transfer newResource(init) absolute_name;
   decl desc;
   name;
   call remote_filename_p(name);
   @{
      transfer newResource() sym_bfd; //sym_bfd = remote_bfd_open (name);
	  val(newResource())
   },{ };
   transfer newResource(init) name;  //name = strdup (name);
   transfer newResource(copy) desc;
   desc;
   @{
	    deallocate name; //make_cleanup (free, name);
	},{ };
    transfer absolute_name name;
	deallocate name; //make_cleanup (free, name);
    transfer newResource() sym_bfd;	
	sym_bfd;
	@{
	  deallocate name; //make_cleanup (free, name);  double-free
	},{ };
    val(newResource())
};


fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    decl old_chain; 
	decl temple;
	transfer newResource(copy) temple;
	call symfile_bfd_open(temple);
	old_chain;
    val(newResource(copy)) newResource(copy) 
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;