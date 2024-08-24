fn dsa_generate_private_key(bits2:#own(copy), dsap:#ref(a', #own(copy))) -> #own(copy){
   decl private;
   decl ret;
   transfer newResource(copy) ret;
   transfer newResource() private; //malloc
   private;
   @{
    deallocate private; //free(private); 
	transfer newResource(copy) ret;
	private;
	@{
	  deallocate private; //free(private); double-free
	  val(newResource(copy))
	};
   },{
   //...
   };
};


fn sshkey_generate(type:#own(copy), bits1:#own(copy), keyp:#own()) -> #own(copy){
  decl k;
  decl ret;
  transfer newResource(copy) ret;
  transfer newResource(init) k;
  decl temple;
  temple mborrow k;
  type;
  @{
    call dsa_generate_private_key(bits1, temple);
  },{
   transfer newResource(copy) ret;
  };
  //...
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    decl KEY_DSA; transfer newResource(copy) KEY_DSA;
	decl bits; transfer newResource(copy) bits;
	decl private;
	decl temple;
	temple mborrow private;
	call sshkey_generate(KEY_DSA, bits, temple);
	@{
	
	},{
	  val(newResource(copy))
	}; 
};

decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1) ;