decl time_spec_string; transfer newResource(copy) time_spec_string;
decl time_spec; transfer newResource(copy) time_spec;

decl rfc_email_format; transfer newResource(copy) rfc_email_format;

decl short_options; transfer newResource(copy) short_options;

decl long_options; transfer newResource(copy) long_options;

decl parse_datetime_flags; transfer newResource(copy) parse_datetime_flags;
decl optarg; transfer newResource(copy) optarg;
decl optind; transfer newResource(copy) optind;
decl errno; transfer newResource(copy) errno;
decl line_length; 

fn usage(status:#own(copy)) -> #voidTy{
  status; @{   //if statement
    }, {

    };
  status;
};

fn batch_convert(input_filename:#own(), format:#own(), tz:#own(copy), tzstring:#own()) -> #own(copy){
  decl ok;
  decl in_stream;
  decl line;
  decl buflen;
  decl when;

  input_filename; @{   //if statement
      transfer newResource() input_filename;
      transfer newResource() in_stream;
    } , {
      input_filename; transfer newResource() in_stream;
      @ {
          errno; input_filename;
        },{

        };
    };

  transfer #uninit line;
  transfer newResource(copy) buflen;
  transfer newResource(copy) ok;
  //! {   //while statement
      transfer newResource(copy) line_length;
      line_length; @{   //if statement
          /* FIXME: detect/handle error here.  */
          //val(newResource(copy))
        },{ };

      @{   //if statement
          @ {
            transfer newResource() line;      // array element assignment
          }, { };
          //line;
          transfer newResource(copy) ok; 
        } , {
          transfer newResource(copy) ok;
        };
    //};

/*  @{   //if statement
    errno;
  },{

  };
*/
  deallocate line;      // free function
  deallocate line;      // free function   //double-free

  val(newResource(copy))
};

fn main(argc:#own(copy), argv:#own()) -> #own(copy){
  decl optc;
  decl datestr; transfer #uninit datestr;
  decl set_datestr; transfer #uninit set_datestr;
  decl when;
  decl set_date; transfer newResource(copy) set_date;
  decl format; transfer #uninit format;
  decl batch_file; transfer #uninit batch_file;
  decl reference; transfer #uninit reference;
  decl refstats;
  decl ok;
  decl option_specified_date;

  argc; argv;
  
  
  transfer newResource(copy) optc;
  //!{   //while statement
      decl new_format; transfer #uninit new_format;
  
       optc; @{
   //switch case statement          
          transfer optarg datestr;
          
        }
        ,{
          transfer newResource(copy) parse_datetime_flags;
          
        }
        ,{
          transfer optarg batch_file;
          
        }
        ,{
            decl rfc_3339_format; transfer newResource(copy) rfc_3339_format;
            transfer rfc_3339_format new_format;
            
          }
        ,{
            decl iso_8601_format; transfer newResource(copy) iso_8601_format;
            transfer iso_8601_format new_format;
            
          }
        ,{
          transfer optarg reference;
          
          }
        ,{
          transfer rfc_email_format new_format;
          
        }
        ,{
          transfer optarg set_datestr;
          transfer newResource(copy) set_date;
          
        }
        ,{
          
          @{}, {};
                  
        }
        ,{
           call usage (newResource(copy));
        };
      

       @{   //if statement
          @{
            
          }, { };
          transfer new_format format;
        },{ 

        }; 
    //};

  transfer newResource(copy) option_specified_date;

  option_specified_date; @{   //if statement
    
      call usage (newResource(copy));
    }, {

    };

  option_specified_date; set_date; @{   //if statement
      call usage (newResource(copy));
    }, {

    };

   optind; argc; @{   //if statement
      @
        {
          argv;
          call usage (newResource(copy));
        },{ };

      argv; @
        {
          @{
            
            transfer newResource(copy) format;
            transfer newResource(copy) optind;
          },{

          };
        },{
          argv;
          call usage (newResource(copy));
        };
    },{ };

    @{   //if statement
      transfer newResource(copy) format;
      @{
          transfer newResource(copy) format;
        },{};
    },{};

    decl tzstring; transfer newResource() tzstring;
    decl tz; transfer newResource(copy) tz;

    @{   //if statement
       call batch_convert (newResource(copy), newResource(copy), newResource(copy), newResource(copy));
       transfer newResource(copy) ok;
  } , {

    };

  val(newResource(copy))
};

decl arg1;
decl argv1;
 
transfer newResource(copy) arg1;
transfer newResource() argv1;
 
call main(arg1, argv1);