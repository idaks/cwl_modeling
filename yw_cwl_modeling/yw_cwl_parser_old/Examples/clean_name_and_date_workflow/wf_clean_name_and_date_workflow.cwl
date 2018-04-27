
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
  name_val_log: 
   type: string 
   outputSource: Not in ports list/name_val_log
  output2_data: 
   type: string 
   outputSource: Not in ports list/output2_data
  date_val_log: 
   type: string 
   outputSource: Not in ports list/date_val_log
steps: 
 validate_scientificName_field_of_data: 
  run: wf_validate_scientificName_field_of_data.cwl 
  in: 
   local_authority_source: local_authority_source
   input1_data: input1_data
  out: [output1_data , name_val_log , record_id_data] 
 validate_eventDate_field_of_data: 
  run: wf_validate_eventDate_field_of_data.cwl 
  in: 
   output1_data: validate_scientificName_field_of_data/output1_data
   record_id_data: validate_scientificName_field_of_data/record_id_data
  out: [output2_data , date_val_log] 
 