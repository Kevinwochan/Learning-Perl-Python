 #!/bin/sh -w
for testFile in t1.txt
do
#echo "input File is $testFile"
testCheckSum=`md5sum < "$testFile"`

outputData=`cat "$testFile" | ./shuffle.pl > /dev/null`
#echo "output is $outputData"

outputSum=`echo "$outputData" | md5sum`

if [ "$testCheckSum" = "$outputSum" ]
	then 
		echo "not shuffled! its a scam!\n"
	else
		echo "shuffled!"
	fi
done
