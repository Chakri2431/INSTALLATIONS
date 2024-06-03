#!/bin/bash

release_file=/etc/os-release
error=/var/log/errorfile.txt
log=/var/log/output.txt

if grep -q "Amazon" $release_file; then
  sudo yum update && sudo yum install -y tree 1>$log 2>$error
  if [ $? -eq 0 ]; then
    echo "The host is Amazon and the operation was successful"
  else
    echo "The host is Amazon but the operation failed" >> $error
  fi
fi

if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file; then
  sudo apt update && sudo apt upgrade -y 1>$log 2>$error && sudo apt install -y tree 1>>$log 2>>$error
  if [ $? -eq 0 ]; then
    echo "The host is Ubuntu/Debian and the operation was successful"
  else
    echo "The host is Ubuntu/Debian but the operation failed" >> $error
  fi
fi

