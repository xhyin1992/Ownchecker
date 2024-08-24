decl errno; transfer newResource(copy) errno;
decl strip_files; transfer newResource(copy) strip_files;
decl owner_id; transfer newResource(copy) owner_id;
decl group_name;
decl owner_name;
decl group_id; transfer newResource(copy) group_id;
decl use_default_selinux_context; transfer newResource(copy) use_default_selinux_context;
decl selinux_enabled; transfer newResource(copy) selinux_enabled;

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

  use_default_selinux_context; @{   //if statement
    call setdefaultfilecon(name);
    };

  val(newResource(copy))     // return value
};


fn install_file_in_file(from1:#own(), to1:#own(), x1:#own()) -> #own(copy){
  decl from_sb; transfer newResource(copy) from_sb;
  x1; from1; from_sb; 
  @{   //if statement
      errno; from1;
     // val(newResource(copy))     // return value
    };
  from1; to1; x1; @{   //if statement
    //val(newResource(copy))     // return value
    };
  strip_files; @{   //if statement
    to1; @{
        to1; @{
          errno; to1;
          };
        //val(newResource(copy))     // return value
      };
    };
  x1; strip_files; to1; @{   //if statement
    //val(newResource(copy))     // return value
    };

  call change_attributes (to1);
 
  val(newResource(copy))     // return value
 };

fn main(argc:#own(copy), argv:#own()) -> #own(copy){

 decl optc;
 decl x; transfer newResource(copy) x;
 decl target_directory; transfer #uninit target_directory;
 decl file; transfer newResource(copy) file;
 decl strip_files; transfer newResource(copy) strip_files;
decl dir_arg;
decl make_backups; transfer newResource(copy) make_backups;
decl copy_only_if_needed;

 argc; argv;
 argv;

 call cp_option_init (x);

//transfer #uninit owner_name;
 // transfer #uninit group_name;
  transfer newResource(copy) strip_files;
  transfer newResource(copy) dir_arg;

  argc; argv; transfer newResource(copy) optc;
 // !{
  	optc; @{

         transfer newResource(copy) make_backups;
  	},{

  	}, {
  		transfer newResource(copy) copy_only_if_needed;
  	};
 // };

 call install_file_in_file(file, file, x);
 };

 decl arg1;
decl argv1;
 
transfer newResource(copy) arg1;
transfer newResource() argv1;
 
call main(arg1, argv1);