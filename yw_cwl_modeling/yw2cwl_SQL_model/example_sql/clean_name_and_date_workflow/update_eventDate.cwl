
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 match_result: 
  type: string 
 
 original2_eventDate: 
  type: string 
 
outputs: 
 date_val_log: 
  type: string 
 
 updated2_eventDate: 
  type: string 
 
baseCommand: 