
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 dir: 
  type: string 
 
 file_archive: 
  type: string 
 
outputs: 
 compressed_shapefile: 
  type: string 
 
baseCommand: 