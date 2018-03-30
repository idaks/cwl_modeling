
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 dir_name: 
  type: string 
 
outputs: 
 user_created_dir: 
  type: string 
 

baseCommand: 