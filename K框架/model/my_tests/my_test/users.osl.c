decl optind; transfer newResource(copy) optind;

fn userid_compare(v_a:#own(), v_b:#own()) -> #own(copy){
  decl a; a borrow v_a;
  decl b; b borrow v_b;
  *a; *b; 
  val(newResource(copy))    // return value
};

fn usage(status:#own(copy)) -> #voidTy{
  status; @{   //if statement
    
  } , {
      
    };
  status;
};

fn list_entries_users(n:#own(copy), this:#own()) -> #voidTy{
  decl u; transfer newResource() u;
  decl n_entries; transfer newResource(copy) n_entries;

  n; 
  //!{   //while statement
      this; @{   //if statement
          decl trimmed_name;

          transfer newResource() trimmed_name;

          transfer trimmed_name u;     // array element assignment
          n_entries;
          transfer newResource(copy) n_entries;
        }, {

        };
      this; transfer newResource() this;
      n; transfer newResource(copy) n;
   // };

  u; n_entries; 
  call userid_compare(newResource(), newResource());


  decl i; transfer newResource(copy) i;
  i; n_entries; 
  //!{   //for statement
      decl c; 
      i; n_entries; @{
           transfer newResource(copy) c;
      },{
          transfer newResource(copy) c;
      };
      u;
      c;
      i; transfer newResource(copy) i;
   // };

  decl i; transfer newResource(copy) i;
  i; n_entries; 
  //!{   //for statement
    deallocate u;      // free function
    i; transfer newResource(copy) i;
  //};
  deallocate u;      // free function
  deallocate u;      // free function   //double-free
  
};

fn users(filename:#own(), options:#own(copy)) -> #voidTy{
  decl n_users; transfer newResource(copy) n_users;
  decl utmp_buf; transfer newResource() utmp_buf;

  @{   //if statement
    filename;
  },{

  };

  call list_entries_users (n_users, utmp_buf);

  deallocate utmp_buf;
};


fn main(argc:#own(copy), argv:#own()) -> #own(copy){
  argc; argv;


  
/*  argc; argv; @{   //if statement
    call usage (newResource(copy));
  },{

  }; */

  
    argc; optind; @	{   
      //switch case statement		
     // call usage (newResource(copy));
      
    }
    ,	{		
      call users(newResource(), newResource(copy)); 
      
    }

    ,{			
      argv;
      //call usage (newResource(copy));
    }; 
  

  val(newResource(copy))
};

decl arg1;
decl argv1;
 
transfer newResource(copy) arg1;
transfer newResource() argv1;
 
call main(arg1, argv1);