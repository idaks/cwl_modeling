
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 coordinates: 
  type: string 
 
 prism_data: 
  type: string 
 
 run_id: 
  type: string 
 
 session_id: 
  type: string 
 
outputs: 
 prism_data_for_coordinates: 
  type: string 
 
baseCommand: 