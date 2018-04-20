
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 RecordID: 
  type: string 
 
 matching_local_authority_source_record: 
  type: string 
 
 original_scientificName: 
  type: string 
 
outputs: 
 name_val_log: 
  type: string 
 
 rejected_record_count: 
  type: string 
 
baseCommand: 