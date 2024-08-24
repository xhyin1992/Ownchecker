decl p; transfer newResource() p;
decl q; transfer newResource() q;
decl t; transfer newResource() t;
transfer p t;
transfer q p;
transfer t q;

p;
deallocate q;