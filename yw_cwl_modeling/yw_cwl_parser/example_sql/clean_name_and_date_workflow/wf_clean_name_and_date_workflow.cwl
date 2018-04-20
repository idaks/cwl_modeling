
#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement

inputs: 
 input1_data: 
  type: string 
 
 local_authority_source: 
  type: string 
 
outputs: 
  date_val_log: 
   type: string 
   outputSource: log_summary/date_val_log
  name_val_log: 
   type: string 
   outputSource: log_summary/name_val_log
  output2_data: 
   type: string 
   outputSource: validate_eventDate_field_of_data/output2_data
steps: 
 validate_scientificName_field_of_data: 
  run: wfvalidate_scientificName_field_of_data.cwl 
  in: 
   input1_data: input1_data
   local_authority_source: local_authority_source
  out: [_YW_OUT_match_result,_YW_OUT_matching_local_authority_source_record,_YW_OUT_matching_method,name_val_log,output1_data,record_id_data] 
 validate_eventDate_field_of_data: 
  run: wfvalidate_eventDate_field_of_data.cwl 
  in: 
   _YW_IN_input2_data: _YW_IN_input2_data
   output1_data: validate_scientificName_field_of_data/output1_data
   record_id_data: validate_scientificName_field_of_data/record_id_data
  out: [_YW_OUT_final_result,_YW_OUT_final_result,date_val_log,output2_data] 
 