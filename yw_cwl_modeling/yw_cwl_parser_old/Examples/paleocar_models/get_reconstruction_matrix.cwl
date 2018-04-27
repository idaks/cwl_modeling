
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 itrdb: 
  type: string 
 
 prediction_years: 
  type: string 
 
 min_width: 
  type: string 
 
outputs: 
 reconstruction_matrix: 
  type: string 
 

baseCommand: 