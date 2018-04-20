#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: Workflow 
requirements: 
  - class: SubworkflowFeatureRequirement 
inputs: 
 calibration_years: 
  type: string 
 
 itrdb: 
  type: string 
 
 label: 
  type: string 
 
 min_width: 
  type: string 
 
 prediction_years: 
  type: string 
 
 prism_data_for_coordinates: 
  type: string 
 
 verbose: 
  type: string 
 
outputs: 
  paleocar_log_file: 
   type: string 
   outputSource: create_paleocar_model/log_file
  paleocar_models: 
   type: string 
   outputSource: create_paleocar_model/pal_model
  prediction_graph: 
   type: string 
   outputSource: extract_prediction_model/prediction_graph
  prediction_model: 
   type: string 
   outputSource: extract_prediction_model/prediction_model
  uncertainty_graph: 
   type: string 
   outputSource: extract_uncertainty_model/uncertainty_graph
  uncertainty_model: 
   type: string 
   outputSource: extract_uncertainty_model/uncertainty_model
steps: 
 create_paleocar_model: 
  run: create_paleocar_model.cwl 
  in: 
   cal_year: calibration_years
   itrdb: itrdb
   min.width: min_width
   pred_year: prediction_years
   predictands: prism_data_for_coordinates
   region_label: label
  out: [log_file,pal_model] 
 extract_prediction_model: 
  run: extract_prediction_model.cwl 
  in: 
   models: create_paleocar_model/pal_model
   pred_year: prediction_years
  out: [prediction_graph,prediction_model] 
 extract_uncertainty_model: 
  run: extract_uncertainty_model.cwl 
  in: 
   models: create_paleocar_model/pal_model
   pred_year: prediction_years
  out: [uncertainty_graph,uncertainty_model] 
 