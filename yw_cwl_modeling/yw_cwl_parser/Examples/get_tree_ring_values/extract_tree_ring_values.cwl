
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 models: 
  type: string 
 
 calibration_year: 
  type: string 
 
outputs: 
 tree_ring_values: 
  type: string 
 

baseCommand: 