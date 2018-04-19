
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 predictor_matrix: 
  type: string 
 
 prism_data_for_coordinates: 
  type: string 
 
outputs: 
 carscores: 
  type: string 
 
baseCommand: 