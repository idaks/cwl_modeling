
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement
inputs: 
  paleocar_models: 
   type: string 
  calibration_year: 
   type: string 
outputs: 
  tree_ring_values: 
   type: string 
   outputSource: extract_tree_ring_values/tree_ring_values
steps: 
 extract_tree_ring_values: 
  run: extract_tree_ring_values.cwl 
  in: 
   models: paleocar_models
   calibration_year: calibration_year
  out: [tree_ring_values] 
 