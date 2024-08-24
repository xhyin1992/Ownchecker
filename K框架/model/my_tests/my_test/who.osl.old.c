decl do_lookup;
decl short_list;
decl short_output;
decl include_idle;
decl include_heading;
decl include_mesg;
decl include_exit;
decl need_boottime;
decl need_deadprocs;
decl need_login;
decl need_initspawn;
decl need_clockchange;
decl need_runlevel;
decl need_users;
decl my_line_only;
decl time_format;
decl time_format_width;
decl errno; transfer newResource(copy) errno;

fn print_runlevel(utmp_ent:#own()) -> #voidTy{
  decl runlevline; decl comment;
  decl last; transfer newResource(copy) last;
  decl curr; transfer newResource(copy) curr;
  @{
    transfer newResource(copy) runlevline;
  };
  runlevline; curr;
  @{
    transfer newResource(copy) comment;
  };
  comment; last;
};


fn print_user(utmp_ent:#own(), boottime:#own(copy)) -> #voidTy{
  decl stats; transfer newResource(copy) stats;
  decl last_change;
  decl mesg;
  decl idlestr;
  decl hoststr;
  decl hostlen;

  decl line; transfer newResource(copy) line;
  decl p; transfer newResource() p;
  
  utmp_ent; @{   //if statement
    transfer newResource() p;
  };
  

  line; @{   //if statement
      transfer newResource(copy) mesg;
      transfer stats last_change;
    } , {
      transfer newResource(copy) mesg;
      transfer newResource(copy) last_change;
    };

  @{   //if statement
     boottime;
  } , {
    
  };

  //call print_line(newResource(copy), newResource(), newResource(copy), newResource(copy), newResource(),
                //  newResource(), newResource(), newResource(), newResource(), newResource());

};

fn print_boottime(utmp_ent:#own()) -> #voidTy{
  utmp_ent;
};

fn print_clockchange(utmp_ent:#own()) -> #voidTy{
  utmp_ent;
};

fn make_id_equals_comment(utmp_ent:#own(copy)) -> #own(){
  decl comment; 
  transfer newResource() comment;
  comment; 
  comment; utmp_ent;
  comment; val(newResource())     // return value
};

fn print_initspawn(utmp_ent:#own()) -> #voidTy{
  decl comment;
  call make_id_equals_comment (newResource());
  transfer newResource() comment;

  utmp_ent; comment;
  deallocate comment;      // free function
};

fn print_login(utmp_ent:#own()) -> #voidTy{
  decl comment;
  call make_id_equals_comment (newResource());
  transfer newResource() comment;
  /* FIXME: add idle time? */

  utmp_ent; comment;
  deallocate comment;      // free function
};

fn print_deadprocs(utmp_ent:#own()) -> #voidTy{
  decl exitstr;
  decl comment;
  call make_id_equals_comment (newResource());
  transfer newResource() comment;

  @{   //if statement
    utmp_ent; transfer newResource() exitstr;
  };
  exitstr; utmp_ent;

  /* FIXME: add idle time? */

  utmp_ent; comment; exitstr;
  deallocate comment;      // free function
  deallocate comment;
};

fn scan_entries(n:#own(copy), utmp_buf:#own()) -> #voidTy{
   decl ttyname_b; 
   decl boottime; transfer newResource(copy) boottime;
   @{
    transfer newResource(copy) ttyname_b;
    ttyname_b; 
    @{
     // val(newResource(copy))
    };
    @{
      ttyname_b; transfer newResource(copy) ttyname_b;
    };
   };

   n;
  // !{
      @{
           call print_user(utmp_buf, newResource(copy));
      },{
          call print_runlevel(utmp_buf);
      },{
        call print_boottime(utmp_buf);
      },{
        call print_clockchange(utmp_buf);
      },{
        call print_initspawn(utmp_buf);
      },{
        call print_login(utmp_buf);
      },{
        //call print_deadprocs(utmp_buf);
      },{

      };
  // };
   // utmp_buf; 
      @{
      transfer newResource(copy) boottime;
     }; 
    //utmp_buf; transfer newResource(copy) utmp_buf;
};

fn list_entries_who(n:#own(copy), utmp_buf:#own()) -> #voidTy{
  decl entries; transfer newResource(copy) entries;
  decl separator; transfer newResource(copy) separator;

  n; 
  //!{   //while statement
      utmp_buf; @{   //if statement
          decl trimmed_name;

          utmp_buf; transfer newResource(copy) trimmed_name;

          separator; trimmed_name;   //printf arguments
          deallocate trimmed_name;      // free function
          transfer newResource(copy) separator;
          entries; transfer newResource(copy) entries;
        };
      utmp_buf; transfer newResource() utmp_buf;
   // };
  entries;   //printf arguments
};

fn who(filename:#own(), options:#own(copy)) -> #voidTy{
  decl n_users; transfer newResource(copy) n_users;
  decl utmp_buf; transfer newResource() utmp_buf;

  filename; n_users; utmp_buf; @{   //if statement
    errno; filename;
  };

  @{   //if statement
    call list_entries_who (n_users, newResource());
  } , {
    call scan_entries (n_users, newResource());
  };

  deallocate utmp_buf;
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
  call who (newResource(), newResource(copy));

  val(newResource(copy))
};

decl arg1;
decl argv1;
 
transfer newResource(copy) arg1;
transfer newResource() argv1;
 
call main(arg1, argv1);