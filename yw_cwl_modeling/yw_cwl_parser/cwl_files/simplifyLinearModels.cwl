
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 coefficients: 
  type: string 
 
 model_errors: 
  type: string 
 
outputs: 
 final_models: 
  type: string 
 

baseCommand: 