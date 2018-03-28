
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
  uncertainty_model: 
   type: string 
   outputSource: gen_paleocar_model/uncertainty_model
  paleocar_log_file: 
   type: string 
   outputSource: gen_paleocar_model/paleocar_log_file
  uncertainty_plot: 
   type: string 
   outputSource: gen_paleocar_model/uncertainty_plot
  prediction_plot: 
   type: string 
   outputSource: gen_paleocar_model/prediction_plot
  prediction_model: 
   type: string 
   outputSource: gen_paleocar_model/prediction_model
steps: 
 gen_paleocar_model: 
  run: cwl_files/gen_paleocar_model.cwl 
  in: 
   prediction_years: prediction_years
   prism_data_for_coordinates: prism_data_for_coordinates
   itrdb: itrdb
   calibration_years: calibration_years
   label: label
   min_width: min_width
   verbose: verbose
  out: [prediction_model , prediction_plot , uncertainty_model , uncertainty_plot , paleocar_log_file] 
