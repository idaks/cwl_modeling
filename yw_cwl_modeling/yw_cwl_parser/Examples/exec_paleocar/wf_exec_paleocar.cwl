
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement
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
   outputSource: prediction_model
  prediction_plot: 
   type: string 
   outputSource: prediction_plot
  uncertainty_model: 
   type: string 
   outputSource: uncertainty_model
  uncertainty_plot: 
   type: string 
   outputSource: uncertainty_plot
  paleocar_log_file: 
   type: string 
   outputSource: paleocar_log_file
steps: 
 gen_paleocar_model: 
  run: gen_paleocar_model.cwl 
  in: 
   prediction_years: prediction_years
   prism_data_for_coordinates: prism_data_for_coordinates
   itrdb: itrdb
   calibration_years: calibration_years
   label: label
   min_width: min_width
   verbose: verbose
  out: [prediction_model , prediction_plot , uncertainty_model , uncertainty_plot , paleocar_log_file] 
 