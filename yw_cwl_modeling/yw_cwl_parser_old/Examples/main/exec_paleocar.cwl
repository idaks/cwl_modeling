
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 prediction_years: 
  type: string 
 
 prism_data_for_coordinates: 
  type: string 
 
 itrdb: 
  type: string 
 
 calibration_years: 
  type: string 
 
 label: 
  type: string 
 
 min_width: 
  type: string 
 
 verbose: 
  type: string 
 
outputs: 
 pred_model: 
  type: string 
 
 pred_plot: 
  type: string 
 
 uncertain_model: 
  type: string 
 
 pal_model: 
  type: string 
 
 uncertain_plot: 
  type: string 
 
 log_file: 
  type: string 
 

baseCommand: 