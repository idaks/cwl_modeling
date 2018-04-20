
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 cassette_id: 
  type: string 
 
 sample_spreadsheet: 
  type: string 
 
outputs: 
 run_log: 
  type: string 
 
 sample_name: 
  type: string 
 
 sample_quality: 
  type: string 
 
baseCommand: 