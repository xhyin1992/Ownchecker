decl errno; transfer newResource(copy) errno;
decl strip_files; transfer newResource(copy) strip_files;
decl owner_id; transfer newResource(copy) owner_id;
decl group_name; transfer newResource() group_name;
decl owner_name; transfer newResource() owner_name;
decl group_id; transfer newResource(copy) group_id;
decl use_default_selinux_context; transfer newResource(copy) use_default_selinux_context;
decl selinux_enabled; transfer newResource(copy) selinux_enabled;
decl strip_program; transfer newResource(copy) strip_program;
decl optarg; transfer newResource(copy) optarg;
decl simple_backup_suffix; transfer newResource(copy) simple_backup_suffix;
decl mode; transfer newResource(copy) mode;
decl dir_mode; transfer newResource(copy) dir_mode;


fn get_ids() -> #voidTy{
  decl pw; transfer newResource(copy) pw;
  decl gr; 

  owner_name; @{   //if statement
      owner_name;
      @{
          decl tmp; transfer newResource(copy) tmp;
          @{
             owner_name;
                 };
          transfer tmp owner_id;
        },{
        transfer pw owner_id;
        };

    } , {
    transfer newResource(copy) owner_id;

   };
   
  group_name; @{   //if statement
      transfer newResource(copy) gr;
      @{
          decl tmp; transfer newResource(copy) tmp;
          @{
             group_name;
                 };
          transfer tmp group_id;
        }, {
        transfer gr group_id;
        };
      
    }, {
    transfer newResource(copy) group_id;
    };
};


fn usage(status:#own(copy)) -> #voidTy{
  status; @{   //if statement
    
  } , {
            
    };
  status;
};

fn cp_option_init(y:#own()) -> #voidTy{
  y;
  transfer newResource(copy) y;
};

fn setdefaultfilecon(file:#own()) -> #voidTy{
  decl st; transfer newResource(copy) st;
  decl scontext; transfer #uninit scontext;
  decl first_call; transfer newResource(copy) first_call;
  selinux_enabled; @{
   //val(newResource(copy))
  };
  file; st; @{
   //val(newResource(copy))
  };
  first_call; file; @{
   decl p0;
   file; 
   decl p; transfer newResource() p;
   *p; 
   //!{
   p; transfer newResource() p;
   //};
   read(p); transfer newResource() p0;
   *p; @{
     decl prefix;
     *p; 
     //!{
      p; transfer newResource() p;
     //};
     transfer newResource() prefix;
     prefix; @{
         prefix; p0; p;
         prefix;
         deallocate prefix;
         deallocate prefix;
       };
    };
   };
 transfer newResource(copy) first_call;
 file; st; context; scontext;@{
  scontext;@{
   scontext;
  };
  val(newResource(copy))
 };
 file; scontext; errno; @{
   scontext;
 };
 val(newResource(copy))
};

fn change_attributes(name:#own()) -> #own(copy){
  decl ok; transfer newResource(copy) ok;
  owner_id; group_id; name;@{   //if statement
    errno; name;
    } , {
    errno; name;
    } , {
    transfer newResource(copy) ok;
    };

  /*use_default_selinux_context; @{   //if statement
    call setdefaultfilecon(name);
    }; */

  val(newResource(copy))     // return value
};


fn install_file_in_file(from:#own(), to:#own(), x:#own()) -> #own(copy){
  decl from_sb; transfer newResource(copy) from_sb;
  x; from; from_sb; 
  @{   //if statement
      errno; from;
     // val(newResource(copy))     // return value
    };
  from; to; x; @{   //if statement
    //val(newResource(copy))     // return value
    };
  strip_files; @{   //if statement
    to; @{
        to; @{
          errno; to;
          };
        //val(newResource(copy))     // return value
      };
    };
  /*x; strip_files; to; @{   //if statement
    //val(newResource(copy))     // return value
    }; */

  call change_attributes (to);
 
  val(newResource(copy))     // return value
 };

fn target_directory_operand(file:#own()) -> #own(copy){
  decl b; transfer newResource() b;
  decl blen; transfer newResource(copy) b;
  decl looks_like_a_dir; transfer newResource(copy) looks_like_a_dir;
  decl st;
  decl err; transfer newResource(copy) err;
  decl is_a_dir; transfer newResource(copy) is_a_dir;
  err; @{   //if statement
    err; file; 
    };
  is_a_dir; looks_like_a_dir; @{   //if statement
    err; file; 
         };
  is_a_dir; val(newResource(copy))
};

fn extra_mode(input:#own(copy)) -> #own(copy){
  decl mask; transfer newResource(copy) mask;
  input; mask; val(newResource(copy))     // return value
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){

 decl optc;
 decl exit_status; transfer newResource(copy) exit_status;
 decl specified_mode; transfer newResource(copy) specified_mode;
 decl x; transfer newResource(copy) x;
 decl target_directory; transfer #uninit target_directory;
 decl no_target_directory; transfer #uninit no_target_directory;
 decl file; transfer newResource(copy) file;
 decl strip_files; transfer newResource(copy) strip_files;
decl dir_arg;
decl make_backups; transfer newResource(copy) make_backups;
decl copy_only_if_needed;
decl n_files;
decl file;
decl strip_program_specified; transfer newResource(copy) strip_program_specified;
decl scontext; transfer #uninit scontext;
decl mkdir_and_install;

 argc; argv;
 argv;

 call cp_option_init (x);

//transfer #uninit owner_name;
 // transfer #uninit group_name;
  transfer newResource(copy) strip_files;
  transfer newResource(copy) dir_arg;

  argc; argv; transfer newResource(copy) optc;
 // !{
/*  	optc; @{

         transfer newResource(copy) make_backups;
  	},{

  	}, {
  		transfer newResource(copy) copy_only_if_needed;
  	},{
  	   transfer newResource(copy) strip_files;
  	},{
  	   transfer newResource(copy) strip_program;
  	   transfer newResource(copy) strip_program_specified;
  	},{
  	   transfer newResource(copy) dir_arg;
  	},{
  	   transfer newResource(copy) mkdir_and_install;
  	},{
  	  transfer newResource(copy) x;
  	}, {
  	  transfer optarg group_name;
  	},{
  	  transfer optarg specified_mode;
  	},{
  	  transfer optarg owner_name;
  	},{
  	  transfer newResource(copy) x;
  	},{
  	  transfer newResource(copy) make_backups;
  	  transfer optarg simple_backup_suffix;
  	},{
  	    @{   //if statement
          
             };
          transfer optarg target_directory;
  	},{
  	   transfer newResource(copy) no_target_directory;
  	},{
  	  selinux_enabled;@{   //if statement
             
            };
          transfer newResource(copy) x;
          transfer newResource(copy) use_default_selinux_context;
  	},{
  	  selinux_enabled; @{   //if statement
              transfer newResource(copy) use_default_selinux_context;

              optarg; @{
                  transfer optarg scontext;
                },{
                  transfer newResource(copy) x;
                };
            }, {
              
            };          
  	}, {
  	call usage(newResource(copy));
  	}; */
 // };
 
 /*dir_arg; strip_files; @{   //if statement
    
    };
    
  dir_arg; @{   //if statement
    
         }; */
         
   @{   //if statement
      decl st; transfer newResource(copy) st;
      decl stat_success; transfer newResource(copy) stat_success;
      stat_success; @{
        
             };
      stat_success; st; @{
        
             };
    };
    
 transfer newResource(copy) x;
 
 x; @{   //if statement
    
     }, {};
         
   @{   //if statement
    
    },{};
        
 transfer newResource(copy) n_files;
 transfer newResource() file;
 
 n_files; dir_arg; @{   //if statement
      n_files; @{
        
        }, {
        file;
               };
      call usage(newResource(copy));
    };
    
  @{   //if statement
      @{
               };
      n_files; @{
          file;
          call usage(newResource(copy));
        };
    },{
       n_files; call target_directory_operand(newResource());
       @{
         transfer newResource(copy) n_files;
         transfer newResource(copy) target_directory;
       },{
          file;
       };
    };
 
 /* specified_mode; @{   //if statement
      decl change; transfer newResource(copy) change;
      change; @{
        specified_mode;
        };
      transfer newResource(copy) mode;
      transfer newResource(copy) dir_mode;
      deallocate change;      // free function
    };
 
 strip_program_specified; @{   //if statement
   
                   }; */

/*  @{   //if statement
      
      call usage(newResource(copy));
    };

  @{   //if statement
      
      call usage(newResource(copy));
    }; */
    
  call extra_mode(mode); @{   //if statement
    
                   }; 
                  
  call get_ids ();
  
  @{   //if statement
    transfer newResource(copy) exit_status;
    },{
        @{
          call install_file_in_file(newResource(), newResource(), newResource(copy));
          @{
           transfer newResource(copy) exit_status;
          };  
        },{
          decl i;
          x;
          transfer newResource(copy) i;
          i; n_files;
          //!{
            transfer newResource(copy) exit_status;
            i; transfer newResource(copy) i;
          //    };
           };
        };

  exit_status; val(newResource(copy))     // return value
    
 };

 decl arg1;
decl argv1;
 
transfer newResource(copy) arg1;
transfer newResource() argv1;
 
call main(arg1, argv1);
