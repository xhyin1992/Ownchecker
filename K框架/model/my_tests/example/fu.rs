fn fun(q:#own()) -> #own(){
	q;
	val(newResource())
};

decl p; transfer newResource() p;
call fun(p);
p;





