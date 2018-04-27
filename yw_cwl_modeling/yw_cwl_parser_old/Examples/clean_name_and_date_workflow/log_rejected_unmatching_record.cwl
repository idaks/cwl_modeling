
#!/usr/bin/env cwl-runner


cwlVersion: v1.0
class: CommandLineTool
inputs: 
 RecordID: 
  type: string 
 
 original_scientificName: 
  type: string 
 
 matching_local_authority_source_record: 
  type: string 
 
outputs: 
 rejected_record_count: 
  type: string 
 
 name_val_log: 
  type: string 
 

baseCommand: 