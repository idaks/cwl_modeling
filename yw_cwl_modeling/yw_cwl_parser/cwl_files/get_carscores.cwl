
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 prism_data_for_coordinates: 
  type: string 
 
 predictor_matrix: 
  type: string 
 
outputs: 
 carscores: 
  type: string 
 

baseCommand: 