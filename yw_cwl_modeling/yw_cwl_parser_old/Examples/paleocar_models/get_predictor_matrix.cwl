
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 itrdb: 
  type: string 
 
 calibration_years: 
  type: string 
 
 min_width: 
  type: string 
 
outputs: 
 predictor_matrix: 
  type: string 
 
 max_preds: 
  type: string 
 

baseCommand: 