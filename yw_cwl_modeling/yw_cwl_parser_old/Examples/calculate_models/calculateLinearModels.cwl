
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 models: 
  type: string 
 
 matches: 
  type: string 
 
outputs: 
 coefficients: 
  type: string 
 
 model.errors: 
  type: string 
 

baseCommand: 