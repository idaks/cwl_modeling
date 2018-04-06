
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 local_authority_source: 
  type: string 
 
 input1_data: 
  type: string 
 
outputs: 
 output1_data: 
  type: string 
 
 name_val_log: 
  type: string 
 
 record_id_data: 
  type: string 
 

baseCommand: 