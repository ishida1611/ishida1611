#!/bin/bash

let row1=`wc -l name.txt | awk '{print $1}'`
for(( i=1;i<=$row1;i=i+1 ))
  do
    name1=`sed -n "$(($i))p" name.txt`
    name2=`sed -n "$(($i))p" rename.txt`
    mv ctnnb1-correlasion/"$name1" ctnnb1-correlasion/$name2
  done



