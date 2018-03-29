
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement
inputs: 
  predlist: 
   type: string 
  carscores: 
   type: string 
  max_preds: 
   type: string 
outputs: 
  linear_models: 
   type: string 
   outputSource: simplifyLinearModels/final_models
steps: 
 defineLinearModels: 
  run: cwl_files/defineLinearModels.cwl 
  in: 
   predlist: get_predlist/predlist
   carscores: get_carscores/carscores
   max_preds: get_predictor_matrix/max_preds
  out: [models , matches] 
 calculateLinearModels: 
  run: cwl_files/calculateLinearModels.cwl 
  in: 
   models: defineLinearModels/models
   matches: defineLinearModels/matches
  out: [coefficients , model_errors] 
 simplifyLinearModels: 
  run: cwl_files/simplifyLinearModels.cwl 
  in: 
   coefficients: calculateLinearModels/coefficients
   model_errors: calculateLinearModels/model_errors
  out: [final_models] 
 