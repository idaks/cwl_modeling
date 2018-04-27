
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement
inputs: 
  user_map_marker_pos: 
   type: string 
  user_prediction_years: 
   type: string 
  calibration_years: 
   type: string 
  label: 
   type: string 
  verbose: 
   type: string 
  min_width: 
   type: string 
  historical_precip_data: 
   type: string 
  tree_ring_data: 
   type: string 
outputs: 
  prediction_graph: 
   type: string 
   outputSource: exec_paleocar/pred_plot
  paleocar_models: 
   type: string 
   outputSource: exec_paleocar/pal_model
  prediction_model: 
   type: string 
   outputSource: exec_paleocar/pred_model
  paleocar_log_file: 
   type: string 
   outputSource: exec_paleocar/log_file
  uncertainty_model: 
   type: string 
   outputSource: exec_paleocar/uncertain_model
  uncertainty_graph: 
   type: string 
   outputSource: exec_paleocar/uncertain_plot
steps: 
 get_client_data: 
  run: get_client_data.cwl 
  in: 
   user_map_marker_pos: user_map_marker_pos
   user_prediction_years: user_prediction_years
  out: [session_id , run_id , coordinates , prediction_years] 
 acccess_static_server_files: 
  run: acccess_static_server_files.cwl 
  in: 
   historical_precip_data: historical_precip_data
   tree_ring_data: tree_ring_data
  out: [prism_data , itrdb] 
 extract_prism_data: 
  run: extract_prism_data.cwl 
  in: 
   coordinates: get_client_data/coordinates
   session_id: get_client_data/session_id
   run_id: get_client_data/run_id
   prism_data: acccess_static_server_files/prism_data
  out: [prism_data_for_coordinates] 
 exec_paleocar: 
  run: exec_paleocar.cwl 
  in: 
   prediction_years: get_client_data/prediction_years
   prism_data_for_coordinates: extract_prism_data/prism_data_for_coordinates
   itrdb: acccess_static_server_files/itrdb
   calibration_years: calibration_years
   label: label
   min_width: min_width
   verbose: verbose
  out: [pred_model , pred_plot , uncertain_model , pal_model , uncertain_plot , log_file] 
 