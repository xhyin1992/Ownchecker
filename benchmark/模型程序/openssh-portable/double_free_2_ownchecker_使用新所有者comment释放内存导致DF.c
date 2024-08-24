fn delete_file(filename1:#own(copy), key_only2:#own()) -> #own(copy){
   decl certpath;
   decl cert;
   decl ret;
   transfer newResource(copy) ret;
   key_only;
   @{
     deallocate comment;
     ret;
	 val(newResource(copy))
   },{
     deallocate comment;
	 transfer newResource(copy) certpath;
	 transfer newResource(copy) cert;
	 @{
	  deallocate comment; //double-free
	  ret;
	  val(newResource(copy))
	 },{
	   
	 };
   };
}；

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    decl filename; transfer newResource(copy) filename;
	decl key_only; transfer newResource(copy) key_only;
	call delete_file(filename, key_only);
	val(newResource(copy))
};

decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1);