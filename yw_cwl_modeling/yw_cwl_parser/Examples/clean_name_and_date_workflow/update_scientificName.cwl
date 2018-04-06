
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 original_scientificName: 
  type: string 
 
 matching_local_authority_source_record: 
  type: string 
 
outputs: 
 updated_scientificName: 
  type: string 
 

baseCommand: 