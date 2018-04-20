
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 local_authority_source: 
  type: string 
 
outputs: 
 local_authority_source_scientificName_lst: 
  type: string 
 
baseCommand: 