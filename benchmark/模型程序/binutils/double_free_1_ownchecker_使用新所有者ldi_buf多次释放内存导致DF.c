fn rs6000_xfer_shared_libraries(writebuf1:#own(copy), xfered_len1:#ref('a,#own(copy))) -> #own(copy){
    decl ldi_buf;
	decl result;
	decl cleanup;
	@{ //if分支
	  writebuf1;
	  val(newResource(copy)) newResource(copy)
	},{ };
	transfer newResource(init) ldi_buf; 
	ldi_buf;
	transfer *ldi_buf result;
	deallocate ldi_buf; //free
	deallocate ldi_buf; //double-free
	result; 
	@{
	   val(newResource(copy)) newResource(copy)
	  },{
	   transfer result *xfered_len1;
	   val(newResource(copy)) newResource(copy)
	  };	
};


fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    decl len; transfer newResource(copy) len;
    decl writebuf;
	decl xfered_len;
	xfered_len mborrow len;
	call rs6000_xfer_shared_libraries(writebuf, xfered_len);
    val(newResource(copy)) newResource(copy) 
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;