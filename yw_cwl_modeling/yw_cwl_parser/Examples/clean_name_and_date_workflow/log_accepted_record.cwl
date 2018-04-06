
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 RecordID: 
  type: string 
 
 updated2_eventDate: 
  type: string 
 
 original2_eventDate: 
  type: string 
 
outputs: 
 final_result: 
  type: string 
 
 accepted2_record_count: 
  type: string 
 
 date_val_log: 
  type: string 
 

baseCommand: 