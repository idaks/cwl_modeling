#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: Workflow 
requirements: 
  - class: SubworkflowFeatureRequirement 
inputs: 
 calibration_years: 
  type: string 
 
 historical_precip_data: 
  type: string 
 
 label: 
  type: string 
 
 min_width: 
  type: string 
 
 tree_ring_data: 
  type: string 
 
 user_map_marker_pos: 
  type: string 
 
 user_prediction_years: 
  type: string 
 
 verbose: 
  type: string 
 
outputs: 
  paleocar_log_file: 
   type: string 
   outputSource: exec_paleocar/log_file
  paleocar_models: 
   type: string 
   outputSource: exec_paleocar/pal_model
  prediction_graph: 
   type: string 
   outputSource: exec_paleocar/pred_plot
  prediction_model: 
   type: string 
   outputSource: exec_paleocar/pred_model
  uncertainty_graph: 
   type: string 
   outputSource: exec_paleocar/uncertain_plot
  uncertainty_model: 
   type: string 
   outputSource: exec_paleocar/uncertain_model
steps: 
 get_client_data: 
  run: get_client_data.cwl 
  in: 
   user_map_marker_pos: user_map_marker_pos
   user_prediction_years: user_prediction_years
  out: [coordinates,prediction_years,run_id,session_id] 
 acccess_static_server_files: 
  run: acccess_static_server_files.cwl 
  in: 
   historical_precip_data: historical_precip_data
   tree_ring_data: tree_ring_data
  out: [itrdb,prism_data] 
 extract_prism_data: 
  run: extract_prism_data.cwl 
  in: 
   coordinates: get_client_data/coordinates
   prism_data: acccess_static_server_files/prism_data
   run_id: get_client_data/run_id
   session_id: get_client_data/session_id
  out: [prism_data_for_coordinates] 
 exec_paleocar: 
  run: exec_paleocar.cwl 
  in: 
   calibration_years: calibration_years
   itrdb: acccess_static_server_files/itrdb
   label: label
   min_width: min_width
   prediction_years: get_client_data/prediction_years
   prism_data_for_coordinates: extract_prism_data/prism_data_for_coordinates
   verbose: verbose
  out: [log_file,pal_model,pred_model,pred_plot,uncertain_model,uncertain_plot] 
 