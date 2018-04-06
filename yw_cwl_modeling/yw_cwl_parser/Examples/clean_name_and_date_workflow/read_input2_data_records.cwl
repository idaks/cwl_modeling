
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 input2_data: 
  type: string 
 
 record_id_data: 
  type: string 
 
outputs: 
 original2_eventDate: 
  type: string 
 
 RecordID: 
  type: string 
 
 original2_others: 
  type: string 
 
 date_val_log: 
  type: string 
 

baseCommand: 