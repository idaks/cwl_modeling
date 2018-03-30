#! /usr/bin/bash


for f in cwl_files/* 
do 
 echo $f
 #`cwl-runner ${f}` 
done

for f in ../yw_cwl_parser/wf*.cwl
do
 `cwl-runner ${f}`
 echo $f
done 
