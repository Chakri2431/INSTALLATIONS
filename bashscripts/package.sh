#!/bin/bash 
 
 release_file=/etc/os-release
 log=logfile.txt
 error=error.txt

 if grep -q "Amazon" $release_file
 then
 sudo yum update && sudo yum install -y tree 1>$log 2>$error 
 if [ $? -eq 0 ]
then
echo "package is present and will run the commands"
else
echo "pacakge is not present and there is an error"
fi
fi

if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file
then
sudo apt update && sudo apt upgrade 1>$log 2>$error
if [ $? -eq 0 ]
then
echo "package is present and will run the commands"
else
echo "pacakge is not present and there is a error"
fi
fi
