fn Data_Race_15_bad() -> #voidTy{
    decl data1;
decl data2;
    decl share_var; 
	transfer newResource(copy) share_var;
      @{
            data1 mborrow share_var;
         data2 borrow share_var;
       }
       ,
	   {
       };
      @{
           transfer newResource(copy) *data1;
      }
      ,
	  {
      };
};
fn Data_Race_15_good() -> #voidTy{
    decl data1;
decl data2;
    decl share_var; 
	transfer newResource(copy) share_var;
      @{
            data1 borrow share_var;
         data2 borrow share_var;
       }
       ,
	   {
       };
      @{    //switch case statement 
       }
       ,{
        *data1;   //printf arguments
        *data2;   //printf arguments
       };
};
fn main(argc:#own(copy), argv:#own()) -> #own(copy){
    call Data_Race_15_good();
    call Data_Race_15_bad();
    val(newResource(copy))    // return value
};
decl arg1;
decl argv1;
transfer newResource(copy) arg1;
transfer newResource() argv1;
call main(arg1, argv1);