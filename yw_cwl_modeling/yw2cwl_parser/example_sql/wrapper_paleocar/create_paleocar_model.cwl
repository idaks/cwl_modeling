#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: CommandLineTool 
inputs: 
 cal_year: 
  type: string 
 
 itrdb: 
  type: string 
 
 min.width: 
  type: string 
 
 pred_year: 
  type: string 
 
 predictands: 
  type: string 
 
 region_label: 
  type: string 
 
outputs: 
 log_file: 
  type: string 
 
 pal_model: 
  type: string 
 
baseCommand: 