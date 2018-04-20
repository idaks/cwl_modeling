#!/usr/bin/env cwl-runner 
cwlVersion: v1.0 
class: Workflow 
requirements: 
  - class: SubworkflowFeatureRequirement 
inputs: 
 carscores: 
  type: string 
 
 max.preds: 
  type: string 
 
 predlist: 
  type: string 
 
outputs: 
  linear.models: 
   type: string 
   outputSource: simplifyLinearModels/final.models
steps: 
 defineLinearModels: 
  run: defineLinearModels.cwl 
  in: 
   carscores: carscores
   max.preds: max.preds
   predlist: predlist
  out: [matches,models] 
 calculateLinearModels: 
  run: calculateLinearModels.cwl 
  in: 
   matches: defineLinearModels/matches
   models: defineLinearModels/models
  out: [coefficients,model.errors] 
 simplifyLinearModels: 
  run: simplifyLinearModels.cwl 
  in: 
   coefficients: calculateLinearModels/coefficients
   model.errors: calculateLinearModels/model.errors
  out: [final.models] 
 