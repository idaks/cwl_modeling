
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 polygon: 
  type: string 
 
 quadsegs: 
  type: string 
 
 width: 
  type: string 
 
outputs: 
 template: 
  type: string 
 
baseCommand: 