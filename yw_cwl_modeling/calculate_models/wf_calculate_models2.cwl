#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  carscores: 
   type: string

  predictionlist: 
   type: string

  max_no_predictor: 
   type: string

outputs:
  linear_models:
    type: string
    outputSource: simplifyLinearModels/linear_models

steps:
  defineLinearModels:
    run: defineLinearModels.cwl
    in:
      carscores: carscores
      predictionlist: predictionlist
      max_no_predictor: max_no_predictor            
    out: [models, matches]
 
  calculateLinearModels:
    run: calculateLinearModels.cwl
    in:
      models: defineLinearModels/models
      matches: defineLinearModels/matches
    out: [coefficient_values, model_errors]

  simplifyLinearModels:
    run: simplifyLinearModels.cwl
    in:
      coefficient_values: calculateLinearModels/coefficient_values
      model_errors: calculateLinearModels/model_errors
    out: [linear_models]