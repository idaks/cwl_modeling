
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 linear_models: 
  type: string 
 
outputs: 
 paleocar_models: 
  type: string 
 

baseCommand: 