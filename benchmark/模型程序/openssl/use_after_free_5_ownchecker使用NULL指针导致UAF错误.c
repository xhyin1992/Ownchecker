fn pqueue_pop(pq:#own()) -> #own(copy){
   @{},{}；
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
	decl queue;
	decl item;
	transfer newResource(init) queue.0; //queue.q = pqueue_new(); 
	call pqueue_pop(queue.0) item; 
	item; //item有可能为NULL指针，报错，从而阻止循环中产生UAF错误
	!{
	  item;
	  deallocate item;
	};
	deallocate queue.0;
	val(newResource(copy))
};

decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1);