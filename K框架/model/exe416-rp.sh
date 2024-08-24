#!/bin/bash


ls /home/user/workspace/ownership-language-osl/model/tests/my_test/CWE-416-return-ptr/*.c | while read line
do
  
   time /root/k/bin/krun $line 

done

