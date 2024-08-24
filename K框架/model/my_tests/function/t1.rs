
fn foo(x:#own()) -> #own(){
  decl m;
  transfer newResource() x;

  transfer x t;
  
  val(newResource())
  };

fn main(arg:#own(copy), argv:#own()) -> #own(copy){
  decl t;
  decl p;
  transfer newResource() p;
  call foo(p);
  
  val(newResource(copy))
  
    } ;

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;
