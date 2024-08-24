fn user_key_allowed2(pw2:#own(copy), key2:#own(copy), file:#own()) -> #own(copy){
  decl f;
  transfer newResource(copy) f; //f = auth_openkeyfile(file, pw, 0);
  @{
    deallocate file; //double-free
	//...
  },{};
};

fn user_key_allowed(pw1:#own(copy), key1:#own(copy)) -> #own(copy){
   decl success;
   decl file;
   transfer newResource() file;
   call user_key_allowed2(pw1,key1,file); //may be freed
   transfer newResource(copy) success;
   deallocate file; //double-free
   success;
   @{
    success;
	val(newResource(copy))
   },{
    
   };
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
	decl pw;
	transfer newResource(copy) pw;
	decl key;
	transfer newResource(copy) key;
	call user_key_allowed(pw, key);
	val(newResource(copy))
};

decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1);