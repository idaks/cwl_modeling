
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 file_archive: 
  type: string 
 
 dir: 
  type: string 
 
outputs: 
 compressed_shapefile: 
  type: string 
 

baseCommand: 