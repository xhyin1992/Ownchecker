decl ptr ;  
{
  decl x;    
  transfer newResource(copy) x;  
  ptr borrow x;  
  {
	  decl a;
	  a; //error
  } 
}
