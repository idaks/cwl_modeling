
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 RecordID: 
  type: string 
 
 original2_eventDate: 
  type: string 
 
 updated2_eventDate: 
  type: string 
 
outputs: 
 accepted2_record_count: 
  type: string 
 
 date_val_log: 
  type: string 
 
 final_result: 
  type: string 
 
baseCommand: 