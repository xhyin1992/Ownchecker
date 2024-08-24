fn do_check_string(cmp_type1:#own(copy)) -> #own(copy){
    cmp_type1；
	@{ //if分支
	  
	},{ //else分支
	  decl astr;
	  transfer newResource(init) astr; //astrlen = ASN1_STRING_to_UTF8(&astr, a);
	  deallocate astr; //OPENSSL_free(astr);	
	  astr; //BUF_strndup((char *)astr, astrlen);	/* use-after-free */
	};
}；

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
	decl cmp_type;
	transfer newResource(copy) cmp_type;
	call do_check_string(cmp_type); 
	val(newResource(copy))
};

decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1);