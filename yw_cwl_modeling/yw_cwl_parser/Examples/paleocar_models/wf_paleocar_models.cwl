
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
  min_width: 
   type: string 
  verbose: 
   type: string 
outputs: 
  paleocar_models: 
   type: string 
   outputSource: optimizeModels/paleocar_models
steps: 
 print_message: 
  run: print_message.cwl 
  in: 
   verbose: verbose
  out: [] 
 get_predictor_matrix: 
  run: get_predictor_matrix.cwl 
  in: 
   itrdb: itrdb
   calibration_years: calibration_years
   min_width: min_width
  out: [predictor_matrix , max_preds] 
 get_reconstruction_matrix: 
  run: get_reconstruction_matrix.cwl 
  in: 
   itrdb: itrdb
   prediction_years: prediction_years
   min_width: min_width
  out: [reconstruction_matrix] 
 get_predlist: 
  run: get_predlist.cwl 
  in: 
   reconstruction_matrix: get_reconstruction_matrix/reconstruction_matrix
  out: [predlist] 
 get_carscores: 
  run: get_carscores.cwl 
  in: 
   prism_data_for_coordinates: prism_data_for_coordinates
   predictor_matrix: get_predictor_matrix/predictor_matrix
  out: [carscores] 
 calculate_Models: 
  run: wf_calculate_Models.cwl 
  in: 
   predlist: get_predlist/predlist
   carscores: get_carscores/carscores
   max_preds: get_predictor_matrix/max_preds
  out: [linear_models] 
 optimizeModels: 
  run: optimizeModels.cwl 
  in: 
   linear_models: calculate_Models/linear_models
  out: [paleocar_models] 
 