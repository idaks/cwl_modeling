
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 calibration_years: 
  type: string 
 
 itrdb: 
  type: string 
 
 min_width: 
  type: string 
 
outputs: 
 max_preds: 
  type: string 
 
 predictor_matrix: 
  type: string 
 
baseCommand: 