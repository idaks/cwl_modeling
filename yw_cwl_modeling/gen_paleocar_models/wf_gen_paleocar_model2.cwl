#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement

inputs:
  prediction_years: 
   type: string

  tree_ring_values: 
   type: string

  min_tree_width: 
   type: string
  
  calibration_years: 
   type: string
  
  prism_data_of_sel_loc:
   type: string
  
  verbose: 
   type: boolean

outputs:
  linear_models:
    type: string
    outputSource: calculate_models/linear_models

steps:
  get_reconstruction_matrix:
    run: get_reconstruction_matrix.cwl
    in:
      prediction_years: prediction_years
      tree_ring_values: tree_ring_values
      min_tree_width: min_tree_width            
    out: [matrix_of_chronologies_pred_years]
 
  get_prediction_list:
    run: get_prediction_list.cwl
    in:
      matrix_of_chronologies_pred_years: get_reconstruction_matrix/matrix_of_chronologies_pred_years        
    out: [prediction_list]

  get_predictor_matrix: 
    run: get_predictor_matrix.cwl
    in:
      calibration_years: calibration_years
      tree_ring_values: tree_ring_values
      min_tree_width: min_tree_width

    out: [matrix_of_chronologies_calibration_year, max_no_predictor]

  get_car_scores: 
    run: get_car_scores.cwl
    in:
      matrix_of_chronologies_calibration_year: get_predictor_matrix/matrix_of_chronologies_calibration_year
      prism_data_of_sel_loc: prism_data_of_sel_loc
    out: [car_scores]


  calculate_models:
    run: ../calculate_models/wf_calculate_models2.cwl
    in:
      carscores: get_car_scores/car_scores
      predictionlist: get_prediction_list/prediction_list
      max_no_predictor: get_predictor_matrix/max_no_predictor
    out: [linear_models]

  print_messages:
    run: print_messages.cwl
    in:
      verbose: verbose
    out: [messages]