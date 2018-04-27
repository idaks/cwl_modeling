
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
  prediction_graph: 
   type: string 
   outputSource: extract_prediction_model/prediction_graph
  prediction_model: 
   type: string 
   outputSource: extract_prediction_model/prediction_model
  paleocar_log_file: 
   type: string 
   outputSource: create_paleocar_model/log_file
  uncertainty_model: 
   type: string 
   outputSource: extract_uncertainty_model/uncertainty_model
  uncertainty_graph: 
   type: string 
   outputSource: extract_uncertainty_model/uncertainty_graph
  paleocar_models: 
   type: string 
   outputSource: create_paleocar_model/pal_model
steps: 
 create_paleocar_model: 
  run: create_paleocar_model.cwl 
  in: 
   region_label: label
   cal_year: calibration_years
   itrdb: itrdb
   min.width: min_width
   pred_year: prediction_years
   predictands: prism_data_for_coordinates
  out: [pal_model , log_file] 
 extract_prediction_model: 
  run: extract_prediction_model.cwl 
  in: 
   pred_year: prediction_years
   models: create_paleocar_model/pal_model
  out: [prediction_graph , prediction_model] 
 extract_uncertainty_model: 
  run: extract_uncertainty_model.cwl 
  in: 
   pred_year: prediction_years
   models: create_paleocar_model/pal_model
  out: [uncertainty_graph , uncertainty_model] 
 