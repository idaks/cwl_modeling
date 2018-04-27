
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 pred_year: 
  type: string 
 
 models: 
  type: string 
 
outputs: 
 prediction_graph: 
  type: string 
 
 prediction_model: 
  type: string 
 

baseCommand: 