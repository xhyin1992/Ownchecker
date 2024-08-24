fn SSL_free(s1:#own()) -> #own(copy){
   deallocate s1.0;
   deallocate s1;
}；

fn tls_construct_ctos_cookie(s1:#own()) -> #own(copy){
   decl ret;
   transfer newResource(copy) ret;
   s1.1;
   @{
     val(newResource(copy))
   },{
     @{
	  deallocate s1.0;  //free
	  transfer newResource(copy) s1.1;
	  val(newResource(copy))
	 },{
	    transfer newResource(copy) ret;
	    deallocate s1.0;  //free
	   transfer newResource(copy) s1.1;
	   val(newResource(copy))
	 };
   };
}；

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
	decl s;
	transfer newResource() s;
	transfer newResource() s.0;
	transfer newResource(copy) s.1;
	call tls_construct_ctos_cookie(s); //s->ext.tls13_cookie may be freed in tls_construct_ctos_cookie
	call SSL_free(s); //double-free:使用旧所有者释放(s的所有权已被转移)
	val(newResource(copy))
};

decl arg1;
decl argv1;
decl values;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1);