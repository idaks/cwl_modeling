
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement

inputs: 
 carscores: 
  type: string 
 
 max_preds: 
  type: string 
 
 predlist: 
  type: string 
 
outputs: 
  linear_models: 
   type: string 
   outputSource: simplifyLinearModels/final_models
steps: 
 defineLinearModels: 
  run: defineLinearModels.cwl 
  in: 
   carscores: get_carscores/carscores
   max_preds: get_predictor_matrix/max_preds
   predlist: get_predlist/predlist
  out: [matches,models] 
 calculateLinearModels: 
  run: calculateLinearModels.cwl 
  in: 
   matches: defineLinearModels/matches
   models: defineLinearModels/models
  out: [coefficients,model_errors] 
 simplifyLinearModels: 
  run: simplifyLinearModels.cwl 
  in: 
   coefficients: calculateLinearModels/coefficients
   model_errors: calculateLinearModels/model_errors
  out: [final_models] 
 