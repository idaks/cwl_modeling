#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
 carscores: 
  type: string

 predictionlist:
  type: string

 predictor_matrix:
  type:string

outputs:
 linear_models:
  type: File

steps:
 defineLinearModels:
  run: defineLinearModels.cwl
  in:
   carscores: carscores
   predictionlist: predictionlist
   predictor_matrix: predictor_matrix
  out: 
   models:  [models]
   matches: [matches]
  
 calculateLinearModels:
  run: calculateLinearModels.cwl
  in:
   models: defineLinearModels/carscores
   matches: defineLinearModels/matches
  out: 
   coefficient_values:  [coefficient_values]
   model_errors: [model_errors]
 
 simplifyLinearModels:
  run: simplifyLinearModels.cwl
  in:
   coefficient_values: calculateLinearModels/coefficient_values
   model_errors: calculateLinearModels/model_errors
  out: 
   linear_models: linear_models