
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 cassette_id: 
  type: string 
 
 sample_spreadsheet: 
  type: string 
 
outputs: 
 sample_name: 
  type: string 
 
 sample_quality: 
  type: string 
 
 run_log: 
  type: string 
 

baseCommand: 