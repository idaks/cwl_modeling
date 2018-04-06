
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 output1_data: 
  type: string 
 
 record_id_data: 
  type: string 
 
outputs: 
 output2_data: 
  type: string 
 
 date_val_log: 
  type: string 
 

baseCommand: 