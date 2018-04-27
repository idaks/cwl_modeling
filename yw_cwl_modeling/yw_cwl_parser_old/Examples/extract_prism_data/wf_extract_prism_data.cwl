
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement
inputs: 
  coordinates: 
   type: string 
  prism_data: 
   type: string 
outputs: 
  prism_data_for_coordinates: 
   type: string 
   outputSource: extract_prism_data/prism_data_for_coordinates
steps: 
 extract_prism_data: 
  run: extract_prism_data.cwl 
  in: 
   coordinates: coordinates
   prism_data: prism_data
  out: [prism_data_for_coordinates] 
 