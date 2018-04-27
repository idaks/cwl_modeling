
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 input1_data: 
  type: string 
 
outputs: 
 original_scientificName: 
  type: string 
 
 original_authorship: 
  type: string 
 
 RecordID: 
  type: string 
 
 original_others: 
  type: string 
 
 record_id_data: 
  type: string 
 
 name_val_log: 
  type: string 
 

baseCommand: 