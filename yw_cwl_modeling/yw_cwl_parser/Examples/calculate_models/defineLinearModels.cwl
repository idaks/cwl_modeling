
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 predlist: 
  type: string 
 
 carscores: 
  type: string 
 
 max.preds: 
  type: string 
 
outputs: 
 models: 
  type: string 
 
 matches: 
  type: string 
 

baseCommand: 