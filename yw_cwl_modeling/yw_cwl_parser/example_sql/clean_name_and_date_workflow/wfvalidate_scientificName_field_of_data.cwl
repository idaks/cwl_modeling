
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
inputs: 
 input1_data: 
  type: string 
 
 local_authority_source: 
  type: string 
 
outputs: 
 _YW_OUT_match_result: 
  type: string 
 
 _YW_OUT_matching_local_authority_source_record: 
  type: string 
 
 _YW_OUT_matching_method: 
  type: string 
 
 name_val_log: 
  type: string 
 
 output1_data: 
  type: string 
 
 record_id_data: 
  type: string 
 
baseCommand: 