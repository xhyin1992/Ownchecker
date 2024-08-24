fn X509V3_parse_list(line:#own()) -> #own(){
  decl linebuf;
  deal state;
  transfer newResource(copy) state;
  transfer newResource() linebuf; //linebuf = OPENSSL_strdup(line);
  linebuf;
  @{
   //goto err;
  },{
    !{  //for循环
	 transfer newResource(init) values; //添加元素：transfer newResource() values;
	};
	state;
	@{
	 deallocate values; //free: sk_CONF_VALUE_pop_free(values, X509V3_conf_free);  
	},{},{};
  };
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
	call X509V3_parse_list(argv); //values may be freed in X509V3_parse_list
	values;
	transfer newResource() values;
	@{
	  deallocate values; //doule-free:k_CONF_VALUE_pop_free(values, X509V3_conf_free);
	},{};
	val(newResource(copy))
};

decl arg1;
decl argv1;
decl values;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1);