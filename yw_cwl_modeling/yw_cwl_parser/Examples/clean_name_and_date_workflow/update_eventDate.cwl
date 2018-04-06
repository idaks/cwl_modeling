
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 original2_eventDate: 
  type: string 
 
 match_result: 
  type: string 
 
outputs: 
 updated2_eventDate: 
  type: string 
 
 date_val_log: 
  type: string 
 

baseCommand: 