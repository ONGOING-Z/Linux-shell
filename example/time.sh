#!/bin/bash
# Filename: time.sh
start=$(date +%s)
mkdir test; cd test; > test.txt

end=$(date +%s)
differences=$(( end - start ))
echo Time taken to execute commands is ${differences} seconds.
