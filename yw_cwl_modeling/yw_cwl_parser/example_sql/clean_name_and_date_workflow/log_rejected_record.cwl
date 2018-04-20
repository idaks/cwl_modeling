
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 RecordID: 
  type: string 
 
 check_result: 
  type: string 
 
 original2_eventDate: 
  type: string 
 
outputs: 
 date_val_log: 
  type: string 
 
 final_result: 
  type: string 
 
 rejected2_record_count: 
  type: string 
 
baseCommand: 