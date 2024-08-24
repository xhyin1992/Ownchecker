#!/bin/bash


ls /home/user/workspace/ownership-language-osl/model/tests/my_test/CWE-415-int/*.c | while read line
do
  
   time /root/k/bin/krun $line 

done

