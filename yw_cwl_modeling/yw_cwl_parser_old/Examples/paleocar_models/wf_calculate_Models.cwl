
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
  run: defineLinearModels.cwl 
  in: 
   predlist: predlist
   carscores: carscores
   max_preds: max_preds
  out: [models , matches] 
 calculateLinearModels: 
  run: calculateLinearModels.cwl 
  in: 
   models: defineLinearModels/models
   matches: defineLinearModels/matches
  out: [coefficients , model_errors] 
 simplifyLinearModels: 
  run: simplifyLinearModels.cwl 
  in: 
   coefficients: calculateLinearModels/coefficients
   model_errors: calculateLinearModels/model_errors
  out: [final_models] 
 