
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
 
 min_width: 
  type: string 
 
 prediction_years: 
  type: string 
 
 prism_data_for_coordinates: 
  type: string 
 
 verbose: 
  type: string 
 
outputs: 
  _YW_OUT_print_message: 
   type: string 
   outputSource: print_message/_YW_OUT_print_message
  paleocar_models: 
   type: string 
   outputSource: optimizeModels/paleocar_models
steps: 
 print_message: 
  run: print_message.cwl 
  in: 
   verbose: verbose
  out: [_YW_OUT_print_message] 
 get_predictor_matrix: 
  run: get_predictor_matrix.cwl 
  in: 
   calibration_years: calibration_years
   itrdb: itrdb
   min_width: min_width
  out: [max_preds,predictor_matrix] 
 get_reconstruction_matrix: 
  run: get_reconstruction_matrix.cwl 
  in: 
   itrdb: itrdb
   min_width: min_width
   prediction_years: prediction_years
  out: [reconstruction_matrix] 
 get_predlist: 
  run: get_predlist.cwl 
  in: 
   reconstruction_matrix: get_reconstruction_matrix/reconstruction_matrix
  out: [predlist] 
 get_carscores: 
  run: get_carscores.cwl 
  in: 
   predictor_matrix: get_predictor_matrix/predictor_matrix
   prism_data_for_coordinates: prism_data_for_coordinates
  out: [carscores] 
 calculate_Models: 
  run: wfcalculate_Models.cwl 
  in: 
   carscores: get_carscores/carscores
   max_preds: get_predictor_matrix/max_preds
   predlist: get_predlist/predlist
  out: [linear_models] 
 optimizeModels: 
  run: optimizeModels.cwl 
  in: 
   linear_models: calculate_Models/linear_models
  out: [paleocar_models] 
 