
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 RecordID: 
  type: string 
 
 original2_eventDate: 
  type: string 
 
 check_result: 
  type: string 
 
outputs: 
 final_result: 
  type: string 
 
 rejected2_record_count: 
  type: string 
 
 date_val_log: 
  type: string 
 

baseCommand: 