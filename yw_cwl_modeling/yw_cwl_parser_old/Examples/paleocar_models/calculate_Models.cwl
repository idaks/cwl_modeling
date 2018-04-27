
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
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
 

baseCommand: 