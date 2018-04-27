
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 width: 
  type: string 
 
 polygon: 
  type: string 
 
 quadsegs: 
  type: string 
 
outputs: 
 template: 
  type: string 
 

baseCommand: 