
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 historical_precip_data: 
  type: string 
 
 tree_ring_data: 
  type: string 
 
outputs: 
 prism_data: 
  type: string 
 
 itrdb: 
  type: string 
 

baseCommand: 