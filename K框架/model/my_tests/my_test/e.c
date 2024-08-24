fn main(argc:#own(copy), argv:#own()) -> #own(copy){
  decl optc;
argc; argv;
//!{   //while statement
      
        transfer newResource(copy) optc;
        @{
   //switch case statement          
        transfer newResource(copy) make_backups;
          optarg; transfer newResource(copy) optarg;
          @{
            transfer optarg version_control_string;
            };
          }
        ,{
          
          }
        ,{
          transfer newResource(copy) copy_only_if_needed;
          
          }
        ,{
          transfer newResource(copy) strip_files;
          
          }
        ,{
          transfer newResource(copy) strip_program;
          transfer newResource(copy) strip_program_specified;
          
          }
        ,{
          transfer newResource(copy) dir_arg;
          
          }
        ,{
          transfer newResource(copy) mkdir_and_install;
          
          }
        ,{
          transfer newResource(copy) x;
          
          }
        ,{
          transfer optarg group_name;
          
          }
        ,{
          transfer optarg specified_mode;
          
          }
        ,{
          transfer optarg owner_name;
          
          }
        ,{
          transfer newResource(copy) x;
          
          }
        ,{
          transfer newResource(copy) make_backups;
          transfer optarg backup_suffix;
          
          }
        ,{
          target_directory; @{
           
           };
          transfer optarg target_directory;
          
          }
        ,{
          transfer newResource(copy) no_target_directory;
          
          }
        ,{
          selinux_enabled; @{   //if statement
              
            };
          transfer newResource(copy) x;
          transfer newResource(copy) use_default_selinux_context;
          
          }
        ,{
          selinux_enabled; @{   //if statement
              transfer newResource(copy) use_default_selinux_context;

              optarg; @{
                transfer optarg scontext;
                },{
                transfer newResource(copy) x;
                };
            }, {
              
            }; 
          }
        ,{
          call usage (newResource(copy));
          };
        
//    };
};

 decl arg1;
decl argv1;
 
transfer newResource(copy) arg1;
transfer newResource() argv1;
 
call main(arg1, argv1);