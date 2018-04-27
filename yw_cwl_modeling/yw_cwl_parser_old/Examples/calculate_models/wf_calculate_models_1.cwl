
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
  max.preds: 
   type: string 
outputs: 
  linear.models: 
   type: string 
   outputSource: simplifyLinearModels/final.models
steps: 
 defineLinearModels: 
  run: defineLinearModels.cwl 
  in: 
   predlist: predlist
   carscores: carscores
   max.preds: max.preds
  out: [models , matches] 
 calculateLinearModels: 
  run: calculateLinearModels.cwl 
  in: 
   models: defineLinearModels/models
   matches: defineLinearModels/matches
  out: [coefficients , model.errors] 
 simplifyLinearModels: 
  run: simplifyLinearModels.cwl 
  in: 
   coefficients: calculateLinearModels/coefficients
   model.errors: calculateLinearModels/model.errors
  out: [final.models] 
 