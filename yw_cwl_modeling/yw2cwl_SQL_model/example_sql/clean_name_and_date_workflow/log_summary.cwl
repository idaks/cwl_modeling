
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 accepted2_record_count: 
  type: string 
 
 rejected2_record_count: 
  type: string 
 
outputs: 
 date_val_log: 
  type: string 
 
baseCommand: 