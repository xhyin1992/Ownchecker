fn main(argc:#own(copy), argv:#own()) -> #voidTy{
    
};

decl arg1;
decl argv1;

transfer newResource(copy) arg1;
transfer newResource() argv1;

call main(arg1, argv1) ;