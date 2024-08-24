#!/bin/bash


ls /home/user/workspace/ownership-language-osl/model/tests/my_test/CWE-457-struct-pointer/*.c | while read line
do
  
   time /root/k/bin/krun $line 

done

