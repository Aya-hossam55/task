#!/bin/bash
cat script.txt | cut -d" " -f3 > id.txt
cat script.txt | cut -d" " -f2 >fqdn.txt
for i in {1..5}
do 
 
if [ -z "$(head -n $i id.txt | tail -1)" -o -z "$(head -n $i fqdn.txt | tail -1 | grep ".com")" ]
then 
        i=$i+1
else

       	 if [ $(expr $(head -n $i id.txt | tail -1) % 2) -eq 0 ]
       	 then
		 echo "the id $(head -n $i id.txt | tail -1) of the email $(head -n $i fqdn.txt | tail -1) is even number"
	 else
		 echo "the id $(head -n $i id.txt | tail -1) of the email $(head -n $i fqdn.txt | tail -1) is odd number"
	 fi
	
fi
i=$i+1
done
