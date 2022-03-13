#!/bin/bash

ex=$1
ctl=$2
merge=$3
awk '{print $17}' A549_C.txt | sort -u > A549_C_geneid.txt
let row1=`wc -l $ex | awk '{print $1}'`
let row2=`wc -l $ctl | awk '{print $1}'`
let row3=`wc -l $merge | awk '{print $1}'`
sed -n '1p' Ctr_FOXM1.txt >>FOXM1_unique.txt
sed -n '1p' Ctr_FOXM1.txt >>LC3_unique.txt
sed -n '1p' Ctr_FOXM1.txt >>FOXM1_merge.txt
sed -n '1p' Ctr_FOXM1.txt >>LC3_merge.txt
for(( i=1;i<=$row1;i=i+1 ))
  do
    name1=`sed -n "$(($i))p" FOXM1_unique`
    cat Ctr_FOXM1.txt | grep $'\t'"$name1"$'\t'  >>FOXM1_unique.txt
  done
let row2=`wc -l LC3_unique | awk '{print $1}'`
for(( i=1;i<=$row2;i=i+1 ))
  do
    name1=`sed -n "$(($i))p" LC3_unique`
    cat Ctr_LC3.txt | grep $'\t'"$name1"$'\t'  >>LC3_unique.txt
  done
for(( i=1;i<=$row3;i=i+1 ))
  do
    name1=`sed -n "$(($i))p" merge`
    cat Ctr_FOXM1.txt | grep $'\t'"$name1"$'\t'  >>FOXM1_merge.txt
  done
let row1=`wc -l LC3_unique | awk '{print $1}'`
for(( i=1;i<=$row3;i=i+1 ))
  do
    name1=`sed -n "$(($i))p" merge`
    cat Ctr_LC3.txt | grep $'\t'"$name1"$'\t'  >>LC3_merge.txt
  done
