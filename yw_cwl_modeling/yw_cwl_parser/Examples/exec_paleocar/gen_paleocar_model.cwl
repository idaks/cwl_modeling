
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
 prediction_model: 
  type: string 
 
 prediction_plot: 
  type: string 
 
 uncertainty_model: 
  type: string 
 
 uncertainty_plot: 
  type: string 
 
 paleocar_log_file: 
  type: string 
 

baseCommand: 