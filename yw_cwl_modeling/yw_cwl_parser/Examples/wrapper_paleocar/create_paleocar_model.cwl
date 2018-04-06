
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 region_label: 
  type: string 
 
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
 
outputs: 
 pal_model: 
  type: string 
 
 log_file: 
  type: string 
 

baseCommand: 