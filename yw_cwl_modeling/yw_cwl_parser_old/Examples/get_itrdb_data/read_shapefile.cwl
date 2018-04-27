
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 layer: 
  type: string 
 
 dir: 
  type: string 
 
outputs: 
 dataobject: 
  type: string 
 

baseCommand: 